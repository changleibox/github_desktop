/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/widget/animated_expandable.dart';
import 'package:github_desktop/widget/incorrext.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 登录回调
typedef LoggedCallback = void Function(String clientId, String clientSecret);

const _textFieldPadding = EdgeInsets.symmetric(
  horizontal: 12,
  vertical: 6,
);
const _textFieldStyle = TextStyle(
  fontSize: 14,
);

/// Created by changlei on 3/5/21.
///
/// github登录
class GithubLogin extends StatefulWidget {
  /// 初始化登录控件
  const GithubLogin({
    Key key,
    this.clientId,
    this.clientSecret,
    @required this.githubScopes,
    this.onLogged,
    this.onError,
  })  : assert(githubScopes != null),
        super(key: key);

  /// client id
  final String clientId;

  /// client secret
  final String clientSecret;

  /// scopes
  final List<String> githubScopes;

  /// 登录回调
  final LoggedCallback onLogged;

  /// 登录失败回调
  final ValueChanged<dynamic> onError;

  @override
  _GithubLoginState createState() => _GithubLoginState();
}

class _GithubLoginState extends State<GithubLogin> {
  final _clientIdController = TextEditingController();
  final _clientSecretController = TextEditingController();

  HttpServer _redirectServer;
  bool _isSigning = false;
  String _errorMessage;

  @override
  void initState() {
    _clientIdController.text = widget.clientId;
    _clientSecretController.text = widget.clientSecret;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant GithubLogin oldWidget) {
    if (oldWidget.clientId != widget.clientId) {
      _clientIdController.text = widget.clientId;
    }
    if (oldWidget.clientSecret != widget.clientSecret) {
      _clientSecretController.text = widget.clientSecret;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _clientIdController.dispose();
    _clientSecretController.dispose();
    _redirectServer?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 308,
      child: Column(
        children: [
          AnimatedExpandable(
            isExpanded: _errorMessage != null,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Incorrect(
                message: Text(
                  _errorMessage ?? '',
                  overflow: TextOverflow.ellipsis,
                ),
                onClose: () {
                  setState(() {
                    _errorMessage = null;
                  });
                },
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: colorBgTertiary,
              borderRadius: primaryBorderRadius,
              border: Border.fromBorderSide(primaryBorderSide),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Client ID',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 30,
                  child: CupertinoTextField(
                    controller: _clientIdController,
                    decoration: primaryInputBorderDecoration,
                    style: _textFieldStyle,
                    padding: _textFieldPadding,
                    autofillHints: const [
                      AutofillHints.username,
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        'Client secret',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 30,
                  child: CupertinoTextField(
                    controller: _clientSecretController,
                    style: _textFieldStyle,
                    decoration: primaryInputBorderDecoration,
                    obscureText: true,
                    padding: _textFieldPadding,
                    autofillHints: const [
                      AutofillHints.password,
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: primaryBtnBorderDecoration,
                  child: CupertinoButton(
                    minSize: 30,
                    padding: EdgeInsets.zero,
                    color: colorBtnPrimaryBg,
                    disabledColor: colorBtnPrimaryDisabledBg,
                    borderRadius: primaryBorderRadius,
                    onPressed: _isSigning ? null : _onLoginPressed,
                    child: Text(
                      _isSigning ? 'Signing in...' : 'Sign in',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onLoginPressed() async {
    final clientId = _clientIdController.text;
    final clientSecret = _clientSecretController.text;
    if (clientId.isEmpty || clientSecret.isEmpty) {
      setState(() {
        _errorMessage = 'Incorrect client ID or client secret.';
      });
      return;
    }
    await _showSaveAuthInfoDialog(clientId, clientSecret);
    setState(() {
      _isSigning = true;
      _errorMessage = null;
    });
    final userModel = context.read<UserModel>();
    try {
      _redirectServer = await userModel.signIn(clientId, clientSecret, scopes: widget.githubScopes);
      widget.onLogged?.call(clientId, clientSecret);
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
        });
      }
      widget.onError?.call(e);
      rethrow;
    } finally {
      if (mounted) {
        setState(() {
          _isSigning = false;
        });
      }
    }
  }

  Future<void> _showSaveAuthInfoDialog(String clientId, String clientSecret) async {
    final instance = await SharedPreferences.getInstance();
    final oldClientId = instance.getString('clientId');
    final oldClientSecret = instance.getString('clientSecret');
    if (clientId == oldClientId && clientSecret == oldClientSecret) {
      return;
    }
    final isUpdate = oldClientId?.isNotEmpty == true || oldClientSecret?.isNotEmpty == true;
    await showCupertinoDialog<void>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('提示'),
          content: Text('是否${isUpdate ? '更新' : '保存'}Client ID和Client secret？'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('不保存'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () async {
                await instance.setString('clientId', clientId);
                await instance.setString('clientSecret', clientSecret);
                Navigator.pop(context);
              },
              child: const Text('保存'),
            ),
          ],
        );
      },
    );
  }
}
