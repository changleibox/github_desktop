/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

/// Created by changlei on 3/8/21.
///
/// 启动页面工具
class LaunchUtils {
  const LaunchUtils._();

  /// 打开一个url
  static Future<void> launchUrl(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Navigation error'),
            content: Text('Could not launch $url'),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }
}
