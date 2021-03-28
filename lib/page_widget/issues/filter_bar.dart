/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/widget/filter_button.dart';
import 'package:github_desktop/widget/github_user.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/8/21.
///
/// 使用在Issues和Pull requests的筛选栏
class IssuesFilterBar extends StatefulWidget {
  /// 初始化
  const IssuesFilterBar({
    Key key,
    @required this.icon,
    this.openedCount,
    this.closedCount,
    this.onOpened,
  })  : assert(icon != null),
        super(key: key);

  /// 标志的icon
  final Widget icon;

  /// 打开的数量
  final int openedCount;

  /// 关闭的数量
  final int closedCount;

  /// 点击打开或关闭
  final ValueChanged<bool> onOpened;

  @override
  _IssuesFilterBarState createState() => _IssuesFilterBarState();
}

class _IssuesFilterBarState extends State<IssuesFilterBar> {
  bool _isOpen = true;

  @override
  Widget build(BuildContext context) {
    final textColor = CupertinoTheme.of(context).textTheme.textStyle.color;
    final userModel = context.read<UserModel>();
    final viewer = userModel.viewer;
    return Container(
      color: const Color(0xfff6f8fa),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {
              setState(() {
                _isOpen = true;
              });
              widget.onOpened?.call(true);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconTheme(
                  data: IconThemeData(
                    size: 16,
                    color: _isOpen ? textColor : colorTextSecondary,
                  ),
                  child: widget.icon,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${widget.openedCount ?? 0} Open',
                  style: TextStyle(
                    color: _isOpen ? textColor : colorTextSecondary,
                    fontWeight: _isOpen ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: () {
              setState(() {
                _isOpen = false;
              });
              widget.onOpened?.call(false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Octicons.check,
                  size: 16,
                  color: !_isOpen ? textColor : colorTextSecondary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${widget.closedCount ?? 0} Closed',
                  style: TextStyle(
                    color: !_isOpen ? textColor : colorTextSecondary,
                    fontWeight: !_isOpen ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          FilterButton(
            title: const Text('Repository visibility'),
            items: const [
              'Private repositories only',
              'Public repositories only',
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Visibility',
                  style: TextStyle(
                    color: colorTextSecondary,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Octicons.triangle_down,
                  size: 8,
                  color: colorTextSecondary,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          AgileFilterButton(
            title: const Text('Filter by organization or owner'),
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: const CupertinoTextField(
                  decoration: primaryInputBorderDecoration,
                  placeholder: 'Filter organization',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
              FilterAction(
                leading: Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: const GithubUser(
                    size: 20,
                  ),
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: viewer?.login),
                      const WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        ),
                      ),
                      TextSpan(text: viewer?.name),
                    ],
                  ),
                ),
              ),
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Organization',
                  style: TextStyle(
                    color: colorTextSecondary,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Octicons.triangle_down,
                  size: 8,
                  color: colorTextSecondary,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          FilterButton(
            title: const Text('Sort by'),
            items: const [
              'Private repositories only',
              'Public repositories only',
            ],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Sort',
                  style: TextStyle(
                    color: colorTextSecondary,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Octicons.triangle_down,
                  size: 8,
                  color: colorTextSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
