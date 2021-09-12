/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:github_desktop/third_party/github_graphql_schema/schema.docs.schema.gql.dart' as gql;
import 'package:intl/intl.dart';

/// Created by box on 3/6/21.
///
/// 格式化时间
class DateFormatUtils {
  const DateFormatUtils._();

  /// 格式化的日期
  static String formattedDate(String dateTimeValue) {
    final dateTime = DateTime.tryParse(dateTimeValue).toLocal();
    final now = DateTime.now();
    final deltaDuration = now.difference(dateTime);
    if (deltaDuration.inMinutes < 1) {
      return 'now';
    }
    if (deltaDuration.inHours < 1) {
      return '${deltaDuration.inMinutes} minutes ago';
    }
    if (deltaDuration.inDays < 1) {
      return '${deltaDuration.inHours} hours ago';
    }
    if (deltaDuration.inDays == 1) {
      return 'yesterday';
    }
    if (DateUtils.isSameMonth(dateTime, now)) {
      return '${deltaDuration.inDays} days ago';
    }
    if (dateTime.year == now.year) {
      return DateFormat.d().add_MMM().format(dateTime);
    }
    return DateFormat.d().add_MMM().add_y().format(dateTime);
  }

  /// 格式化的日期
  static gql.GitTimestamp get formattedLastYear {
    final now = DateUtils.dateOnly(DateTime.now()).toLocal();
    final start = now.subtract(const Duration(days: 364)).toUtc();
    return gql.GitTimestamp(DateFormat('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'').format(start));
  }
}
