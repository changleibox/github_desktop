/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/hover_button.dart';
import 'package:github_desktop/widget/hover_region.dart';
import 'package:github_desktop/widget/support_dropdown_menu.dart';
import 'package:fluttericon/octicons_icons.dart';

/// Created by changlei on 3/10/21.
///
/// 筛选按钮
class FilterButton extends StatefulWidget {
  /// 构造函数
  const FilterButton({
    Key key,
    @required this.child,
    @required this.items,
    this.title,
    this.indicateSize,
    this.selectedValue,
    this.textColor,
    this.onChanged,
  })  : assert(child != null),
        assert(items != null && items.length > 0),
        super(key: key);

  /// 选项名称
  final Widget child;

  /// 弹窗框title
  final Widget title;

  /// 指示箭头的大小
  final Size indicateSize;

  /// 选项
  final List<String> items;

  /// 选中的value
  final String selectedValue;

  /// 文本颜色
  final Color textColor;

  /// 选中事件
  final ValueChanged<String> onChanged;

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  String _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.selectedValue ?? widget.items.first;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FilterButton oldWidget) {
    if (oldWidget.selectedValue != widget.selectedValue) {
      _selectedValue = widget.selectedValue ?? widget.items.first;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      borderRadius: primaryBorderRadius,
      padding: EdgeInsets.zero,
      minSize: 30,
      foregroundColor: widget.textColor,
      onPressed: () async {
        await showFilterPopupWindow(
          context,
          title: widget.title ?? widget.child,
          indicateSize: widget.indicateSize,
          children: widget.items.map((e) {
            return SelectableFilterAction(
              selected: e == _selectedValue,
              onPressed: () {
                setState(() {
                  _selectedValue = e;
                });
                widget.onChanged?.call(e);
              },
              child: Text(e),
            );
          }).toList(),
        );
      },
      child: widget.child,
    );
  }
}

/// 筛选
class AgileFilterButton extends StatelessWidget {
  /// 构造函数
  const AgileFilterButton({
    Key key,
    @required this.child,
    @required this.items,
    this.title,
    this.indicateSize,
    this.textColor,
  })  : assert(child != null),
        assert(items != null),
        super(key: key);

  /// 选项名称
  final Widget child;

  /// 弹窗框title
  final Widget title;

  /// 筛选项
  final List<Widget> items;

  /// 指示箭头的大小
  final Size indicateSize;

  /// 文本颜色
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      borderRadius: primaryBorderRadius,
      padding: EdgeInsets.zero,
      minSize: 30,
      foregroundColor: textColor,
      onPressed: () async {
        await showFilterPopupWindow(
          context,
          title: title,
          indicateSize: indicateSize,
          children: items,
        );
      },
      child: child,
    );
  }
}

/// 显示筛选弹框
Future<String> showFilterPopupWindow(
  BuildContext context, {
  Widget title,
  @required List<Widget> children,
  Size indicateSize,
}) {
  assert(children != null && children.isNotEmpty);
  final renderObject = context.findRenderObject() as RenderBox;
  final rect = Rect.fromPoints(
    renderObject.localToGlobal(Offset.zero),
    renderObject.localToGlobal(renderObject.size.bottomRight(Offset.zero)),
  );
  return showDropdownMenu<String>(
    context: context,
    indicateSize: indicateSize ?? Size.zero,
    divider: const CupertinoDivider(),
    offset: 8,
    margin: 0,
    alignment: 1,
    anchor: rect.translate(rect.width / 2, 0),
    items: [
      if (title != null)
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          child: WidgetGroup(
            children: [
              DefaultTextStyle(
                style: const TextStyle(
                  color: colorTextPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                child: title,
              ),
              const Spacer(),
              CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Octicons.x,
                  size: 16,
                  color: colorIconTertiary,
                ),
              ),
            ],
          ),
        ),
      ...children,
    ],
  );
}

/// 筛选项
class FilterAction extends StatelessWidget {
  /// 构造函数
  const FilterAction({
    Key key,
    this.child,
    this.leading,
    this.onPressed,
  }) : super(key: key);

  /// child
  final Widget child;

  /// 是否选中
  final Widget leading;

  /// 点击事件
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      cursor: SystemMouseCursors.click,
      builder: (context, child, hover) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          color: hover ? colorBgTertiary : CupertinoColors.white,
          width: 298,
          child: DropdownAction(
            leading: leading,
            spacing: 8,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 7,
            ),
            isAutoPop: true,
            onPressed: onPressed,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: colorTextPrimary,
              ),
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
}

/// 筛选项
class SelectableFilterAction extends StatelessWidget {
  /// 构造函数
  const SelectableFilterAction({
    Key key,
    this.selected,
    this.child,
    this.onPressed,
  }) : super(key: key);

  /// child
  final Widget child;

  /// 是否选中
  final bool selected;

  /// 点击事件
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Widget leading = const SizedBox(
      width: 16,
      height: 16,
    );
    if (selected) {
      leading = const Icon(
        Octicons.check,
        size: 16,
      );
    }
    return FilterAction(
      leading: leading,
      onPressed: onPressed,
      child: child,
    );
  }
}
