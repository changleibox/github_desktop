/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/hover_button.dart';
import 'package:github_desktop/widget/hover_outline_button.dart';
import 'package:github_desktop/widget/vertical_tab_layout.dart';
import 'package:provider/provider.dart';

/// Created by box on 3/27/21.
///
/// Contribution activity
class ContributionActivity extends StatefulWidget {
  /// 构造函数
  const ContributionActivity({
    Key key,
    this.year,
    this.onYearChanged,
  }) : super(key: key);

  /// 年
  final int year;

  /// 年变化
  final ValueChanged<int> onYearChanged;

  @override
  _ContributionActivityState createState() => _ContributionActivityState();
}

class _ContributionActivityState extends State<ContributionActivity> {
  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    return Container(
      child: WidgetGroup.spacing(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32,
        children: [
          Expanded(
            child: WidgetGroup.spacing(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              direction: Axis.vertical,
              spacing: 16,
              children: <Widget>[
                Container(
                  height: 24,
                  child: const Text(
                    'Contribution activity',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  child: WidgetGroup.builder(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    direction: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return _ActivityItem(
                        year: widget.year,
                        month: index,
                      );
                    },
                  ),
                ),
                HoverOutlineButton.fill(
                  minSize: 36,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 6,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Show more activity',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.05,
                      fontWeight: FontWeight.w600,
                      color: CupertinoTheme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 116,
            child: VerticalTabLayout(
              selectedIndex: widget.year == null ? null : year - widget.year,
              onChanged: (value) {
                widget.onYearChanged?.call(year - value);
              },
              children: List.generate(5, (index) {
                return Text((year - index).toString());
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  const _ActivityItem({
    Key key,
    @required this.year,
    @required this.month,
  })  : assert(year != null),
        assert(month != null),
        super(key: key);

  final int year;
  final int month;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: WidgetGroup.spacing(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        spacing: 10,
        children: <Widget>[
          WidgetGroup(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 16,
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'March',
                      ),
                      const TextSpan(
                        text: ' ',
                      ),
                      TextSpan(
                        text: year.toString(),
                        style: const TextStyle(
                          color: colorTextSecondary,
                        ),
                      ),
                    ],
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              const Expanded(
                child: CupertinoDivider(),
              ),
            ],
          ),
          if (month % 2 == 0)
            _NoActivityTips()
          else
            WidgetGroup.builder(
              direction: Axis.vertical,
              itemCount: 2,
              itemBuilder: (context, index) {
                return IntrinsicHeight(
                  child: WidgetGroup.spacing(
                    spacing: 8,
                    children: <Widget>[
                      _TimelineDivider(
                        month: index,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 16,
                          ),
                          child: index % 2 == 0 ? _RepositoriesTimeline() : _IssuesTimeline(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _TimelineDivider extends StatelessWidget {
  const _TimelineDivider({
    Key key,
    @required this.month,
  })  : assert(month != null),
        super(key: key);

  final int month;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const CupertinoVerticalDivider(
            width: 2,
            thickness: 2,
          ),
          Positioned(
            top: 16,
            width: 28,
            height: 28,
            child: Container(
              decoration: const ShapeDecoration(
                color: colorTimelineBadgeBg,
                shape: CircleBorder(
                  side: BorderSide(
                    color: CupertinoColors.white,
                    width: 2,
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Icon(
                month % 2 == 0 ? Octicons.repo : Octicons.flame,
                size: 16,
                color: colorTextSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoActivityTips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      alignment: Alignment.center,
      child: Text(
        '${context.watch<UserModel>().viewer.login} had no activity during this period.',
        style: const TextStyle(
          fontSize: 14,
          color: colorTextSecondary,
        ),
      ),
    );
  }
}

class _RepositoriesTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetGroup(
      direction: Axis.vertical,
      children: [
        Container(
          height: 28,
          alignment: Alignment.center,
          child: WidgetGroup(
            children: [
              const Text(
                'Created 4 repositories',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              HoverButton(
                onPressed: () {},
                foregroundColor: colorTextSecondary,
                child: const Icon(
                  Octicons.unfold,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
        // _NoActivityTips(),
        _RepositoriesActivity(),
      ],
    );
  }
}

class _RepositoriesActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: WidgetGroup.builder(
        direction: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            height: 22,
            child: WidgetGroup.spacing(
              spacing: 8,
              children: [
                Expanded(
                  child: IconLabel(
                    alignment: MainAxisAlignment.start,
                    horizontalSpacing: 4,
                    label: HoverButton(
                      onPressed: () {},
                      hoverStyle: HoverStyle.solid,
                      child: const Text(
                        'changleibox/flutter_echart',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    leftIcon: const Icon(
                      Octicons.repo_forked,
                      size: 14,
                      color: colorTextTertiary,
                    ),
                  ),
                ),
                Container(
                  width: 116,
                  child: IconLabel(
                    alignment: MainAxisAlignment.start,
                    horizontalSpacing: 4,
                    label: const Text(
                      'Dart',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorTextSecondary,
                      ),
                    ),
                    leftIcon: Container(
                      width: 12,
                      height: 12,
                      clipBehavior: Clip.antiAlias,
                      decoration: const ShapeDecoration(
                        color: Color(0xffcccccc),
                        shape: CircleBorder(
                          side: BorderSide(
                            color: colorRepoLanguageColorBorder,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 116,
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Mar 12',
                    style: TextStyle(
                      fontSize: 12,
                      color: colorTextTertiary,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _IssuesTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetGroup.spacing(
      direction: Axis.vertical,
      spacing: 8,
      children: [
        Container(
          height: 28,
          alignment: Alignment.center,
          child: WidgetGroup(
            children: <Widget>[
              const Text(
                'Created an issue in flutter/flutter that received 5 comments',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              HoverButton(
                onPressed: () {},
                foregroundColor: colorTextTertiary,
                child: const Text(
                  'Mar 3',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        // _NoActivityTips(),
        _IssuesActivity(),
      ],
    );
  }
}

class _IssuesActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      decoration: primaryBorderDecoration,
      child: WidgetGroup.separated(
        direction: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          final textTheme = CupertinoTheme.of(context).textTheme;
          return Container(
            padding: const EdgeInsets.all(16),
            child: IconLabel(
              crossAxisAlignment: CrossAxisAlignment.start,
              horizontalSpacing: 8,
              leftIcon: Container(
                margin: const EdgeInsets.only(
                  top: 2,
                ),
                child: const Icon(
                  Octicons.issue_closed,
                  size: 16,
                  color: CupertinoColors.destructiveRed,
                ),
              ),
              label: Expanded(
                child: WidgetGroup.spacing(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  direction: Axis.vertical,
                  spacing: 8,
                  children: <Widget>[
                    HoverButton(
                      hoverStyle: HoverStyle.solid,
                      foregroundColor: textTheme.textStyle.color,
                      onPressed: () {},
                      child: const Text(
                        '[IOS] When the obscureText parameter of CupertinoTextField is set to true, '
                        'the focus is requested, then the focus is lost, and the application crashes',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Text(
                      'Steps to Reproduce CupertinoTextField设置obscureText为true；'
                      ' 点击输入框，请求焦点，键盘弹出，点击空白处失去焦点，键盘收起； 程序崩溃； '
                      '一次不行，就多重复以上步骤几次； Expected results: 程序正常运行 Actual…',
                      style: TextStyle(
                        fontSize: 14,
                        color: colorTextSecondary,
                      ),
                    ),
                    const Text(
                      '5 comments',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const CupertinoDivider();
        },
      ),
    );
  }
}
