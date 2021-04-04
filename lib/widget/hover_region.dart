/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';

/// 构建hover控件
typedef HoverWidgetBuilder = Widget Function(BuildContext context, Widget child, bool hover);

/// Created by box on 3/27/21.
///
/// 处理hover
class HoverRegion extends StatefulWidget {
  /// 构造方法
  const HoverRegion({
    Key key,
    @required this.builder,
    this.cursor = MouseCursor.defer,
    this.child,
  })  : assert(builder != null),
        assert(cursor != null),
        super(key: key);

  /// 构建child
  final HoverWidgetBuilder builder;

  /// child
  final Widget child;

  /// The mouse cursor for mouse pointers that are hovering over the region.
  ///
  /// When a mouse enters the region, its cursor will be changed to the [cursor].
  /// When the mouse leaves the region, the cursor will be decided by the region
  /// found at the new location.
  ///
  /// The [cursor] defaults to [MouseCursor.defer], deferring the choice of
  /// cursor to the next region behind it in hit-test order.
  final MouseCursor cursor;

  @override
  _HoverRegionState createState() => _HoverRegionState();
}

class _HoverRegionState extends State<HoverRegion> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (event) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _hovered = false;
        });
      },
      child: widget.builder(context, widget.child, _hovered),
    );
  }
}
