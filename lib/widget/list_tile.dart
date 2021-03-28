/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';

/// Created by changlei on 3/8/21.
///
/// 列表行
class CupertinoListTile extends StatelessWidget {
  /// 初始化
  const CupertinoListTile({
    Key key,
    @required this.title,
    this.subtitle,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 24,
    ),
    this.onPressed,
  })  : assert(title != null),
        super(key: key);

  /// 标题
  final Widget title;

  /// 子标题
  final Widget subtitle;

  /// 后缀
  final Widget trailing;

  /// 内边距
  final EdgeInsetsGeometry padding;

  /// 点击事件
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Container(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    onPressed: onPressed,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.systemBlue,
                      ),
                      child: title,
                    ),
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: colorTextSecondary,
                    ),
                    child: IconTheme(
                      data: const IconThemeData(
                        color: colorTextSecondary,
                        size: 14,
                      ),
                      child: subtitle,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: trailing,
              ),
          ],
        ),
      ),
    );
  }
}
