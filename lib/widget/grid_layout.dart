/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';

/// Created by box on 3/27/21.
///
/// 简单实现的网格布局
class GridLayout extends StatelessWidget {
  /// 构造函数
  const GridLayout({
    Key key,
    @required this.children,
    @required this.crossAxisCount,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
  })  : assert(children != null),
        assert(crossAxisCount != null && crossAxisCount > 0),
        super(key: key);

  /// children
  final List<Widget> children;

  /// 交叉轴方向
  final int crossAxisCount;

  /// 主轴间距
  final double mainAxisSpacing;

  /// 交叉轴间距
  final double crossAxisSpacing;

  @override
  Widget build(BuildContext context) {
    final length = children.length;
    final mainAxisCount = (length / crossAxisCount).ceil();
    return WidgetGroup.spacing(
      direction: Axis.vertical,
      spacing: mainAxisSpacing,
      children: List.generate(mainAxisCount, (row) {
        return IntrinsicHeight(
          child: WidgetGroup.spacing(
            spacing: crossAxisSpacing,
            children: List.generate(crossAxisCount, (column) {
              final index = row * crossAxisCount + column;
              if (index >= length) {
                return const Spacer();
              } else {
                return Expanded(
                  child: children[index],
                );
              }
            }),
          ),
        );
      }),
    );
  }
}
