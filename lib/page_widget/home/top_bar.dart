/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/widget/counter.dart';
import 'package:github_desktop/widget/github_user.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/8/21.
///
/// 首页顶部操作栏
class TopBar extends StatelessWidget {
  /// 初始化
  const TopBar({
    Key key,
    this.onChanged,
  }) : super(key: key);

  /// tab点击事件
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;
    final userModel = context.read<UserModel>();
    final totalCount = userModel.viewer?.repositories?.totalCount ?? 0;
    Widget repositoriesCountLabel;
    if (totalCount > 0) {
      repositoriesCountLabel = Container(
        margin: const EdgeInsets.only(
          left: 8,
        ),
        child: Counter(
          child: Text(totalCount.toString()),
        ),
      );
    }
    return Row(
      children: [
        Container(
          width: 333,
          padding: const EdgeInsets.only(
            left: 32,
          ),
          alignment: Alignment.centerLeft,
          child: const GithubUser(
            hasName: true,
          ),
        ),
        Expanded(
          child: TabBar(
            indicatorColor: colorBorderBottom,
            labelPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            onTap: onChanged,
            labelColor: textStyle.color,
            labelStyle: textStyle.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.05,
            ),
            unselectedLabelColor: textStyle.color,
            unselectedLabelStyle: textStyle.copyWith(
              fontWeight: FontWeight.normal,
              height: 1.05,
            ),
            isScrollable: true,
            tabs: <Tab>[
              _buildTab(
                context,
                'Overview',
                Octicons.book,
              ),
              _buildTab(
                context,
                'Repositories',
                Octicons.repo,
                label: repositoriesCountLabel,
              ),
              _buildTab(
                context,
                'Projects',
                Octicons.project,
              ),
              _buildTab(
                context,
                'Packages',
                Octicons.package,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Tab _buildTab(BuildContext context, String text, IconData icon, {Widget label}) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;
    return Tab(
      iconMargin: EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textStyle.color,
            size: 16,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            // style: textStyle,
          ),
          if (label != null) label,
        ],
      ),
    );
  }
}
