/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:math';

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/support_tooltip.dart';
import 'package:intl/intl.dart';

/// 构建dateTime控件
typedef DateTimeDataBuilder = double Function(DateTime dateTime, int index);

const _calendarColors = [
  Color(0xffebedf0),
  Color(0xff9be9a8),
  Color(0xff40c463),
  Color(0xff30a14e),
  Color(0xff216e39),
];
const _weeks = ['Mon', 'Wed', 'Fri'];
const _row = 7;
const _column = 53;
const _spacing = 4.0;
const _size = 11.0;
const _textStyle = TextStyle(
  fontSize: 9,
  color: colorTextPrimary,
);

Decoration _decoration(Color color) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(2),
    border: Border.all(
      color: const Color.fromRGBO(27, 31, 35, 0.06),
      width: 1,
    ),
  );
}

/// Created by box on 3/28/21.
///
/// 日历热力图
class CalendarHeatMap extends StatelessWidget {
  /// 构造函数
  const CalendarHeatMap({
    Key key,
    @required this.dataBuilder,
    this.year,
    this.action,
  })  : assert(dataBuilder != null),
        super(key: key);

  /// 构建item
  final DateTimeDataBuilder dataBuilder;

  /// action
  final Widget action;

  /// 年
  final int year;

  @override
  Widget build(BuildContext context) {
    final year = this.year ?? DateTime.now().year;
    final start = DateTime(year, 1, 1);
    final end = DateTime(year, 12, 31);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: WidgetGroup.spacing(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          spacing: 2,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: IntrinsicHeight(
                child: WidgetGroup.spacing(
                  spacing: 8,
                  children: [
                    _PrimaryYAxis(),
                    IntrinsicWidth(
                      child: WidgetGroup.spacing(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        direction: Axis.vertical,
                        spacing: 8,
                        children: [
                          _PrimaryXAxis(
                            year: year,
                          ),
                          _CalendarChart(
                            start: start,
                            end: end,
                            dataBuilder: dataBuilder,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _Legend(
              action: action,
            ),
          ],
        ),
      ),
    );
  }
}

class _CalendarChart extends StatelessWidget {
  const _CalendarChart({
    Key key,
    @required this.start,
    @required this.end,
    @required this.dataBuilder,
  })  : assert(start != null && end != null),
        super(key: key);

  final DateTime start;
  final DateTime end;
  final DateTimeDataBuilder dataBuilder;

  @override
  Widget build(BuildContext context) {
    final startWeekday = start.weekday % 7;
    final data = List.generate(_column, (column) {
      return List.generate(_row, (row) {
        final index = _row * column + row - startWeekday;
        final dateTime = start.add(Duration(days: index));
        double data;
        if (index >= 0 && !dateTime.isAfter(end)) {
          data = dataBuilder(dateTime, index);
        }
        return MapEntry(dateTime, data);
      });
    });
    final maxValue = data.expand((element) => element.map((e) => e.value)).where((element) => element != null).reduce(max);
    return WidgetGroup.separated(
      itemCount: data.length,
      itemBuilder: (context, column) {
        final columns = data[column];
        return WidgetGroup.separated(
          direction: Axis.vertical,
          itemCount: _row,
          itemBuilder: (context, row) {
            final data = columns[row];
            final dateTime = data.key;
            final value = data.value;
            Decoration decoration;
            if (value != null) {
              var color = _calendarColors.first;
              if (maxValue != 0) {
                color = _calendarColors[value * (_calendarColors.length - 1) ~/ maxValue];
              }
              decoration = _decoration(color);
            }
            return SupportTooltip(
              message: _Tooltip(
                dateTime: dateTime,
                value: value,
              ),
              child: Container(
                width: _size,
                height: _size,
                decoration: decoration,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: _spacing,
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: _spacing,
        );
      },
    );
  }
}

class _Tooltip extends StatelessWidget {
  const _Tooltip({
    Key key,
    @required this.dateTime,
    @required this.value,
  })  : assert(dateTime != null),
        super(key: key);

  final DateTime dateTime;
  final double value;

  @override
  Widget build(BuildContext context) {
    return WidgetGroup(
      mainAxisSize: MainAxisSize.min,
      divider: const Text(' '),
      children: [
        Text(
          '${value == null || value == 0 ? 'No' : value.toString()} contribution',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'on ${DateFormat.yMMMMd().format(dateTime)}',
          style: const TextStyle(
            color: Color(0xff959da5),
          ),
        ),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({
    Key key,
    @required this.action,
  }) : super(key: key);

  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 4,
      ),
      alignment: Alignment.center,
      child: WidgetGroup(
        children: [
          if (action != null) action,
          const Spacer(),
          IconLabel(
            horizontalSpacing: 4,
            leftIcon: const Text(
              'Less',
              style: TextStyle(
                color: colorTextSecondary,
                fontSize: 12,
              ),
            ),
            rightIcon: const Text(
              'More',
              style: TextStyle(
                color: colorTextSecondary,
                fontSize: 12,
              ),
            ),
            label: WidgetGroup.separated(
              itemCount: _calendarColors.length,
              itemBuilder: (context, index) {
                return Container(
                  width: _size,
                  height: _size,
                  decoration: _decoration(_calendarColors[index]),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 4,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryXAxis extends StatelessWidget {
  const _PrimaryXAxis({
    Key key,
    @required this.year,
  })  : assert(year != null),
        super(key: key);

  final int year;

  @override
  Widget build(BuildContext context) {
    final startWeekday = DateTime(year, 1).weekday;
    return WidgetGroup.separated(
      alignment: MainAxisAlignment.start,
      itemCount: 12,
      itemBuilder: (context, index) {
        final dateTime = DateTime(year, index + 1);
        final daysInMonth = DateUtils.getDaysInMonth(year, dateTime.month);
        var count = ((daysInMonth + dateTime.weekday - 7) / 7).ceil();
        if (index == 0 && startWeekday != 7) {
          count += 1;
        }
        return Container(
          width: _size * count + (count - 1) * _spacing,
          child: Text(
            DateFormat.MMM().format(dateTime),
            style: _textStyle,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: _spacing,
        );
      },
    );
  }
}

class _PrimaryYAxis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 18,
      ),
      child: WidgetGroup.separated(
        direction: Axis.vertical,
        itemCount: _weeks.length,
        itemBuilder: (context, index) {
          return Container(
            height: _size * 2 + _spacing,
            alignment: Alignment.bottomCenter,
            child: Text(
              _weeks[index],
              style: _textStyle,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: _spacing,
          );
        },
      ),
    );
  }
}
