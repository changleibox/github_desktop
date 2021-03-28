/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/page_widget/overview/contribution_activity.dart';
import 'package:github_desktop/page_widget/overview/last_year_contributions.dart';
import 'package:github_desktop/page_widget/overview/popular_repositories.dart';

/// Created by changlei on 3/8/21.
///
/// Overview
class OverviewPage extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<OverviewPage> {
  int _year;

  @override
  void initState() {
    _year = DateTime.now().year;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: WidgetGroup.spacing(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        spacing: 24,
        children: [
          PopularRepositories(),
          LastYearContributions(
            year: _year,
          ),
          ContributionActivity(
            year: _year,
            onYearChanged: (value) {
              setState(() {
                _year = value;
              });
            },
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 50,
            ),
            child: const Text(
              'Seeing something unexpected? Take a look at the GitHub profile guide.',
            ),
          ),
        ],
      ),
    );
  }
}
