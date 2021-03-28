/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';

/// Created by changlei on 3/9/21.
///
/// 展开收缩动画控件
class AnimatedExpandable extends StatelessWidget {
  /// 初始化
  const AnimatedExpandable({
    Key key,
    @required this.isExpanded,
    @required this.child,
  })  : assert(isExpanded != null),
        assert(child != null),
        super(key: key);

  /// 是否展开
  final bool isExpanded;

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      sizeCurve: Curves.fastOutSlowIn,
      firstChild: Container(),
      secondChild: child,
      crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
  }
}
