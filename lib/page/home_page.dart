/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_desktop/page/overview_page.dart';
import 'package:github_desktop/page/packages_page.dart';
import 'package:github_desktop/page/projects_page.dart';
import 'package:github_desktop/page/repositories_page.dart';
import 'package:github_desktop/page_widget/home/top_bar.dart';
import 'package:github_desktop/page_widget/home/user_info.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/footer.dart';
import 'package:github_desktop/widget/github_action_bar.dart';
import 'package:github_desktop/widget/tab_swiching_view.dart';

/// Created by changlei on 3/5/21.
///
/// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final children = [
      OverviewPage(),
      RepositoriesPage(),
      ProjectsPage(),
      PackagesPage(),
    ];
    return CupertinoPageScaffold(
      navigationBar: const GithubActionBar(),
      child: Material(
        type: MaterialType.canvas,
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        child: DefaultTabController(
          initialIndex: _selectedIndex,
          length: children.length,
          child: WidgetGroup(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              TopBar(
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
              ),
              const CupertinoDivider(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: WidgetGroup.spacing(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 32,
                    children: [
                      UserInfo(),
                      Expanded(
                        child: Container(
                          child: TabSwitchingView(
                            currentTabIndex: _selectedIndex,
                            tabCount: children.length,
                            tabBuilder: (context, index) {
                              return children[index];
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: WidgetGroup(
                  direction: Axis.vertical,
                  children: <Widget>[
                    const CupertinoDivider(),
                    const SizedBox(
                      height: 40,
                    ),
                    Footer(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
