/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'dart:math';

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/github_gql/github_queries.data.gql.dart';
import 'package:github_desktop/util/launch_utils.dart';
import 'package:github_desktop/widget/auto_update_date.dart';
import 'package:github_desktop/widget/list_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/octicons_icons.dart';

/// Created by changlei on 3/8/21.
///
/// repositories item
class RepositoriesTile extends StatelessWidget {
  /// 初始化
  const RepositoriesTile({
    Key key,
    @required this.item,
  })  : assert(item != null),
        super(key: key);

  /// item
  final $Repositories$search$edges$node$asRepository item;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;
    final parent = item.parent;
    return IntrinsicHeight(
      child: CupertinoListTile(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
        ),
        title: WidgetGroup.spacing(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              item.name,
            ),
            if (item.isPrivate)
              Container(
                height: 18,
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(
                    side: labelBorderSide,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Private',
                  style: TextStyle(
                    height: 1,
                    fontWeight: FontWeight.w500,
                    color: textStyle.color,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
        subtitle: WidgetGroup.spacing(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          spacing: 8,
          children: [
            if (item.isFork)
              Text(
                'Forked from ${parent.nameWithOwner}',
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            if (item.description != null)
              Text(
                item.description,
              ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: Builder(builder: (context) {
                final style = DefaultTextStyle.of(context).style;
                final nodes = item.languages.nodes;
                final forkCount = item.isFork ? item.parent.forkCount : item.forkCount;
                return DefaultTextStyle(
                  style: style.copyWith(
                    fontSize: 12,
                  ),
                  child: WidgetGroup.spacing(
                    spacing: 16,
                    children: [
                      if (nodes?.isNotEmpty == true)
                        IconLabel(
                          leftIcon: Container(
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
                          label: Text(
                            nodes.first.name,
                          ),
                          horizontalSpacing: 4,
                        ),
                      if (item.stargazers.totalCount > 0)
                        IconLabel(
                          leftIcon: const Icon(
                            CupertinoIcons.star,
                            size: 14,
                          ),
                          label: Text('${item.stargazers.totalCount}'),
                          horizontalSpacing: 4,
                        ),
                      if (forkCount > 0)
                        IconLabel(
                          leftIcon: const Icon(
                            Octicons.repo_forked,
                            size: 14,
                          ),
                          label: Text('$forkCount'),
                          horizontalSpacing: 4,
                        ),
                      if (item.licenseInfo?.name != null)
                        IconLabel(
                          leftIcon: const Icon(
                            Octicons.law,
                            size: 14,
                          ),
                          label: Text(
                            item.licenseInfo.name,
                          ),
                          horizontalSpacing: 4,
                        ),
                      Text.rich(
                        TextSpan(children: [
                          const TextSpan(text: 'Updated on '),
                          WidgetSpan(
                            child: AutoUpdateDate(
                              dateTime: item.pushedAt.value,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
        trailing: WidgetGroup(
          crossAxisAlignment: CrossAxisAlignment.end,
          alignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          direction: Axis.vertical,
          children: [
            Container(
              height: 28,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              alignment: Alignment.center,
              decoration: btnBorderDecoration,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                borderRadius: primaryBorderRadius,
                color: colorBtnBg,
                onPressed: () {},
                child: IconLabel(
                  horizontalSpacing: 4,
                  leftIcon: Icon(
                    item.viewerHasStarred ? CupertinoIcons.star_fill : CupertinoIcons.star,
                    size: 14,
                    color: textStyle.color,
                  ),
                  label: Text(
                    item.viewerHasStarred ? 'Unstar' : 'Star',
                    style: textStyle.copyWith(
                      height: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            _PastYearOfActivity(
              refs: item.refs,
            ),
          ],
        ),
        onPressed: () {
          return LaunchUtils.launchUrl(context, item.url.value);
        },
      ),
    );
  }
}

class _PastYearOfActivity extends StatelessWidget {
  const _PastYearOfActivity({Key key, this.refs}) : super(key: key);

  final $Repositories$search$edges$node$asRepository$refs refs;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _retrieveSvgString(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }
        return SvgPicture.string(
          snapshot.data,
          width: 155,
          height: 30,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Future<String> _retrieveSvgString() async {
    final commits = refs?.nodes
        ?.map((e) => e.target)
        ?.whereType<$Repositories$search$edges$node$asRepository$refs$nodes$target$asCommit>()
        ?.expand((element) => element.history.edges)
        ?.map((e) => e.node);
    final commitMap = <DateTime, int>{};
    for (var commit in [...?commits]) {
      final committedDate = DateUtils.dateOnly(DateTime.tryParse(commit.committedDate.value).toLocal());
      commitMap[committedDate] = (commitMap[committedDate] ?? 0) + 1;
    }
    final yearOfCounts = <DateTime, int>{};
    final now = DateUtils.dateOnly(DateTime.now());
    var start = now.subtract(const Duration(days: 363));
    while (!start.isAfter(now)) {
      start = start.add(const Duration(days: 1));
      yearOfCounts[start] = commitMap[start] ?? 0;
    }
    final counts = <int>[];
    for (var i = 0; i < 52; i++) {
      counts.add(List.of(yearOfCounts.values).sublist(i * 7, (i + 1) * 7).reduce((value, element) => value + element));
    }
    final maxCount = counts.reduce(max);
    final paths = <String>[];
    for (var i = 0; i < counts.length; i++) {
      final count = maxCount == 0 ? 0 : 18 * counts[i] / maxCount;
      paths.add('${i * 3},${count.round() + 1}');
    }
    final source = await rootBundle.loadString('assets/svgs/commit_activity.svg');
    return source
        .replaceFirst(RegExp(r'points=".*?"'), 'points="${paths.join(' ')}"')
        .replaceFirst(RegExp(r'<g transform=".*?">'), '<g transform="translate(0, -2)">');
  }
}
