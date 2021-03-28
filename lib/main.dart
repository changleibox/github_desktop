/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/system/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DesktopApp());
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
            title: 'GitHub',
            theme: CupertinoThemeData(
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
              DefaultMaterialLocalizations.delegate,
            ],
            initialRoute: RouteName.main,
            routes: RouteProvider.routes,
          );
        },
      ),
    );
  }
}
