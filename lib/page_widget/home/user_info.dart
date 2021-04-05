/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/page_widget/home/edit_profile.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/github_user.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/widget/hover_button.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/8/21.
///
/// 首页用户信息
class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userModel = context.read<UserModel>();
    final viewer = userModel.viewer;
    return SingleChildScrollView(
      child: Container(
        width: 269,
        padding: const EdgeInsets.symmetric(
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GithubUser(
              size: 269,
              hasStatus: true,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              viewer?.name ?? 'Unknown',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              viewer?.login ?? 'Unknown',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: colorTextSecondary,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            EditProfile(),
            const CupertinoDivider(
              height: 32,
            ),
            const Text(
              'Highlights',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            HoverButton(
              onPressed: () {},
              child: const IconLabel(
                horizontalSpacing: 4,
                leftIcon: Icon(
                  Octicons.north_star,
                  size: 16,
                  color: colorTextTertiary,
                ),
                label: Flexible(
                  child: Text(
                    'Arctic Code Vault Contributor',
                    style: TextStyle(
                      fontSize: 14,
                      color: colorTextPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
