/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:async';

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_desktop/github_gql/github_queries.data.gql.dart';
import 'package:github_desktop/github_gql/github_queries.req.gql.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/page_widget/repositories/filter_bar.dart';
import 'package:github_desktop/page_widget/repositories/filter_result_tips.dart';
import 'package:github_desktop/page_widget/repositories/repositories_tile.dart';
import 'package:github_desktop/system/exceptions.dart';
import 'package:github_desktop/util/date_format_utils.dart';
import 'package:github_desktop/widget/animated_expandable.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/future_list_view.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/8/21.
///
/// Repositories
class RepositoriesPage extends StatefulWidget {
  @override
  _RepositoriesPageState createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
  Future<List<$Repositories$search$edges$node$asRepository>> _repositories;

  String _query;
  String _type;
  String _language;

  Future<List<$Repositories$search$edges$node$asRepository>> _retrieveRepositories() async {
    final userModel = context.read<UserModel>();
    final queryParams = <String>['user:${userModel.viewer.login}', 'fork:true', 'sort:updated'];
    if (_query?.isNotEmpty == true) {
      queryParams.add('$_query in:name,description');
    }
    if (_type?.isNotEmpty == true) {
      switch (_type) {
        case 'Public':
          queryParams.add('is:public');
          break;
        case 'Private':
          queryParams.add('is:private');
          break;
        case 'Sources':
          queryParams.remove('fork:true');
          queryParams.remove('fork:false');
          break;
        case 'Forks':
          queryParams.remove('fork:true');
          queryParams.add('fork:only');
          break;
        case 'Archived':
          queryParams.add('archived:true');
          break;
        case 'Mirrors':
          queryParams.add('mirror:true');
          break;
      }
    }
    if (_language?.isNotEmpty == true) {
      queryParams.add('language:$_language');
    }
    final response = await userModel.request(Repositories((b) {
      return b
        ..count = 100
        ..query = queryParams.join(' ')
        ..historySince = DateFormatUtils.formattedLastYear;
    }));
    if (response.errors != null && response.errors.isNotEmpty) {
      throw QueryException(response.errors);
    }
    return $Repositories(response.data)
        .search
        .edges
        .map((e) => e.node)
        .whereType<$Repositories$search$edges$node$asRepository>()
        .toList();
  }

  void _request() {
    _repositories = _retrieveRepositories();
  }

  @override
  void initState() {
    _request();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hasFilterCondition = [_query, _type, _language].any((element) => element?.isNotEmpty == true);
    return WidgetGroup(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      divider: const CupertinoDivider(),
      direction: Axis.vertical,
      children: [
        RepositoriesFilterBar(
          query: _query,
          type: _type,
          language: _language,
          onSearch: (value) {
            _query = value;
            setState(() {
              _request();
            });
          },
          onFilter: (type, language) {
            _type = type;
            _language = language;
            setState(() {
              _request();
            });
          },
        ),
        Expanded(
          child: FutureListView<$Repositories$search$edges$node$asRepository>(
            future: _repositories,
            itemBuilder: (context, index, item) {
              return RepositoriesTile(item: item);
            },
            separatorBuilder: (context, index) {
              return const CupertinoDivider();
            },
            placeholderBuilder: (context, snapshot) {
              if (hasFilterCondition) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: 32,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                  ),
                  alignment: Alignment.topCenter,
                  child: Text(
                    '${context.read<UserModel>().viewer?.login} doesn’t have any repositories that match.',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }
              return null;
            },
            builder: (context, child, snapshot) {
              return WidgetGroup(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                direction: Axis.vertical,
                divider: hasFilterCondition ? const CupertinoDivider() : null,
                children: [
                  AnimatedExpandable(
                    isExpanded: hasFilterCondition,
                    child: FilterResultTips(
                      count: snapshot.data?.length,
                      query: _query,
                      type: _type,
                      language: _language,
                      onClearPressed: () {
                        _query = null;
                        _type = null;
                        _language = null;
                        setState(() {
                          _request();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: child,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
