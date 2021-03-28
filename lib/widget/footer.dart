/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';

/// Created by changlei on 3/8/21.
///
/// 页脚
class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '© 2021 GitHub, Inc.',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Terms',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Privacy',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Security',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Status',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Docs',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Icon(
            Octicons.mark_github,
            color: Color(0xffd1d5da),
            size: 24,
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Contact GitHub',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Pricing',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'API',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Training',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Blog',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'About',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
