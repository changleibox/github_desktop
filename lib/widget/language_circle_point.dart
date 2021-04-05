/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/github_gql/github_queries.data.gql.dart';

/// Created by box on 4/5/21.
///
/// 语言
class LanguageCirclePoint extends StatelessWidget {
  /// 构造函数
  const LanguageCirclePoint({
    Key key,
    @required this.language,
  }) : super(key: key);

  /// 语言
  final $Repositories$search$edges$node$asRepository$languages$nodes language;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(
          int.tryParse(
            language?.color?.replaceFirst('#', '0xff') ?? '0xffcccccc',
          ),
        ),
        shape: const CircleBorder(
          side: BorderSide(
            color: colorRepoLanguageColorBorder,
            width: 1,
          ),
        ),
      ),
    );
  }
}
