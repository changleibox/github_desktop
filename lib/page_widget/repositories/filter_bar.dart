/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/widget/hover_outline_button.dart';
import 'package:github_desktop/widget/prefix_filter_button.dart';

const _types = <String>['All', 'Public', 'Private', 'Sources', 'Forks', 'Archived', 'Mirrors'];

const _languages = <String>['All', 'Dart', 'Java', 'CMake', 'Python', 'Kotlin', 'C++'];

/// 过滤回调
typedef RepositoriesFilterCallback = void Function(String type, String language);

/// Created by changlei on 3/8/21.
///
/// 筛选栏
class RepositoriesFilterBar extends StatefulWidget {
  /// 初始化
  const RepositoriesFilterBar({
    Key key,
    this.query,
    this.type,
    this.language,
    this.onSearch,
    this.onFilter,
  }) : super(key: key);

  /// 搜索框内容
  final String query;

  /// type
  final String type;

  /// language
  final String language;

  /// 搜索
  final ValueChanged<String> onSearch;

  /// 筛选
  final RepositoriesFilterCallback onFilter;

  @override
  _RepositoriesFilterBarState createState() => _RepositoriesFilterBarState();
}

class _RepositoriesFilterBarState extends State<RepositoriesFilterBar> {
  final _queryController = TextEditingController();

  String _selectedType = _types.first;
  String _selectedLanguage = _languages.first;

  @override
  void initState() {
    _queryController.text = widget.query;
    _selectedType = widget.type ?? _types.first;
    _selectedLanguage = widget.language ?? _languages.first;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RepositoriesFilterBar oldWidget) {
    if (oldWidget.query != widget.query) {
      if (widget.query?.isNotEmpty == true) {
        _queryController.value = _queryController.value.copyWith(
          text: widget.query,
          selection: TextSelection.collapsed(offset: widget.query?.length ?? 0),
        );
      } else {
        _queryController.clear();
      }
    }
    if (oldWidget.type != widget.type) {
      _selectedType = widget.type ?? _types.first;
    }
    if (oldWidget.language != widget.language) {
      _selectedLanguage = widget.language ?? _languages.first;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  void _handleFilter() {
    final type = _selectedType == 'All' ? null : _selectedType;
    final language = _selectedLanguage == 'All' ? null : _selectedLanguage;
    widget.onFilter?.call(type, language);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              controller: _queryController,
              padding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 12,
              ),
              style: textStyle.copyWith(
                fontSize: 14,
              ),
              placeholder: 'Find a repository…',
              placeholderStyle: textStyle.copyWith(
                fontSize: 14,
                color: CupertinoColors.placeholderText,
              ),
              decoration: primaryInputBorderDecoration,
              onChanged: widget.onSearch,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          PrefixFilterButton(
            name: 'Type',
            items: _types,
            selectedValue: _selectedType,
            onChanged: (value) {
              setState(() {
                _selectedType = value;
              });
              _handleFilter();
            },
          ),
          const SizedBox(
            width: 8,
          ),
          PrefixFilterButton(
            name: 'Language',
            items: _languages,
            selectedValue: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value;
              });
              _handleFilter();
            },
          ),
          const SizedBox(
            width: 16,
          ),
          HoverOutlineButton(
            onPressed: () {},
            minSize: 30,
            primary: true,
            child: const IconLabel(
              leftIcon: Icon(
                Octicons.repo,
                size: 16,
              ),
              horizontalSpacing: 4,
              label: Text(
                'New',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
