/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/system/route.dart';
import 'package:github_desktop/widget/action_bar_search.dart';
import 'package:github_desktop/widget/action_bar_user.dart';
import 'package:fluttericon/octicons_icons.dart';

const _actionTextStyle = TextStyle(
  color: colorHeaderLogo,
  fontWeight: FontWeight.w600,
  fontSize: 14,
);

/// Created by changlei on 3/8/21.
///
/// 标题栏
class GithubActionBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  /// 初始化
  const GithubActionBar({
    Key key,
    this.backgroundColor = colorHeaderBg,
    this.height = 62,
  }) : super(key: key);

  /// 背景颜色
  final Color backgroundColor;

  /// 高度
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
      child: Row(
        children: [
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.popUntil(
                context,
                ModalRoute.withName(RouteName.home),
              );
            },
            child: const Icon(
              Octicons.mark_github,
              size: 32,
              color: colorHeaderLogo,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          ActionBarSearch(),
          const SizedBox(
            width: 16,
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.pullRequests,
                ModalRoute.withName(RouteName.home),
              );
            },
            child: const Text(
              'Pull requests',
              style: _actionTextStyle,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.issues,
                ModalRoute.withName(RouteName.home),
              );
            },
            child: const Text(
              'Issues',
              style: _actionTextStyle,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.marketplace,
                ModalRoute.withName(RouteName.home),
              );
            },
            child: const Text(
              'Marketplace',
              style: _actionTextStyle,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.explore,
                ModalRoute.withName(RouteName.home),
              );
            },
            child: const Text(
              'Explore',
              style: _actionTextStyle,
            ),
          ),
          const Spacer(),
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Octicons.plus,
                  size: 14,
                  color: colorHeaderLogo,
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Octicons.triangle_down,
                  size: 10,
                  color: colorHeaderLogo,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          ActionBarUser(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(height);
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final backgroundColor = CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
        CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}
