/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

/// Created by changlei on 3/10/21.
///
/// 处理html相关

class HtmlUtils {
  const HtmlUtils._();

  /// 剥离html标签
  static String strippedHtml(String source) {
    return source
        ?.replaceAll(RegExp('\\&[a-zA-Z]{1,10 };'), '')
        ?.replaceAll(RegExp('<[^>]*>'), '')
        ?.replaceAll('[(/>)<]', '');
  }
}
