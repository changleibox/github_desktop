/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:fluttericon/octicons_icons.dart';

/// Created by changlei on 3/10/21.
///
/// 筛选结果提示
class FilterResultTips extends StatelessWidget {
  /// 构造函数
  const FilterResultTips({
    Key key,
    this.count,
    this.query,
    this.type,
    this.language,
    this.onClearPressed,
  }) : super(key: key);

  /// 返回数量
  final int count;

  /// 搜索框内容
  final String query;

  /// type
  final String type;

  /// language
  final String language;

  /// 点击清除
  final VoidCallback onClearPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: IconLabel(
        alignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        horizontalSpacing: 16,
        label: Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: (count ?? 0).toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(
                  text: ' results',
                ),
                if (type != null)
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: ' for ',
                      ),
                      TextSpan(
                        text: type.toLowerCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                const TextSpan(
                  text: ' repositories',
                ),
                if (query != null)
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: ' matching ',
                      ),
                      TextSpan(
                        text: query,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                if (language != null)
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: ' written in ',
                      ),
                      TextSpan(
                        text: language,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        rightIcon: CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          onPressed: onClearPressed,
          child: IconLabel(
            horizontalSpacing: 8,
            label: const Text(
              'Clear filter',
              style: TextStyle(
                color: colorTextSecondary,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            leftIcon: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                borderRadius: primaryBorderRadius,
                color: colorTextSecondary,
              ),
              child: const Icon(
                Octicons.x,
                size: 16,
                color: CupertinoColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
