/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flatterer/flatterer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/github_gql/github_queries.data.gql.dart';
import 'package:github_desktop/model/user_model.dart';
import 'package:github_desktop/util/html_utils.dart';
import 'package:github_desktop/widget/hover_button.dart';
import 'package:provider/provider.dart';

const _statusSize = 36.0;
const _duration = Duration(milliseconds: 200);

/// Created by changlei on 3/5/21.
///
/// github已登录
class GithubUser extends StatelessWidget {
  /// 初始化
  const GithubUser({
    Key key,
    this.size = 32,
    this.hasName = false,
    this.hasStatus = false,
  })  : assert(hasName != null),
        assert(hasStatus != null),
        super(key: key);

  /// 大小
  final double size;

  /// 是否显示名称
  final bool hasName;

  /// 是否显示状态
  final bool hasStatus;

  @override
  Widget build(BuildContext context) {
    final userModel = context.read<UserModel>();
    final icon = Icon(
      Octicons.mark_github,
      size: size,
      color: CupertinoColors.darkBackgroundGray,
    );
    final viewer = userModel.viewer;
    if (viewer == null) {
      return icon;
    }
    return WidgetGroup.spacing(
      alignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Stack(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: viewer.avatarUrl.value,
                width: size,
                height: size,
                fit: BoxFit.cover,
                placeholder: (context, url) => icon,
                errorWidget: (context, url, dynamic error) => icon,
              ),
            ),
            if (hasStatus)
              Positioned(
                right: 0,
                bottom: 40,
                child: ViewerStatus(
                  status: viewer.status,
                ),
              ),
          ],
        ),
        if (hasName)
          Text(
            viewer.login,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }
}

/// 状态
class ViewerStatus extends StatefulWidget {
  /// 构造函数
  const ViewerStatus({
    Key key,
    @required this.status,
    this.showMessage = false,
    this.animation,
  })  : assert(showMessage != null),
        super(key: key);

  /// 状态
  final $ViewerDetail$viewer$status status;

  /// 是否显示状态信息
  final bool showMessage;

  /// 动画
  final Animation<double> animation;

  @override
  _ViewerStatusState createState() => _ViewerStatusState();
}

class _ViewerStatusState extends State<ViewerStatus> with SingleTickerProviderStateMixin {
  final _link = LayerLink();

  AnimatedOverlay _overlay;

  @override
  void dispose() {
    _hideViewerStatus();
    super.dispose();
  }

  void _handleViewerStatus() {
    _hideViewerStatus();
    if (widget.status == null) {
      return;
    }
    final rect = localToGlobal(context);
    _overlay = AnimatedOverlay(context);
    _overlay.insert(
      curve: Curves.easeIn,
      transitionDuration: _duration,
      builder: (context, animation, secondaryAnimation) {
        return Positioned(
          left: rect.left,
          top: rect.top,
          child: MouseRegion(
            onExit: _onExit,
            child: CompositedTransformFollower(
              link: _link,
              showWhenUnlinked: false,
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return ViewerStatus(
                    status: widget.status,
                    showMessage: true,
                    animation: animation,
                  );
                },
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  void _hideViewerStatus() {
    _overlay?.remove(
      transitionDuration: _duration,
      curve: Curves.easeOut,
    );
    _overlay = null;
  }

  void _onEnter(PointerEnterEvent event) {
    if (_overlay != null || widget.showMessage) {
      return;
    }
    _handleViewerStatus();
  }

  void _onExit(PointerExitEvent event) {
    _hideViewerStatus();
  }

  @override
  Widget build(BuildContext context) {
    final emoji = widget.status?.emojiHTML?.value;
    final message = widget.status.message;
    final animatedValue = widget.animation?.value ?? 1;
    Widget child;
    if (emoji == null) {
      child = const Icon(
        Octicons.smiley,
        size: 16,
        color: Color(0xff4d545c),
      );
    } else {
      child = HoverButton(
        onPressed: () {},
        foregroundColor: colorTextPrimary,
        child: WidgetGroup.spacing(
          spacing: 4,
          children: [
            Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              child: Text(
                HtmlUtils.strippedHtml(emoji),
                style: const TextStyle(
                  height: 1.2,
                ),
              ),
            ),
            if (widget.showMessage)
              ClipRect(
                clipBehavior: Clip.antiAlias,
                child: Align(
                  widthFactor: animatedValue,
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    }
    return CompositedTransformTarget(
      link: _link,
      child: MouseRegion(
        onEnter: _onEnter,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: _statusSize,
          constraints: const BoxConstraints(
            minWidth: _statusSize,
          ),
          decoration: ShapeDecoration(
            color: CupertinoColors.white,
            shape: const StadiumBorder(
              side: BorderSide(
                color: CupertinoColors.separator,
                width: 0,
              ),
            ),
            shadows: [
              if (widget.showMessage)
                BoxShadow(
                  color: const Color.fromRGBO(0, 0, 0, 0.1),
                  spreadRadius: 4 * animatedValue,
                  blurRadius: 10 * animatedValue,
                  offset: const Offset(0, 0),
                ),
            ],
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
