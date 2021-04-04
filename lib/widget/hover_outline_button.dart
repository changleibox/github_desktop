/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/hover_region.dart';

/// Created by box on 3/29/21.
///
/// hover边框
class HoverOutlineButton extends StatelessWidget {
  /// 构造函数
  const HoverOutlineButton({
    Key key,
    @required this.child,
    this.minSize = 28,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 12,
    ),
    this.alignment = Alignment.center,
    this.borderRadius = primaryBorderRadius,
    bool primary = false,
    this.onPressed,
  })  : assert(child != null),
        assert(primary != null),
        color = primary ? colorBtnPrimaryBg : colorBtnBg,
        hoverColor = primary ? colorBtnHoverPrimaryBg : colorBtnHoverBg,
        borderSide = primary ? primaryBtnBorderSide : btnBorderSide,
        super(key: key);

  /// 构造函数
  const HoverOutlineButton.fill({
    Key key,
    @required this.child,
    this.minSize = 28,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 12,
    ),
    this.alignment = Alignment.center,
    this.color,
    this.hoverColor = colorBgTertiary,
    this.borderSide = btnBorderSide,
    this.borderRadius = primaryBorderRadius,
    this.onPressed,
  })  : assert(child != null),
        super(key: key);

  /// child
  final Widget child;

  /// height
  final double minSize;

  /// padding
  final EdgeInsetsGeometry padding;

  /// alignment
  final AlignmentGeometry alignment;

  /// pressed
  final VoidCallback onPressed;

  /// 按钮主题色
  final Color color;

  /// 按钮hover色
  final Color hoverColor;

  /// 边框
  final BorderSide borderSide;

  /// The radius of the button's corners when it has a background color.
  ///
  /// Defaults to round corners of 6 logical pixels.
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      cursor: SystemMouseCursors.click,
      builder: (context, child, hover) {
        final decoration = BoxDecoration(
          borderRadius: borderRadius,
          border: Border.fromBorderSide(borderSide),
          color: hover ? hoverColor : color,
        );
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: decoration,
          child: CupertinoButton(
            alignment: alignment,
            padding: padding,
            minSize: minSize,
            borderRadius: borderRadius,
            color: decoration.color,
            onPressed: onPressed,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
