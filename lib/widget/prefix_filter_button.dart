/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/filter_button.dart';
import 'package:fluttericon/octicons_icons.dart';

/// Created by changlei on 3/10/21.
///
/// 筛选
class PrefixFilterButton extends StatefulWidget {
  /// 构造函数
  const PrefixFilterButton({
    Key key,
    @required this.name,
    @required this.items,
    this.selectedValue,
    this.onChanged,
  })  : assert(name != null),
        assert(items != null && items.length > 0),
        super(key: key);

  /// 选项名称
  final String name;

  /// 选项
  final List<String> items;

  /// 选中的value
  final String selectedValue;

  /// 选中事件
  final ValueChanged<String> onChanged;

  @override
  _PrefixFilterButtonState createState() => _PrefixFilterButtonState();
}

class _PrefixFilterButtonState extends State<PrefixFilterButton> {
  String _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.selectedValue ?? widget.items.first;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PrefixFilterButton oldWidget) {
    if (oldWidget.selectedValue != widget.selectedValue) {
      _selectedValue = widget.selectedValue ?? widget.items.first;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;
    return FilterButton(
      title: Text('Select ${widget.name.toLowerCase()}'),
      selectedValue: _selectedValue,
      items: widget.items,
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged?.call(value);
      },
      child: Container(
        decoration: btnBorderDecoration,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        constraints: const BoxConstraints(
          minHeight: 30,
        ),
        child: Row(
          children: [
            Text(
              '${widget.name}: ',
              style: textStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textStyle.color.withOpacity(0.75),
              ),
            ),
            Text(
              _selectedValue,
              style: textStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Icon(
              Octicons.triangle_down,
              size: 10,
              color: textStyle.color,
            ),
          ],
        ),
      ),
    );
  }
}
