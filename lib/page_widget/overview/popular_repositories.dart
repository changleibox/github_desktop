/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:async';

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/github_gql/github_queries.data.gql.dart';
import 'package:github_desktop/github_gql/github_queries.req.gql.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/system/exceptions.dart';
import 'package:github_desktop/util/date_format_utils.dart';
import 'package:github_desktop/widget/cupertino_text_button.dart';
import 'package:github_desktop/widget/future_wrapper_view.dart';
import 'package:github_desktop/widget/grid_layout.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:provider/provider.dart';

/// Created by box on 3/27/21.
///
/// 仓库
class PopularRepositories extends StatefulWidget {
  @override
  _PopularRepositoriesState createState() => _PopularRepositoriesState();
}

class _PopularRepositoriesState extends State<PopularRepositories> {
  Future<List<$Repositories$search$edges$node$asRepository>> _repositories;

  Future<List<$Repositories$search$edges$node$asRepository>> _retrieveRepositories() async {
    final userModel = context.read<UserModel>();
    final queryParams = <String>['user:${userModel.viewer.login}', 'fork:true', 'sort:stars', 'fork:false'];
    final response = await userModel.request(Repositories((b) {
      return b
        ..first = 6
        ..query = queryParams.join(' ')
        ..historySince = DateFormatUtils.formattedLastYear;
    }));
    if (response.errors != null && response.errors.isNotEmpty) {
      throw QueryException(response.errors);
    }
    return $Repositories(response.data).search.edges.map((e) => e.node).whereType<$Repositories$search$edges$node$asRepository>().toList();
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
    final textTheme = CupertinoTheme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 16,
      ),
      child: WidgetGroup.spacing(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        spacing: 8,
        children: <Widget>[
          Container(
            height: 24,
            child: DefaultTextStyle(
              style: textTheme.textStyle.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              child: WidgetGroup(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Popular repositories',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  CupertinoTextButton(
                    onPressed: () {},
                    child: const Text(
                      'Customize your pins',
                      style: TextStyle(
                        fontSize: 13,
                        color: colorTextSecondary,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              minHeight: 174,
            ),
            child: FutureWrapperView<List<$Repositories$search$edges$node$asRepository>>(
              future: _repositories,
              builder: (context, child, snapshot) {
                if (snapshot.data?.isNotEmpty != true) {
                  return child;
                }
                final data = snapshot.data;
                return GridLayout(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: List.generate(data.length, (index) {
                    return _RepositoryItem(
                      item: data[index],
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RepositoryItem extends StatelessWidget {
  const _RepositoryItem({
    Key key,
    @required this.item,
  })  : assert(item != null),
        super(key: key);

  /// item
  final $Repositories$search$edges$node$asRepository item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: primaryBorderDecoration,
      padding: const EdgeInsets.all(16),
      child: WidgetGroup(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          CupertinoTextButton(
            onPressed: () {},
            child: Text(
              item.name,
            ),
          ),
          if (item.description != null)
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 16,
              ),
              child: Text(
                item.description,
                style: const TextStyle(
                  fontSize: 12,
                  color: colorTextSecondary,
                ),
              ),
            ),
          Builder(builder: (context) {
            final style = DefaultTextStyle.of(context).style;
            final nodes = item.languages.nodes;
            final forkCount = item.isFork ? item.parent.forkCount : item.forkCount;
            return DefaultTextStyle(
              style: style.copyWith(
                fontSize: 12,
              ),
              child: IconTheme(
                data: const IconThemeData(
                  color: colorTextSecondary,
                  size: 14,
                ),
                child: Row(
                  children: [
                    if (nodes?.isNotEmpty == true)
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(
                                  int.tryParse(
                                    nodes.first.color?.replaceFirst('#', '0xff') ?? '0xffcccccc',
                                  ),
                                ),
                                shape: const CircleBorder(
                                  side: BorderSide(
                                    color: colorRepoLanguageColorBorder,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              nodes.first.name,
                            ),
                          ],
                        ),
                      ),
                    if (item.stargazers.totalCount > 0)
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.star,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('${item.stargazers.totalCount}'),
                          ],
                        ),
                      ),
                    if (forkCount > 0)
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Octicons.repo_forked,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('$forkCount'),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
