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

/// Created by box on 3/27/21.
///
/// textButton
class HoverButton extends StatelessWidget {
  /// 构造函数
  const HoverButton({
    Key key,
    @required this.child,
    this.color,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
    this.hoverStyle = HoverStyle.none,
    this.minSize = 0,
    this.foregroundColor,
    this.hoverColor = _hoverColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
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

  /// 鼠标悬浮颜色
  final Color hoverColor;

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

  /// Whether the button is enabled or disabled. Buttons are disabled by default. To
  /// enable a button, set its [onPressed] property to a non-null value.
  bool get enabled => onPressed != null;

  @override
  Widget build(BuildContext context) {
    final themeData = CupertinoTheme.of(context);
    final textColor = themeData.primaryColor;
    return HoverRegion(
      builder: (context, child, hover) {
        var textStyle = TextStyle(
          fontSize: 14,
          color: foregroundColor,
        );
        var color = this.color;
        final tinting = hover && enabled;
        switch (hoverStyle) {
          case HoverStyle.none:
            textStyle = textStyle.copyWith(
              color: tinting ? textColor : textStyle.color,
              fontWeight: FontWeight.normal,
            );
            break;
          case HoverStyle.plain:
            color = color ?? (tinting ? hoverColor : null);
            break;
          case HoverStyle.highlight:
            color = color ?? (tinting ? textColor : null);
            textStyle = textStyle.copyWith(
              color: tinting ? themeData.primaryContrastingColor : textStyle.color ?? textColor,
              fontWeight: FontWeight.normal,
            );
            break;
          case HoverStyle.solid:
            textStyle = textStyle.copyWith(
              decoration: tinting ? TextDecoration.underline : TextDecoration.none,
              decorationStyle: TextDecorationStyle.solid,
            );
            break;
        }
        return CupertinoButton(
          onPressed: onPressed,
          padding: padding,
          alignment: alignment,
          color: color,
          minSize: minSize,
          borderRadius: borderRadius,
          child: Builder(
            builder: (context) {
              final style = DefaultTextStyle.of(context).style.merge(textStyle);
              final textColor = style.color;
              return AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: style.copyWith(
                  color: enabled ? textColor : textColor.withOpacity(0.5),
                ),
                child: IconTheme(
                  data: IconThemeData(
                    color: textStyle.color,
                  ),
                  child: child,
                ),
              );
            },
          ),
        );
      },
      child: child,
    );
  }
}
