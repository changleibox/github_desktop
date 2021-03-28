/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/widget/cupertino_text_button.dart';

/// Created by changlei on 3/8/21.
///
/// 提示信息
class ProTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconLabel(
      mainAxisSize: MainAxisSize.min,
      horizontalSpacing: 4,
      leftIcon: const Icon(
        Octicons.light_bulb,
        color: Color(0xff586069),
        size: 16,
      ),
      label: Text.rich(
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
              child: CupertinoTextButton(
                onPressed: () {},
                child: const Text(
                  'updated:>2021-03-04',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
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
    );
  }
}
