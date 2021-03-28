/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/github_gql/github_queries.data.gql.dart';
import 'package:github_desktop/util/launch_utils.dart';
import 'package:github_desktop/widget/auto_update_date.dart';
import 'package:github_desktop/widget/list_tile.dart';
import 'package:fluttericon/octicons_icons.dart';

/// Created by changlei on 3/8/21.
///
/// item
class IssuesTile extends StatelessWidget {
  /// 初始化
  const IssuesTile({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  /// 数据
  final $AssignedIssues$search$edges$node$asIssue item;

  @override
  Widget build(BuildContext context) {
    final textColor = CupertinoTheme.of(context).textTheme.textStyle.color;
    final assignees = item.assignees.nodes;
    final pullRequestCount = item.timelineItems?.nodes
        ?.whereType<$AssignedIssues$search$edges$node$asIssue$timelineItems$nodes$asCrossReferencedEvent>()
        ?.where((element) => element.isCrossRepository)
        ?.length;
    String assigneeAvatar;
    if (assignees?.isNotEmpty == true) {
      assigneeAvatar = assignees.first.avatarUrl.value;
    }
    return CupertinoListTile(
      title: Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          children: [
            TextSpan(
              text: '${item.repository.nameWithOwner} ',
              style: const TextStyle(
                color: colorTextSecondary,
              ),
            ),
            TextSpan(
              text: '${item.title}',
            ),
            ...?item.labels?.nodes?.map((e) {
              final color = Color(
                int.tryParse(
                  '0xff${e.color}' ?? CupertinoColors.secondaryLabel.value.toString(),
                ),
              );
              final isDark = color.computeLuminance() < 0.5;
              return WidgetSpan(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 2.5,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: ShapeDecoration(
                    color: color,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    e.name,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? CupertinoColors.white : textColor,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(
          top: 4,
        ),
        child: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '#${item.number} opened on ',
            ),
            WidgetSpan(
              child: AutoUpdateDate(
                dateTime: item.createdAt.value,
              ),
            ),
            TextSpan(
              text: ' by ${item.author.login}',
            ),
          ]),
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
      trailing: Container(
        width: 228,
        child: Row(
          children: [
            if (pullRequestCount == null || pullRequestCount == 0)
              const Spacer()
            else
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Octicons.git_pull_request,
                      size: 16,
                      color: textColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '$pullRequestCount',
                    ),
                  ],
                ),
              ),
            if (assigneeAvatar == null)
              const Spacer()
            else
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: assigneeAvatar ?? '',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            if (item.comments == null || item.comments.totalCount == 0)
              const Spacer()
            else
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Octicons.comment,
                      size: 16,
                      color: textColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${item.comments.totalCount}',
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      onPressed: () {
        return LaunchUtils.launchUrl(context, item.url.value);
      },
    );
  }
}
