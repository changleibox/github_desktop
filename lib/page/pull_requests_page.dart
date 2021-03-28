/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:async';

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/github_gql/github_queries.data.gql.dart';
import 'package:github_desktop/github_gql/github_queries.req.gql.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/page_widget/issues/filter_bar.dart';
import 'package:github_desktop/page_widget/issues/pull_request_tile.dart';
import 'package:github_desktop/system/exceptions.dart';
import 'package:github_desktop/widget/assigned_bar.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/footer_bar.dart';
import 'package:github_desktop/widget/future_list_view.dart';
import 'package:github_desktop/widget/github_action_bar.dart';
import 'package:github_desktop/widget/pro_tip.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/8/21.
///
/// Pull request
class PullRequestsPage extends StatefulWidget {
  @override
  _PullRequestsPageState createState() => _PullRequestsPageState();
}

class _PullRequestsPageState extends State<PullRequestsPage> {
  final _queryController = TextEditingController();

  Future<List<$AssignedPullRequests$search$edges$node$asPullRequest>> _pullRequests;
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
    _pullRequests = _retrievePullRequests();
    if (requestCount) {
      _openedCount = await _retrievePullRequestsCount(_queryParams(inputQuery: inputQuery, isOpen: true));
      _closedCount = await _retrievePullRequestsCount(_queryParams(inputQuery: inputQuery, isOpen: false));
    }
    setState(() {});
  }

  Future<List<$AssignedPullRequests$search$edges$node$asPullRequest>> _retrievePullRequests({String inputQuery}) async {
    final query = _queryParams(inputQuery: inputQuery, isOpen: _isOpen);
    if (inputQuery == null || inputQuery.isEmpty) {
      _queryController.value = TextEditingValue(
        text: query,
        selection: TextSelection.collapsed(offset: query.length),
      );
    }

    final userModel = context.read<UserModel>();
    final response = await userModel.request(AssignedPullRequests((b) {
      return b
        ..count = 100
        ..query = query;
    }));
    if (response.errors != null && response.errors.isNotEmpty) {
      throw QueryException(response.errors);
    }
    return $AssignedPullRequests(response.data)
        .search
        .edges
        .map((e) => e.node)
        .whereType<$AssignedPullRequests$search$edges$node$asPullRequest>()
        .toList();
  }

  Future<int> _retrievePullRequestsCount(String query) async {
    final userModel = context.read<UserModel>();
    final response = await userModel.request(AssignedPullRequests((b) {
      return b
        ..count = 100
        ..query = query;
    }));
    if (response.errors != null) {
      return 0;
    }
    return $AssignedPullRequests(response.data)
        .search
        .edges
        .map((e) => e.node)
        .whereType<$AssignedPullRequests$search$edges$node$asPullRequest>()
        .length;
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
                  'review-requested': 'Review requests',
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: CupertinoColors.separator,
                      width: 0,
                    ),
                  ),
                  child: WidgetGroup(
                    direction: Axis.vertical,
                    divider: const CupertinoDivider(),
                    children: [
                      IssuesFilterBar(
                        icon: const Icon(Octicons.git_pull_request),
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
                        child: FutureListView<$AssignedPullRequests$search$edges$node$asPullRequest>(
                          future: _pullRequests,
                          itemBuilder: (context, index, item) {
                            return PullRequestsTile(item: item);
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
