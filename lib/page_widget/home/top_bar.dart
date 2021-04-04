/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/widget/counter.dart';
import 'package:github_desktop/widget/github_user.dart';
import 'package:github_desktop/widget/hover_region.dart';
import 'package:provider/provider.dart';

const _indicatorSize = 2.0;

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
          child: Theme(
            data: Theme.of(context).copyWith(
              highlightColor: Colors.transparent,
            ),
            child: TabBar(
              indicatorColor: colorBorderBottom,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              onTap: onChanged,
              labelColor: textStyle.color,
              labelStyle: textStyle.copyWith(
                fontWeight: FontWeight.w600,
                height: 1.05,
              ),
              unselectedLabelColor: colorTextSecondary,
              unselectedLabelStyle: textStyle.copyWith(
                fontWeight: FontWeight.w600,
                height: 1.05,
              ),
              isScrollable: true,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              indicator: const BoxDecoration(),
              indicatorWeight: 0,
              tabs: <Widget>[
                _buildTab(
                  context,
                  text: 'Overview',
                  icon: Octicons.book,
                  index: 0,
                ),
                _buildTab(
                  context,
                  text: 'Repositories',
                  icon: Octicons.repo,
                  trailing: repositoriesCountLabel,
                  index: 1,
                ),
                _buildTab(
                  context,
                  text: 'Projects',
                  icon: Octicons.project,
                  index: 2,
                ),
                _buildTab(
                  context,
                  text: 'Packages',
                  icon: Octicons.package,
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTab(BuildContext context, {String text, IconData icon, Widget trailing, int index}) {
    return HoverRegion(
      builder: (context, child, hover) {
        final textStyle = CupertinoTheme.of(context).textTheme.textStyle;
        final selectedIndex = DefaultTabController.of(context).index;
        final selected = index == selectedIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          foregroundDecoration: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: selected ? colorBorderBottom : colorLabelBorder,
              width: hover || selected ? _indicatorSize : 0,
              style: hover || selected ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          child: SizedBox(
            height: 48,
            child: HoverRegion(
              builder: (context, child, hover) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
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
                      if (trailing != null) trailing,
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
