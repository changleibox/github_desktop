/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';

/// Created by box on 3/27/21.
///
/// textButton
class CupertinoTextButton extends StatelessWidget {
  /// 构造函数
  const CupertinoTextButton({
    Key key,
    this.onPressed,
    @required this.child,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
  })  : assert(child != null),
        assert(alignment != null),
        super(key: key);

  /// child
  final Widget child;

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

  /// 点击事件
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final color = CupertinoColors.systemBlue;
    return CupertinoButton(
      padding: padding,
      minSize: 0,
      alignment: alignment,
      onPressed: onPressed,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: onPressed == null ? color.withOpacity(0.5) : color,
        ),
        child: child,
      ),
    );
  }
}
