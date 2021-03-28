/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/test_data.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/system/route.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/5/21.
///
/// 主页面
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: _imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return const CupertinoActivityIndicator();
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '欢迎使用GitHub',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                        color: CupertinoColors.white,
                        blurRadius: 4,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: CupertinoColors.white,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: CupertinoButton(
                    minSize: 32,
                    color: const Color(0xff2ea44f),
                    disabledColor: const Color(0xff94d3a2),
                    borderRadius: BorderRadius.circular(5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 6,
                    ),
                    onPressed: () async {
                      if (await context.read<UserModel>().isAutoSignIn()) {
                        await Navigator.popAndPushNamed(context, RouteName.home);
                      } else {
                        await Navigator.popAndPushNamed(context, RouteName.login);
                      }
                    },
                    child: const Text(
                      '去登录',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String get _imageUrl => testPictures[Random().nextInt(testPictures.length)];
}
