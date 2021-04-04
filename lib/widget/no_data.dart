/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/widget/hover_button.dart';

/// Created by box on 3/6/21.
///
/// 暂无数据控件
class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 8,
            ),
            child: const Icon(
              Octicons.issue_opened,
              size: 32,
              color: CupertinoColors.placeholderText,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: const Text(
              'No results matched your search.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'You could search ',
                ),
                WidgetSpan(
                  child: HoverButton(
                    hoverStyle: HoverStyle.solid,
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Text(
                      'all of GitHub',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const TextSpan(
                  text: ' or try an ',
                ),
                WidgetSpan(
                  child: HoverButton(
                    hoverStyle: HoverStyle.solid,
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Text(
                      'advanced search',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const TextSpan(
                  text: '.',
                ),
              ],
            ),
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xff586069),
            ),
          ),
        ],
      ),
    );
  }
}
