/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:gql_exec/gql_exec.dart';

/// Created by changlei on 3/8/21.

/// 查询异常
class QueryException implements Exception {
  /// 初始化异常
  const QueryException(this.errors);

  /// 错误
  final List<GraphQLError> errors;

  @override
  String toString() {
    return 'Query Exception: ${errors.map((e) => '$e').join(',')}';
  }
}

/// 异常
class GithubLoginException implements Exception {
  /// 初始化
  const GithubLoginException(this.message);

  /// 信息
  final String message;

  @override
  String toString() => message;
}