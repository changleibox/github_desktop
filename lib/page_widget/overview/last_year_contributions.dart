/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:math';

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/calendar_heat_map.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/hover_button.dart';
import 'package:github_desktop/widget/support_dropdown_menu.dart';

/// Created by box on 3/27/21.
///
/// contributions in the last year
class LastYearContributions extends StatefulWidget {
  /// 构造函数
  const LastYearContributions({
    Key key,
    this.year,
  }) : super(key: key);

  /// 年
  final int year;

  @override
  _LastYearContributionsState createState() => _LastYearContributionsState();
}

class _LastYearContributionsState extends State<LastYearContributions> {
  final _dataMap = <DateTime, double>{};

  @override
  void initState() {
    _resolve();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LastYearContributions oldWidget) {
    if (oldWidget.year != widget.year) {
      _resolve();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _resolve() {
    final year = widget.year ?? DateTime.now().year;
    final endDate = DateTime(year, 12, 31);
    var dateTime = DateTime(year, 1, 1);
    while (!dateTime.isAfter(endDate)) {
      _dataMap[dateTime] = Random().nextInt(100).toDouble();
      dateTime = dateTime.add(const Duration(days: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CupertinoTheme.of(context).textTheme;
    return Container(
      child: WidgetGroup.spacing(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        spacing: 8,
        children: <Widget>[
          Container(
            height: 24,
            child: DefaultTextStyle(
              style: textTheme.textStyle.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              child: WidgetGroup(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '47 contributions in the last year',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  _ContributionSettings(),
                ],
              ),
            ),
          ),
          Container(
            height: 174,
            padding: const EdgeInsets.all(8),
            decoration: primaryBorderDecoration,
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(
                left: 56,
              ),
              alignment: Alignment.bottomCenter,
              child: CalendarHeatMap(
                year: widget.year,
                dataBuilder: (dateTime, index) {
                  return _dataMap[dateTime];
                },
                action: HoverButton(
                  onPressed: () {},
                  foregroundColor: colorTextSecondary,
                  child: const Text(
                    'Learn how we count contributions.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContributionSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: primaryBorderRadius,
      padding: EdgeInsets.zero,
      minSize: 30,
      onPressed: () async {
        final renderObject = context.findRenderObject() as RenderBox;
        final rect = Rect.fromPoints(
          renderObject.localToGlobal(Offset.zero),
          renderObject.localToGlobal(renderObject.size.bottomRight(Offset.zero)),
        );
        await showDropdownMenu<void>(
          context: context,
          indicateSize: const Size(14, 7),
          margin: 32,
          offset: -5,
          anchor: rect.translate(rect.width / 2 - 20, 0),
          items: [
            const SizedBox(
              height: 4,
            ),
            _ActionButton(
              title: const Text(
                'Private contributions',
              ),
              description: const Text(
                'Turning on private contributions will show anonymized'
                'private activity on your profile.',
              ),
              onPressed: () {},
            ),
            const CupertinoDivider(
              height: 16,
            ),
            _ActionButton(
              title: const Text(
                'Activity overview',
              ),
              description: const Text(
                'Turning on the activity overview will show an overview of your activity'
                'across organizations and repositories.',
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        );
      },
      child: HoverButton(
        onPressed: () {},
        foregroundColor: colorTextSecondary,
        child: const IconLabel(
          horizontalSpacing: 2,
          label: Text(
            'Contribution settings',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          rightIcon: Icon(
            Octicons.triangle_down,
            size: 10,
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    Key key,
    @required this.title,
    @required this.description,
    this.onPressed,
  })  : assert(title != null),
        assert(description != null),
        super(key: key);

  final Widget title;
  final Widget description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = DefaultTextStyle.of(context).style;
    return Container(
      width: 328,
      child: DropdownAction(
        onPressed: onPressed,
        padding: const EdgeInsets.only(
          left: 32,
          top: 4,
          right: 8,
          bottom: 4,
        ),
        child: WidgetGroup.spacing(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          spacing: 4,
          children: <Widget>[
            DefaultTextStyle(
              style: textStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              child: title,
            ),
            DefaultTextStyle(
              style: textStyle.copyWith(
                fontSize: 12,
              ),
              child: description,
            ),
          ],
        ),
      ),
    );
  }
}
