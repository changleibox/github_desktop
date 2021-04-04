/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/segmented_control.dart';

/// Created by changlei on 3/8/21.
///
/// 筛选assignees
class AssignedBar extends StatefulWidget {
  /// 初始化
  const AssignedBar({
    Key key,
    this.controller,
    this.onAssignedChanged,
    this.onSubmitted,
    this.placeholder,
    @required this.items,
  })  : assert(items != null),
        super(key: key);

  /// 搜索框控制器
  final TextEditingController controller;

  /// 在assignees变更的时候
  final ValueChanged<String> onAssignedChanged;

  /// Invoked upon keyboard submission.
  final ValueChanged<String> onSubmitted;

  /// placeholder
  final String placeholder;

  /// items
  final Map<String, String> items;

  @override
  _AssignedBarState createState() => _AssignedBarState();
}

class _AssignedBarState extends State<AssignedBar> {
  String _groupValue = 'author';

  @override
  Widget build(BuildContext context) {
    return WidgetGroup.spacing(
      spacing: 15,
      children: [
        SegmentedControl<String>(
          onValueChanged: (value) {
            setState(() {
              _groupValue = value;
            });
            widget.onAssignedChanged?.call(value);
          },
          padding: EdgeInsets.zero,
          groupValue: _groupValue,
          borderColor: colorBorderPrimary,
          pressedColor: CupertinoColors.tertiarySystemFill,
          children: widget.items.map((key, value) {
            return MapEntry(key, _buildSegmentItem(key, value));
          }),
        ),
        Expanded(
          child: CupertinoSearchTextField(
            controller: widget.controller,
            style: const TextStyle(
              fontSize: 14,
              height: 1.1,
              color: colorTextSecondary,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            prefixInsets: const EdgeInsets.only(
              left: 8,
              top: 4,
              bottom: 4,
            ),
            decoration: primaryInputBorderDecoration,
            placeholder: widget.placeholder,
            placeholderStyle: const TextStyle(
              fontSize: 14,
              height: 1.1,
              color: CupertinoColors.placeholderText,
            ),
            onSubmitted: widget.onSubmitted,
          ),
        ),
      ],
    );
  }

  Widget _buildSegmentItem(String key, String text) {
    final textColor = CupertinoTheme.of(context).textTheme.textStyle.color;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.1,
          color: _groupValue == key ? CupertinoColors.white : textColor,
        ),
      ),
    );
  }
}
