/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/divider.dart';

const _constraints = BoxConstraints(
  minWidth: 150,
  maxWidth: 300,
  maxHeight: 300,
);

/// Created by changlei on 3/10/21.
///
/// 兼容的dropdown_menu
class DropdownMenu extends StatelessWidget {
  /// 更多弹框
  const DropdownMenu({
    Key key,
    @required this.items,
    this.divider = const CupertinoDivider(),
    this.constraints = _constraints,
  })  : assert(items != null),
        assert(constraints != null),
        super(key: key);

  /// item
  final List<Widget> items;

  /// 分割线
  final Widget divider;

  /// 约束
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return DropDownMenu(
      items: items,
      constraints: constraints,
      divider: divider,
    );
  }
}

/// 显示DropDownMenu
Future<T> showDropdownMenu<T>({
  @required BuildContext context,
  @required List<Widget> items,
  Widget divider = const SizedBox.shrink(),
  Axis direction = Axis.vertical,
  Size indicateSize = const Size(14, 8),
  double offset = 0,
  double margin = 10,
  double alignment = 0,
  BoxConstraints constraints = const BoxConstraints(),
  Rect anchor,
}) async {
  assert(context != null);
  assert(direction != null);
  assert(items?.isNotEmpty == true);
  assert(indicateSize != null);
  assert(offset != null);
  assert(margin != null);
  assert(constraints != null);
  assert(alignment != null && alignment.abs() <= 1);
  return await showPopupWindow<T>(
    context,
    indicateSize: indicateSize,
    offset: offset,
    margin: margin,
    direction: direction,
    alignment: alignment,
    anchor: anchor,
    builder: (context) {
      return DropDownMenu(
        items: items,
        divider: divider,
        constraints: constraints,
      );
    },
  );
}

/// dropdown item
class DropdownAction extends StatelessWidget {
  /// 构造函数
  const DropdownAction({
    Key key,
    @required this.child,
    this.leading,
    this.trailing,
    this.padding = const EdgeInsets.only(
      left: 16,
      top: 4,
      right: 8,
      bottom: 4,
    ),
    this.spacing = 17,
    this.isAutoPop = true,
    this.onPressed,
  })  : assert(child != null),
        assert(spacing != null),
        assert(isAutoPop != null),
        super(key: key);

  /// icon
  final Widget leading;

  /// 尾部icon
  final Widget trailing;

  /// child
  final Widget child;

  /// padding
  final EdgeInsetsGeometry padding;

  /// space
  final double spacing;

  /// 是否自动关闭
  final bool isAutoPop;

  /// 点击事件
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DropDownAction(
      icon: leading,
      endIcon: trailing,
      spacing: spacing,
      label: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 21,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: colorTextPrimary,
              fontSize: 14,
              height: 1.0,
            ),
            child: child,
          ),
        ),
      ),
      onPressed: onPressed,
      padding: padding,
      minSize: 0,
      isAutoPop: isAutoPop,
    );
  }
}
