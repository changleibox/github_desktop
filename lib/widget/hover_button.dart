/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/widget/hover_region.dart';

/// 按钮样式
enum HoverStyle {
  /// 无样式
  none,

  /// 高亮的
  highlight,

  /// 显示浅灰色背景
  plain,

  /// 在鼠标悬浮在按钮上，text显示下划线
  solid,
}

const _hoverColor = Color(0xfff6f8fa);
const _duration = Duration(milliseconds: 200);

/// Created by box on 3/27/21.
///
/// textButton
class HoverButton extends StatelessWidget {
  /// 构造函数
  const HoverButton({
    Key key,
    @required this.child,
    this.color,
    this.hoverColor = _hoverColor,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
    this.hoverStyle = HoverStyle.none,
    this.minSize = 0,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.cursor,
    this.onPressed,
  })  : assert(child != null),
        assert(alignment != null),
        assert(hoverStyle != null),
        super(key: key);

  /// child
  final Widget child;

  /// The color of the button's background.
  ///
  /// Defaults to null which produces a button with no background or border.
  ///
  /// Defaults to the [CupertinoTheme]'s `primaryColor` when the
  /// [CupertinoButton.filled] constructor is used.
  final Color color;

  /// 鼠标悬浮颜色
  final Color hoverColor;

  /// The alignment of the button's [child].
  ///
  /// Typically buttons are sized to be just big enough to contain the child and its
  /// [padding]. If the button's size is constrained to a fixed size, for example by
  /// enclosing it with a [SizedBox], this property defines how the child is aligned
  /// within the available space.
  ///
  /// Always defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// The amount of space to surround the child inside the bounds of the button.
  ///
  /// Defaults to 16.0 pixels.
  final EdgeInsetsGeometry padding;

  /// 样式
  final HoverStyle hoverStyle;

  /// 字体、图标颜色
  final Color foregroundColor;

  /// 鼠标悬浮字体颜色
  final Color hoverForegroundColor;

  /// Minimum size of the button.
  ///
  /// Defaults to kMinInteractiveDimensionCupertino which the iOS Human
  /// Interface Guidelines recommends as the minimum tappable area.
  final double minSize;

  /// The radius of the button's corners when it has a background color.
  ///
  /// Defaults to round corners of 8 logical pixels.
  final BorderRadius borderRadius;

  /// 点击事件
  final VoidCallback onPressed;

  /// The mouse cursor for mouse pointers that are hovering over the region.
  ///
  /// When a mouse enters the region, its cursor will be changed to the [cursor].
  /// When the mouse leaves the region, the cursor will be decided by the region
  /// found at the new location.
  ///
  /// The [cursor] defaults to [MouseCursor.defer], deferring the choice of
  /// cursor to the next region behind it in hit-test order.
  final MouseCursor cursor;

  /// Whether the button is enabled or disabled. Buttons are disabled by default. To
  /// enable a button, set its [onPressed] property to a non-null value.
  bool get enabled => onPressed != null;

  @override
  Widget build(BuildContext context) {
    final themeData = CupertinoTheme.of(context);
    final primaryColor = themeData.primaryColor;
    final textColor = foregroundColor ?? primaryColor;
    final hoverTextColor = hoverForegroundColor ?? primaryColor;
    return HoverRegion(
      cursor: cursor ?? (enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden),
      builder: (context, child, hover) {
        var backgroundColor = color;
        Color foregroundColor;
        if (backgroundColor != null) {
          foregroundColor = themeData.primaryContrastingColor;
        } else if (enabled) {
          foregroundColor = textColor;
        } else {
          foregroundColor = textColor.withOpacity(0.5);
        }

        var textStyle = themeData.textTheme.textStyle.copyWith(
          color: foregroundColor,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        );
        final tinting = hover && enabled;
        switch (hoverStyle) {
          case HoverStyle.none:
            textStyle = textStyle.copyWith(
              color: tinting ? hoverTextColor : null,
            );
            break;
          case HoverStyle.plain:
            backgroundColor ??= tinting ? hoverColor : null;
            break;
          case HoverStyle.highlight:
            backgroundColor ??= tinting ? primaryColor : null;
            textStyle = textStyle.copyWith(
              color: tinting ? themeData.primaryContrastingColor : null,
            );
            break;
          case HoverStyle.solid:
            textStyle = textStyle.copyWith(
              decoration: tinting ? TextDecoration.underline : TextDecoration.none,
              decorationStyle: TextDecorationStyle.solid,
            );
            break;
        }
        return AnimatedContainer(
          duration: _duration,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: CupertinoButton(
            onPressed: onPressed,
            padding: padding,
            alignment: alignment,
            // color: color,
            minSize: minSize,
            borderRadius: borderRadius,
            child: AnimatedDefaultTextStyle(
              duration: _duration,
              style: textStyle,
              child: IconTheme(
                data: IconThemeData(
                  color: textStyle.color,
                ),
                child: child,
              ),
            ),
          ),
        );
      },
      child: child,
    );
  }
}
