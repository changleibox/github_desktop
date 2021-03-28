/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/widget/future_wrapper_view.dart';

/// 构建item
typedef FutureIndexedWidgetBuilder<T> = Widget Function(BuildContext context, int index, T item);

/// 构建list
typedef FutureListWidgetBuilder<T> = Widget Function(
  BuildContext context,
  Widget child,
  AsyncSnapshot<List<T>> snapshot,
);

/// Created by changlei on 3/8/21.
///
/// 异步处理的listView
class FutureListView<T> extends StatelessWidget {
  /// 初始化
  const FutureListView({
    Key key,
    @required this.future,
    @required this.itemBuilder,
    this.separatorBuilder,
    this.builder,
    this.placeholderBuilder,
  })  : assert(itemBuilder != null),
        super(key: key);

  /// future
  final Future<List<T>> future;

  /// 构建item
  final FutureIndexedWidgetBuilder<T> itemBuilder;

  /// 构建item分割线
  final IndexedWidgetBuilder separatorBuilder;

  /// 构建placeholder
  final AsyncWidgetBuilder placeholderBuilder;

  /// listView
  final FutureListWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return FutureWrapperView<List<T>>(
      future: future,
      placeholderBuilder: placeholderBuilder,
      builder: (context, snapshot) {
        final data = snapshot.data;
        Widget child;
        if (separatorBuilder == null) {
          child = ListView.builder(
            itemBuilder: (context, index) {
              return itemBuilder(context, index, data[index]);
            },
            itemCount: data.length,
          );
        } else {
          child = ListView.separated(
            itemBuilder: (context, index) {
              return itemBuilder(context, index, data[index]);
            },
            separatorBuilder: separatorBuilder,
            itemCount: data.length,
          );
        }
        return builder?.call(context, child, snapshot) ?? child;
      },
    );
  }
}
