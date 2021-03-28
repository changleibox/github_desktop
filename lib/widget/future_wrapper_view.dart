/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/widget/no_data.dart';

/// 构建内容
typedef FutureWidgetBuilder<T> = Widget Function(
  BuildContext context,
  Widget child,
  AsyncSnapshot<T> snapshot,
);

/// Created by changlei on 3/8/21.
///
/// 异步处理的listView
class FutureWrapperView<T> extends StatefulWidget {
  /// 初始化
  const FutureWrapperView({
    Key key,
    @required this.future,
    @required this.builder,
    this.placeholderBuilder,
  })  : assert(builder != null),
        super(key: key);

  /// future
  final Future<T> future;

  /// listView
  final FutureWidgetBuilder<T> builder;

  /// 构建placeholder
  final AsyncWidgetBuilder<T> placeholderBuilder;

  @override
  _FutureWrapperViewState<T> createState() => _FutureWrapperViewState<T>();
}

class _FutureWrapperViewState<T> extends State<FutureWrapperView<T>> {
  T _lastValues;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      initialData: _lastValues,
      future: widget.future,
      builder: (context, snapshot) {
        final child = _buildChild(context, snapshot);
        if (child == null) {
          _lastValues = snapshot.data;
        }
        return widget.builder.call(context, child, snapshot);
      },
    );
  }

  Widget _buildChild(BuildContext context, AsyncSnapshot<T> snapshot) {
    Widget child;
    if (snapshot.hasError) {
      child = Center(
        child: Text('${snapshot.error}'),
      );
    }
    final data = snapshot.data;
    if (!snapshot.hasData || (data is Iterable && data.isEmpty)) {
      if (snapshot.connectionState == ConnectionState.waiting && _lastValues == null) {
        child = const Center(
          child: CupertinoActivityIndicator(),
        );
      } else {
        child = widget?.placeholderBuilder?.call(context, snapshot) ?? NoData();
      }
    }
    return child;
  }
}
