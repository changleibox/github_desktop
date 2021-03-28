/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/hover_region.dart';

/// Created by box on 3/27/21.
///
/// 垂直的tabLayout
class VerticalTabLayout extends StatefulWidget {
  /// 构造函数
  const VerticalTabLayout({
    Key key,
    @required this.children,
    this.selectedIndex,
    this.onChanged,
  })  : assert(children != null),
        super(key: key);

  /// children
  final List<Widget> children;

  /// 选中的index
  final int selectedIndex;

  /// changed
  final ValueChanged<int> onChanged;

  @override
  _VerticalTabLayoutState createState() => _VerticalTabLayoutState();
}

class _VerticalTabLayoutState extends State<VerticalTabLayout> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex ?? 0;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant VerticalTabLayout oldWidget) {
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _selectedIndex = widget.selectedIndex ?? 0;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return WidgetGroup.spacing(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      direction: Axis.vertical,
      spacing: 8,
      children: List.generate(widget.children.length, (index) {
        return _TabItem(
          selected: index == _selectedIndex,
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
            widget.onChanged?.call(index);
          },
          child: widget.children[index],
        );
      }),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    Key key,
    @required this.child,
    this.selected = false,
    this.onPressed,
  })  : assert(child != null),
        assert(selected != null),
        super(key: key);

  final Widget child;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      builder: (context, child, hover) {
        Color color;
        if (selected) {
          color = colorStateSelectedPrimary;
        } else if (hover) {
          color = colorBgTertiary;
        }
        return CupertinoButton(
          onPressed: onPressed,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          minSize: 34,
          borderRadius: primaryBorderRadius,
          color: color,
          alignment: Alignment.centerLeft,
          child: Builder(
            builder: (context) {
              final textStyle = DefaultTextStyle.of(context).style;
              return DefaultTextStyle(
                style: textStyle.copyWith(
                  fontSize: 12,
                  color: selected ? textStyle.color : colorTextSecondary,
                ),
                child: child,
              );
            },
          ),
        );
      },
      child: child,
    );
  }
}
