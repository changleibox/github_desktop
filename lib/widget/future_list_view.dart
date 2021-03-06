/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/widget/future_wrapper_view.dart';

/// 构建item
typedef FutureIndexedWidgetBuilder<T> = Widget Function(BuildContext context, int index, T item);

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
  final FutureWidgetBuilder<List<T>> builder;

  @override
  Widget build(BuildContext context) {
    return FutureWrapperView<List<T>>(
      future: future,
      placeholderBuilder: placeholderBuilder,
      builder: (context, child, snapshot) {
        final content = _buildChild(context, child, snapshot);
        return builder?.call(context, content, snapshot) ?? content;
      },
    );
  }

  Widget _buildChild(BuildContext context, Widget child, AsyncSnapshot<List<T>> snapshot) {
    final data = snapshot.data;
    if (data?.isNotEmpty != true) {
      return child;
    }
    if (separatorBuilder == null) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return itemBuilder(context, index, data[index]);
        },
        itemCount: data.length,
      );
    } else {
      return ListView.separated(
        itemBuilder: (context, index) {
          return itemBuilder(context, index, data[index]);
        },
        separatorBuilder: separatorBuilder,
        itemCount: data.length,
      );
    }
  }
}
