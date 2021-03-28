/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/util/html_utils.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/5/21.
///
/// github已登录
class GithubUser extends StatelessWidget {
  /// 初始化
  const GithubUser({
    Key key,
    this.size = 32,
    this.hasName = false,
    this.hasStatus = false,
  })  : assert(hasName != null),
        assert(hasStatus != null),
        super(key: key);

  /// 大小
  final double size;

  /// 是否显示名称
  final bool hasName;

  /// 是否显示状态
  final bool hasStatus;

  @override
  Widget build(BuildContext context) {
    final userModel = context.read<UserModel>();
    final icon = Icon(
      Octicons.mark_github,
      size: size,
      color: CupertinoColors.darkBackgroundGray,
    );
    final viewer = userModel.viewer;
    if (viewer == null) {
      return icon;
    }
    final emoji = viewer.status?.emojiHTML?.value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: viewer.avatarUrl.value,
                width: size,
                height: size,
                fit: BoxFit.cover,
                placeholder: (context, url) => icon,
                errorWidget: (context, url, dynamic error) => icon,
              ),
            ),
            if (hasStatus)
              Positioned(
                right: 0,
                bottom: 40,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const ShapeDecoration(
                    color: CupertinoColors.white,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: CupertinoColors.separator,
                        width: 0,
                      ),
                    ),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (emoji == null) {
                        return const Icon(
                          Octicons.smiley,
                          size: 16,
                          color: Color(0xff4d545c),
                        );
                      } else {
                        return Text(
                          HtmlUtils.strippedHtml(emoji),
                        );
                      }
                    },
                  ),
                ),
              ),
          ],
        ),
        if (hasName)
          Container(
            margin: const EdgeInsets.only(
              left: 8,
            ),
            child: Text(
              viewer.login,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
