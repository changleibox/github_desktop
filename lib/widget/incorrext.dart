/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';

/// Created by box on 3/6/21.
///
/// 显示错误控件
class Incorrect extends StatelessWidget {
  /// 初始化
  const Incorrect({
    Key key,
    @required this.message,
    this.onClose,
  })  : assert(message != null),
        super(key: key);

  /// 错误信息
  final Widget message;

  /// 点击关闭
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final textStyle = DefaultTextStyle.of(context).style;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: colorAlertErrorBg,
        borderRadius: primaryBorderRadius,
        border: Border.fromBorderSide(errorBorderSide),
      ),
      child: Row(
        children: [
          Expanded(
            child: DefaultTextStyle(
              style: textStyle.copyWith(
                fontSize: 13,
              ),
              child: message,
            ),
          ),
          CupertinoButton(
            padding: const EdgeInsets.all(2),
            minSize: 0,
            onPressed: onClose,
            child: const Icon(
              CupertinoIcons.clear,
              size: 14,
              color: colorAlertErrorIcon,
            ),
          ),
        ],
      ),
    );
  }
}
