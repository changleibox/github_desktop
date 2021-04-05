/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:ui';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/system/route.dart';
import 'package:provider/provider.dart';

const _scrollBehavior = ScrollBehavior();

void main() {
  runApp(DesktopApp());
  doWhenWindowReady(() {
    const size = Size(1300, 900);
    appWindow.title = 'GitHub桌面版';
    appWindow.minSize = size;
    appWindow.size = size;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

/// Created by changlei on 2021/03/05.
///
/// 主页面
class DesktopApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserModel(),
        ),
      ],
      child: Consumer<UserModel>(
        builder: (context, value, child) {
          return CupertinoApp(
            title: 'GitHub桌面版',
            theme: CupertinoThemeData(
              primaryColor: primaryColor,
              brightness: Brightness.light,
              barBackgroundColor: CupertinoColors.white,
              scaffoldBackgroundColor: CupertinoColors.white,
              textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(
                  color: colorTextPrimary,
                  fontFamily: '${fontFamilies.join(',')};',
                ),
              ),
            ),
            localizationsDelegates: const [
              DefaultCupertinoLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
            ],
            initialRoute: RouteName.main,
            routes: RouteProvider.routes,
            scrollBehavior: _scrollBehavior.copyWith(
              scrollbars: false,
              platform: TargetPlatform.macOS,
            ),
          );
        },
      ),
    );
  }
}
