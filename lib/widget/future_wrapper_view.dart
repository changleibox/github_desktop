/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/widget/no_data.dart';

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
  final AsyncWidgetBuilder<T> builder;

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
        if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        final data = snapshot.data;
        if (!snapshot.hasData || (data is Iterable && data.isEmpty)) {
          if (snapshot.connectionState == ConnectionState.waiting && _lastValues == null) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return widget?.placeholderBuilder?.call(context, snapshot) ?? NoData();
          }
        }
        _lastValues = data;
        return widget.builder.call(context, snapshot);
      },
    );
  }
}
