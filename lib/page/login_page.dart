/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:github_desktop/common/github_oauth_credentials.dart';
import 'package:github_desktop/common/resources.dart';
import 'package:github_desktop/system/route.dart';
import 'package:github_desktop/widget/github_login.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_to_front/window_to_front.dart';

/// Created by changlei on 3/5/21.
///
/// 登录
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
            ),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Column(
                  children: [
                    CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(24),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteName.main,
                          (route) => false,
                        );
                      },
                      child: const Icon(
                        Octicons.mark_github,
                        size: 48,
                        color: colorTextSecondary,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 36,
                      child: const Text(
                        'Sign in to GitHub',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FutureBuilder<SharedPreferences>(
                      future: SharedPreferences.getInstance(),
                      builder: (context, snapshot) {
                        return GithubLogin(
                          clientId: snapshot.data?.getString('clientId'),
                          clientSecret: snapshot.data?.getString('clientSecret'),
                          githubScopes: githubScopes,
                          onLogged: _onLogged,
                        );
                      },
                    ),
                    Container(
                      width: 308,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      margin: const EdgeInsets.only(
                        top: 16,
                        bottom: 10,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: primaryBorderRadius,
                        border: Border.fromBorderSide(borderSide),
                      ),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'New to GitHub?'),
                            const TextSpan(text: ' '),
                            WidgetSpan(
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                onPressed: () {},
                                child: const Text(
                                  'Create an account',
                                  style: TextStyle(
                                    height: 1,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                        style: const TextStyle(
                          height: 1,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 40,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            onPressed: () {},
                            child: const Text(
                              'Terms',
                              style: TextStyle(
                                height: 1,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            onPressed: () {},
                            child: const Text(
                              'Privacy',
                              style: TextStyle(
                                height: 1,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            onPressed: () {},
                            child: const Text(
                              'Security',
                              style: TextStyle(
                                height: 1,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            onPressed: () {},
                            child: const Text(
                              'Contact GitHub',
                              style: TextStyle(
                                height: 1,
                                fontSize: 12,
                                color: colorTextSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onLogged(String clientId, String clientSecret) async {
    await WindowToFront.activate();
    await Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.home,
      (route) => false,
    );
  }
}
