/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/hover_button.dart';
import 'package:github_desktop/widget/support_dropdown_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/octicons_icons.dart';

const _collapsedWidth = 270.0;
const _expandedWidth = _collapsedWidth * 2;

/// Created by changlei on 3/10/21.
///
/// 标题栏搜索控件
class ActionBarSearch extends StatefulWidget {
  @override
  _ActionBarSearchState createState() => _ActionBarSearchState();
}

class _ActionBarSearchState extends State<ActionBarSearch> {
  bool _ixExpanded = false;

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      minSize: 0,
      borderRadius: primaryBorderRadius,
      padding: EdgeInsets.zero,
      cursor: SystemMouseCursors.text,
      onPressed: () async {
        setState(() {
          _ixExpanded = true;
        });
        await _showSearchPopupWindow(
          context,
          items: [
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
            'changleibox/flutter_desktop',
          ],
        );
        setState(() {
          _ixExpanded = false;
        });
      },
      child: AnimatedContainer(
        width: _ixExpanded ? _expandedWidth : _collapsedWidth,
        duration: const Duration(milliseconds: 300),
        decoration: headerInputBorderDecoration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                height: 28,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Search or jump to…',
                  style: TextStyle(
                    color: colorHeaderSearchPlaceholder,
                  ),
                ),
              ),
            ),
            SvgPicture.network(
              'https://github.githubassets.com/images/search-key-slash.svg',
              width: 20,
              height: 19,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchPopupWindow extends StatelessWidget {
  /// 更多弹框
  const _SearchPopupWindow({
    Key key,
    @required this.items,
  })  : assert(items != null),
        super(key: key);

  /// item
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final animation = ModalRoute.of(context)?.animation;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height / 2,
          ),
          decoration: const BoxDecoration(
            borderRadius: primaryBorderRadius,
          ),
          clipBehavior: Clip.antiAlias,
          width: _collapsedWidth + (_expandedWidth - _collapsedWidth) * animation?.value ?? 0,
          child: child,
        );
      },
      child: IntrinsicWidth(
        child: SingleChildScrollView(
          child: WidgetGroup(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            direction: Axis.vertical,
            divider: const CupertinoDivider(),
            children: items,
          ),
        ),
      ),
    );
  }
}

/// 显示筛选弹框
Future<void> _showSearchPopupWindow(
  BuildContext context, {
  @required List<String> items,
}) {
  assert(items != null && items.isNotEmpty);
  final renderObject = context.findRenderObject() as RenderBox;
  final rect = Rect.fromPoints(
    renderObject.localToGlobal(Offset.zero),
    renderObject.localToGlobal(renderObject.size.bottomRight(Offset.zero)),
  );
  return showPopupWindow<void>(
    context,
    indicateSize: Size.zero,
    offset: 0,
    margin: 0,
    alignment: -1,
    anchor: rect.translate(-rect.width / 2, -rect.height),
    borderRadius: primaryBorderRadius,
    builder: (context) {
      return _SearchPopupWindow(
        items: [
          Container(
            height: 28,
            child: const CupertinoTextField.borderless(
              placeholder: 'Search or jump to…',
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              style: TextStyle(
                color: CupertinoColors.white,
              ),
              autofocus: true,
            ),
          ),
          ...items.map((e) {
            return Container(
              child: DropdownAction(
                leading: const Icon(
                  Octicons.repo,
                  size: 16,
                ),
                spacing: 8,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                onPressed: () {},
                child: Text(
                  e,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          }),
        ],
      );
    },
  );
}
