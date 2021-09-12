/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/system/route.dart';
import 'package:github_desktop/util/html_utils.dart';
import 'package:github_desktop/widget/divider.dart';
import 'package:github_desktop/widget/github_user.dart';
import 'package:github_desktop/widget/hover_button.dart';
import 'package:github_desktop/widget/hover_outline_button.dart';
import 'package:github_desktop/widget/support_dropdown_menu.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/10/21.
///
/// 标题栏用户信息
class ActionBarUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewer = context.read<UserModel>().viewer;
    return HoverButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      foregroundColor: colorHeaderLogo,
      hoverForegroundColor: colorTextTertiary,
      onPressed: () {
        showDropdownMenu<void>(
          context: context,
          items: [
            const SizedBox(
              height: 4,
            ),
            DropdownAction(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                children: [
                  const Text('Signed in as'),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    viewer?.login ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const CupertinoDivider(),
            Container(
              constraints: const BoxConstraints(minWidth: 146),
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: HoverOutlineButton(
                onPressed: () {},
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                minSize: 0,
                alignment: Alignment.centerLeft,
                borderRadius: primaryBorderRadius,
                child: IconLabel(
                  label: Text(
                    viewer?.status?.message ?? 'Unknown',
                    style: const TextStyle(
                      color: colorTextPrimary,
                      fontSize: 12,
                      height: 1.0,
                    ),
                  ),
                  leftIcon: Text(
                    HtmlUtils.strippedHtml(viewer?.status?.emojiHTML?.value) ?? 'Unknown',
                  ),
                  horizontalSpacing: 8,
                ),
              ),
            ),
            const CupertinoDivider(),
            const SizedBox(
              height: 8,
            ),
            DropdownAction(
              onPressed: () {},
              child: const Text('Your profile'),
            ),
            DropdownAction(
              onPressed: () {},
              child: const Text('Your repositories'),
            ),
            DropdownAction(
              onPressed: () {},
              child: const Text('Your codespaces'),
            ),
            DropdownAction(
              onPressed: () {},
              child: const Text('Your stars'),
            ),
            DropdownAction(
              onPressed: () {},
              child: const Text('Your gists'),
            ),
            const CupertinoDivider(
              height: 16,
            ),
            DropdownAction(
              onPressed: () {},
              child: const Text('Upgrade'),
            ),
            DropdownAction(
              onPressed: () {},
              child: const Text('Feature preview'),
            ),
            DropdownAction(
              onPressed: () {},
              child: const Text('Help'),
            ),
            DropdownAction(
              onPressed: () {},
              child: const Text('Settings'),
            ),
            const CupertinoDivider(
              height: 16,
            ),
            DropdownAction(
              onPressed: () {
                _onLogoutPressed(context);
              },
              child: const Text('Sign out'),
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        );
      },
      child: const IconLabel(
        horizontalSpacing: 4,
        label: GithubUser(
          size: 20,
        ),
        rightIcon: Icon(
          Octicons.triangle_down,
          size: 10,
        ),
      ),
    );
  }

  void _onLogoutPressed(BuildContext context) {
    final userModel = context.read<UserModel>();
    showCupertinoDialog<void>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('提示'),
          content: const Text('确定要退出登录吗？'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('取消'),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () async {
                await userModel.signOut();
                await Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteName.main,
                  (route) => false,
                );
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }
}
