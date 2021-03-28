/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/github_gql/github_queries.data.gql.dart';
import 'package:github_desktop/github_gql/github_queries.req.gql.dart';
import 'package:github_desktop/system/exceptions.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:gql_link/gql_link.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final _authorizationEndpoint = Uri.parse('https://github.com/login/oauth/authorize');
final _tokenEndpoint = Uri.parse('https://github.com/login/oauth/access_token');

/// Created by changlei on 3/5/21.
///
/// 用户信息
class UserModel extends ChangeNotifier {
  final _httpClient = _JsonAcceptingHttpClient();

  oauth.Client _client;
  $ViewerDetail$viewer _viewer;

  HttpServer _redirectServer;

  /// 设置client
  oauth.Client get client => _client;

  /// viewer
  $ViewerDetail$viewer get viewer => _viewer;

  /// link
  HttpLink get link => createLink(_client);

  /// request
  Stream<Response> requestAsStream(Request request, [NextLink forward]) {
    return link.request(request, forward);
  }

  /// request
  Future<Response> request(Request request, [NextLink forward]) {
    return requestAsStream(request, forward).first;
  }

  /// link
  static HttpLink createLink(oauth.Client client) {
    assert(client != null, '请先登录');
    return HttpLink(
      'https://api.github.com/graphql',
      httpClient: client,
    );
  }

  /// 自动判断是否需要登录，true-不需要，false-需要
  Future<bool> isAutoSignIn() async {
    final preferences = await SharedPreferences.getInstance();
    final authDataJson = preferences.getString('authData');
    if (authDataJson == null) {
      return false;
    }
    final authData = json.decode(authDataJson) as Map<String, dynamic>;
    final viewerData = authData['viewer'] as Map<String, dynamic>;
    if (viewerData == null) {
      return false;
    }
    final cachedClientId = authData['clientId'] as String;
    final cachedClientSecret = authData['clientSecret'] as String;
    final authenticatedHttpClient = oauth.Client(
      oauth.Credentials.fromJson(authData['credentials'] as String),
      identifier: cachedClientId,
      secret: cachedClientSecret,
      httpClient: _httpClient,
    );
    _viewer = $ViewerDetail$viewer(viewerData);
    _client = authenticatedHttpClient;
    // ignore: unawaited_futures
    upgradeCaches(authenticatedHttpClient, cachedClientId, cachedClientSecret).then((value) {
      _viewer = $ViewerDetail$viewer(value['viewer'] as Map<String, dynamic>);
      notifyListeners();
    });
    return true;
  }

  /// 退出登录
  Future<$ViewerDetail$viewer> getViewer(oauth.Client client) async {
    final link = UserModel.createLink(client);
    final response = await link.request(ViewerDetail((b) => b)).first;
    if (response.errors != null && response.errors.isNotEmpty) {
      throw QueryException(response.errors);
    }
    return $ViewerDetail(response.data).viewer;
  }

  /// 更新缓存信息
  Future<Map<String, dynamic>> upgradeCaches(oauth.Client client, String clientId, String clientSecret) async {
    final viewer = await getViewer(client);
    final credentials = client.credentials;
    final preferences = await SharedPreferences.getInstance();
    final authData = <String, dynamic>{
      'credentials': credentials.toJson(),
      'clientId': clientId,
      'clientSecret': clientSecret,
      'viewer': viewer.data,
    };
    await preferences.setString('authData', json.encode(authData));
    return authData;
  }

  /// 退出登录
  Future<void> signOut() async {
    client?.close();
    _client = null;
    _viewer = null;
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('authData');
    notifyListeners();
  }

  /// 登录
  Future<HttpServer> signIn(String clientId, String clientSecret, {Iterable<String> scopes, String state}) async {
    await _redirectServer?.close();
    // Bind to an ephemeral port on localhost
    _redirectServer = await HttpServer.bind('localhost', 0);
    final redirectUrl = Uri.parse('http://localhost:${_redirectServer.port}/auth');
    final authenticatedHttpClient = await _getOAuth2Client(
      clientId,
      clientSecret,
      redirectUrl,
      scopes: scopes,
      state: state,
    );
    final authData = await upgradeCaches(
      authenticatedHttpClient,
      clientId,
      clientSecret,
    );
    _client = authenticatedHttpClient;
    _viewer = $ViewerDetail$viewer(authData['viewer'] as Map<String, dynamic>);
    notifyListeners();
    return _redirectServer;
  }

  Future<oauth.Client> _getOAuth2Client(
    String clientId,
    String clientSecret,
    Uri redirectUrl, {
    Iterable<String> scopes,
    String state,
  }) async {
    if (clientId?.isNotEmpty != true || clientSecret?.isNotEmpty != true) {
      throw const GithubLoginException(
        'clientId and clientSecret must be not empty.'
        'See `lib/github_oauth_credentials.dart` for more detail.',
      );
    }
    final grant = oauth.AuthorizationCodeGrant(
      clientId,
      _authorizationEndpoint,
      _tokenEndpoint,
      secret: clientSecret,
      httpClient: _httpClient,
    );
    final authorizationUrl = grant.getAuthorizationUrl(
      redirectUrl,
      scopes: scopes,
      state: state,
    );

    await _redirect(authorizationUrl);
    final responseQueryParameters = await _listen();
    return await grant.handleAuthorizationResponse(responseQueryParameters);
  }

  Future<void> _redirect(Uri authorizationUrl) async {
    final url = authorizationUrl.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw GithubLoginException('Could not launch $url');
    }
  }

  Future<Map<String, String>> _listen() async {
    final request = await _redirectServer.first;
    final parameters = request.uri.queryParameters;
    request.response.statusCode = 200;
    request.response.headers.set('content-type', 'text/plain');
    request.response.writeln('Authenticated! You can close this tab.');
    await request.response.close();
    await _redirectServer.close();
    _redirectServer = null;
    return parameters;
  }
}

class _JsonAcceptingHttpClient extends http.BaseClient {
  final _httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return _httpClient.send(request);
  }
}
