/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';

/// Created by changlei on 3/10/21.
///
/// 显示数量
class Counter extends StatelessWidget {
  /// 构造函数
  const Counter({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;
    return Container(
      height: 18,
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      decoration: const ShapeDecoration(
        color: colorCounterBg,
        shape: StadiumBorder(),
      ),
      child: Center(
        child: DefaultTextStyle(
          style: textStyle.copyWith(
            height: 1.0,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          child: child,
        ),
      ),
    );
  }
}
