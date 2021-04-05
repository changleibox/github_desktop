/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:github_desktop/common/resources.dart';

/// Created by box on 4/5/21.
///
/// 自定义的tooltip
class SupportTooltip extends StatefulWidget {
  /// 构造函数
  const SupportTooltip({
    Key key,
    @required this.child,
    @required this.message,
    this.cursor = MouseCursor.defer,
  })  : assert(child != null),
        assert(message != null),
        assert(cursor != null),
        super(key: key);

  /// child
  final Widget child;

  /// 展示在tooltip上
  final Widget message;

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
  _SupportTooltipState createState() => _SupportTooltipState();
}

class _SupportTooltipState extends State<SupportTooltip> {
  final _key = GlobalKey<OverlayWindowAnchorState>();

  void _onEnter(PointerEnterEvent event) {
    if (!_key.currentState.isShowing) {
      _key.currentState?.show();
    }
  }

  void _onExit(PointerExitEvent event) {
    _key.currentState?.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayWindowAnchor(
      key: _key,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
      indicateSize: const Size(12, 6),
      borderRadius: primaryBorderRadius,
      builder: (context) {
        return _Tooltip(
          child: widget.message,
        );
      },
      child: MouseRegion(
        cursor: widget.cursor,
        onEnter: _onEnter,
        onExit: _onExit,
        child: widget.child,
      ),
    );
  }
}

class _Tooltip extends StatelessWidget {
  /// 构造函数
  const _Tooltip({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: primaryBorderRadius,
      ),
      padding: const EdgeInsets.all(8),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xffdfe2e5),
        ),
        child: child,
      ),
    );
  }
}
