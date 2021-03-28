/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/hover_button.dart';

const _textStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
);

/// Created by changlei on 3/8/21.
///
/// 页脚
class FooterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetGroup(
      mainAxisSize: MainAxisSize.max,
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '© 2021 GitHub, Inc.',
          style: _textStyle,
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'Terms',
            style: _textStyle,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'Privacy',
            style: _textStyle,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'Security',
            style: _textStyle,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'Status',
            style: _textStyle,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'Docs',
            style: _textStyle,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Icon(
            Octicons.mark_github,
            color: colorFooterInvertocatOcticon,
            size: 24,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'Contact GitHub',
            style: _textStyle,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'Pricing',
            style: _textStyle,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'API',
            style: _textStyle,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'Training',
            style: _textStyle,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'Blog',
            style: _textStyle,
          ),
        ),
        HoverButton(
          onPressed: () {},
          hoverStyle: HoverStyle.solid,
          child: const Text(
            'About',
            style: _textStyle,
          ),
        ),
      ],
    );
  }
}
