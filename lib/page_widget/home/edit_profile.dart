/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:provider/provider.dart';

/// Created by changlei on 3/10/21.
///
/// edit profile
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle;
    final userModel = context.read<UserModel>();
    final viewer = userModel.viewer;
    final followersCount = viewer?.followers?.totalCount ?? 0;
    final followingCount = viewer?.following?.totalCount ?? 0;
    final starredRepositoriesCount = viewer?.starredRepositories?.totalCount ?? 0;
    Widget child;
    if (isEditMode) {
      child = _EditProfileForm(
        onComplete: () {
          setState(() {
            isEditMode = false;
          });
        },
      );
    } else {
      child = WidgetGroup(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          Container(
            decoration: btnBorderDecoration,
            width: double.infinity,
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(6),
              color: colorBtnBg,
              padding: EdgeInsets.zero,
              minSize: 30,
              onPressed: () {
                setState(() {
                  isEditMode = true;
                });
              },
              child: Text(
                'Edit profile',
                style: textStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text.rich(
            TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(
                    Octicons.person,
                    size: 16,
                    color: colorTextSecondary,
                  ),
                ),
                TextSpan(
                  text: ' $followersCount ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const TextSpan(
                  text: 'followers',
                ),
                const TextSpan(
                  text: ' · ',
                ),
                TextSpan(
                  text: '$followingCount',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const TextSpan(
                  text: ' following',
                ),
                const TextSpan(
                  text: ' · ',
                ),
                const WidgetSpan(
                  child: Icon(
                    Octicons.star,
                    size: 16,
                    color: colorTextSecondary,
                  ),
                ),
                TextSpan(
                  text: ' $starredRepositoriesCount',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            style: const TextStyle(
              fontSize: 14,
              color: colorTextSecondary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Icon(
                Octicons.location,
                size: 16,
                color: colorTextTertiary,
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  viewer?.location ?? 'Unknown',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}

class _EditProfileForm extends StatelessWidget {
  const _EditProfileForm({
    Key key,
    this.onComplete,
  }) : super(key: key);

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return WidgetGroup.spacing(
      direction: Axis.vertical,
      spacing: 8,
      children: [
        Container(
          height: 79,
          margin: const EdgeInsets.only(
            bottom: 4,
          ),
          child: const CupertinoTextField(
            decoration: primaryInputBorderDecoration,
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
            ),
            minLines: 1,
            maxLines: null,
            placeholder: 'Add to bio',
            textAlignVertical: TextAlignVertical.top,
          ),
        ),
        const IconLabel(
          leftIcon: Icon(
            Octicons.organization,
            size: 16,
            color: colorTextTertiary,
          ),
          horizontalSpacing: 8,
          label: Expanded(
            child: CupertinoTextField(
              decoration: primaryInputBorderDecoration,
              placeholder: 'Company',
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 12,
              ),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        const IconLabel(
          leftIcon: Icon(
            Octicons.location,
            size: 16,
            color: colorTextTertiary,
          ),
          horizontalSpacing: 8,
          label: Expanded(
            child: CupertinoTextField(
              decoration: primaryInputBorderDecoration,
              placeholder: 'Location',
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 12,
              ),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        const IconLabel(
          leftIcon: Icon(
            Octicons.link,
            size: 16,
            color: colorTextTertiary,
          ),
          horizontalSpacing: 8,
          label: Expanded(
            child: CupertinoTextField(
              decoration: primaryInputBorderDecoration,
              placeholder: 'Website',
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 12,
              ),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        IconLabel(
          leftIcon: SvgPicture.asset(
            'assets/svgs/twitter_logo.svg',
            width: 16,
            height: 13,
            color: colorTextTertiary,
          ),
          horizontalSpacing: 8,
          label: const Expanded(
            child: CupertinoTextField(
              decoration: primaryInputBorderDecoration,
              placeholder: 'Twitter username',
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 12,
              ),
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 8,
          ),
          child: WidgetGroup.spacing(
            spacing: 4,
            children: [
              Container(
                decoration: primaryBtnBorderDecoration,
                child: CupertinoButton(
                  color: colorBtnPrimaryBg,
                  borderRadius: primaryBorderRadius,
                  minSize: 26,
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 12,
                  ),
                  onPressed: () {
                    onComplete?.call();
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.05,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: btnBorderDecoration,
                child: CupertinoButton(
                  borderRadius: primaryBorderRadius,
                  minSize: 26,
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 12,
                  ),
                  onPressed: () {
                    onComplete?.call();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14,
                      color: colorTextPrimary,
                      height: 1.05,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
