/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/util/date_format_utils.dart';

/// Created by changlei on 3/8/21.
///
/// 自动更新日期
class AutoUpdateDate extends StatefulWidget {
  /// 初始化
  const AutoUpdateDate({
    Key key,
    @required this.dateTime,
  })  : assert(dateTime != null),
        super(key: key);

  /// 开始日期
  final String dateTime;

  @override
  _AutoUpdateDateState createState() => _AutoUpdateDateState();
}

class _AutoUpdateDateState extends State<AutoUpdateDate> {
  Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(DateFormatUtils.formattedDate(widget.dateTime));
  }
}
