/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/github_gql/github_queries.data.gql.dart';
import 'package:github_desktop/github_gql/github_queries.req.gql.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/page_widget/issues/filter_bar.dart';
import 'package:github_desktop/page_widget/issues/issues_tile.dart';
import 'package:github_desktop/system/exceptions.dart';
import 'package:github_desktop/widget/assigned_bar.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/footer_bar.dart';
import 'package:github_desktop/widget/future_list_view.dart';
import 'package:github_desktop/widget/github_action_bar.dart';
import 'package:github_desktop/widget/pro_tip.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/8/21.
///
/// Issues
class IssuesPage extends StatefulWidget {
  @override
  _IssuesPageState createState() => _IssuesPageState();
}

class _IssuesPageState extends State<IssuesPage> {
  final _queryController = TextEditingController();

  Future<List<$AssignedIssues$search$edges$node$asIssue>> _assignedIssues;
  String _groupValue = 'author';
  bool _isOpen = true;

  int _openedCount;
  int _closedCount;

  String _queryParams({String inputQuery, bool isOpen = true}) {
    assert(isOpen != null);
    final userModel = context.read<UserModel>();
    final viewer = userModel.viewer;

    final queryParams = <String>[inputQuery?.isNotEmpty == true ? inputQuery : 'archived:false'];
    if (inputQuery == null) {
      queryParams.add('$_groupValue:${viewer.login}');
    }
    return [...queryParams, 'is:${isOpen ? 'open' : 'closed'}'].join(' ');
  }

  Future<void> _request({String inputQuery, bool requestCount = true}) async {
    assert(requestCount != null);
    _assignedIssues = _retrieveAssignedIssues();
    if (requestCount) {
      _openedCount = await _retrieveAssignedIssuesCount(_queryParams(inputQuery: inputQuery, isOpen: true));
      _closedCount = await _retrieveAssignedIssuesCount(_queryParams(inputQuery: inputQuery, isOpen: false));
    }
    setState(() {});
  }

  Future<List<$AssignedIssues$search$edges$node$asIssue>> _retrieveAssignedIssues({String inputQuery}) async {
    final query = _queryParams(inputQuery: inputQuery, isOpen: _isOpen);
    if (inputQuery == null || inputQuery.isEmpty) {
      _queryController.value = TextEditingValue(
        text: query,
        selection: TextSelection.collapsed(offset: query.length),
      );
    }

    final userModel = context.read<UserModel>();
    final response = await userModel.request(AssignedIssues((b) {
      return b
        ..count = 100
        ..query = query;
    }));
    if (response.errors != null && response.errors.isNotEmpty) {
      throw QueryException(response.errors);
    }
    return $AssignedIssues(response.data).search.edges.map((e) => e.node).whereType<$AssignedIssues$search$edges$node$asIssue>().toList();
  }

  Future<int> _retrieveAssignedIssuesCount(String query) async {
    final userModel = context.read<UserModel>();
    final response = await userModel.request(AssignedIssues((b) {
      return b
        ..count = 100
        ..query = query;
    }));
    if (response.errors != null) {
      return 0;
    }
    return $AssignedIssues(response.data).search.edges.map((e) => e.node).whereType<$AssignedIssues$search$edges$node$asIssue>().length;
  }

  @override
  void initState() {
    _request();
    super.initState();
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const GithubActionBar(),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          width: 1012,
          child: WidgetGroup(
            direction: Axis.vertical,
            children: [
              AssignedBar(
                items: const {
                  'author': 'Created',
                  'assignee': 'Assigned',
                  'mentions': 'Mentioned',
                },
                placeholder: 'Search all issues',
                controller: _queryController,
                onAssignedChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    _request();
                  });
                },
                onSubmitted: (value) {
                  _request(inputQuery: value);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Container(
                  decoration: primaryBorderDecoration,
                  child: WidgetGroup(
                    direction: Axis.vertical,
                    divider: const CupertinoDivider(),
                    children: [
                      IssuesFilterBar(
                        icon: const Icon(Octicons.issue_opened),
                        openedCount: _openedCount,
                        closedCount: _closedCount,
                        onOpened: (value) {
                          setState(() {
                            _isOpen = value;
                            _request(requestCount: false);
                          });
                        },
                      ),
                      Expanded(
                        child: FutureListView<$AssignedIssues$search$edges$node$asIssue>(
                          future: _assignedIssues,
                          itemBuilder: (context, index, item) {
                            return IssuesTile(item: item);
                          },
                          separatorBuilder: (context, index) {
                            return const CupertinoDivider(
                              indent: 15,
                              endIndent: 15,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ProTip(),
              const CupertinoDivider(
                height: 80,
              ),
              FooterBar(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
