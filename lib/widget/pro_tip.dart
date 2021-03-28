/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';

/// Created by changlei on 3/8/21.
///
/// 提示信息
class ProTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Octicons.light_bulb,
          color: Color(0xff586069),
          size: 16,
        ),
        const SizedBox(
          width: 4,
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'ProTip!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const TextSpan(
                text: ' Updated in the last three days: ',
              ),
              WidgetSpan(
                child: CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: const Text(
                    'updated:>2021-03-04',
                    style: TextStyle(
                      fontSize: 14,
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
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
