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
    this.primary = false,
    this.onPressed,
  })  : assert(child != null),
        assert(primary != null),
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

  /// 是否为主题色按钮
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return HoverRegion(
      builder: (context, child, hover) {
        BoxDecoration decoration;
        if (primary) {
          decoration = primaryBtnBorderDecoration.copyWith(
            color: hover ? colorBtnHoverPrimaryBg : colorBtnPrimaryBg,
          );
        } else {
          decoration = btnBorderDecoration.copyWith(
            color: hover ? colorBtnHoverBg : colorBtnBg,
          );
        }
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: decoration,
          child: CupertinoButton(
            alignment: alignment,
            padding: padding,
            minSize: minSize,
            borderRadius: primaryBorderRadius,
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
