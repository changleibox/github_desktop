/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/page/Issues_page.dart';
import 'package:github_desktop/page/explore_page.dart';
import 'package:github_desktop/page/home_page.dart';
import 'package:github_desktop/page/login_page.dart';
import 'package:github_desktop/page/main_page.dart';
import 'package:github_desktop/page/marketplace_page.dart';
import 'package:github_desktop/page/pull_requests_page.dart';
import 'package:github_desktop/page/repositories_page.dart';

/// Created by changlei on 3/5/21.
///
/// 路由
class RouteName {
  const RouteName._();

  /// 主页面
  static const String main = '/';

  /// 首页
  static const String home = 'home';

  /// 登录
  static const String login = 'login';

  /// Pull requests
  static const String pullRequests = 'pullRequests';

  /// Issues
  static const String issues = 'issues';

  /// Marketplace
  static const String marketplace = 'marketplace';

  /// Explore
  static const String explore = 'explore';

  /// Repositories
  static const String repositories = 'repositories';
}

/// 提供路由
class RouteProvider {
  const RouteProvider._();

  /// 路由
  static final routes = <String, WidgetBuilder>{
    RouteName.main: (context) => MainPage(),
    RouteName.home: (context) => HomePage(),
    RouteName.login: (context) => LoginPage(),
    RouteName.pullRequests: (context) => PullRequestsPage(),
    RouteName.issues: (context) => IssuesPage(),
    RouteName.marketplace: (context) => MarketplacePage(),
    RouteName.explore: (context) => ExplorePage(),
    RouteName.repositories: (context) => RepositoriesPage(),
  };
}
