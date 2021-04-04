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
    this.child,
  })  : assert(builder != null),
        super(key: key);

  /// 构建child
  final HoverWidgetBuilder builder;

  /// child
  final Widget child;

  @override
  _HoverRegionState createState() => _HoverRegionState();
}

class _HoverRegionState extends State<HoverRegion> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
