/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/cupertino.dart';

/// Created by changlei on 3/9/21.
///
/// 资源文件

/// 字体
const fontFamilies = <String>['-apple-system', 'BlinkMacSystemFont', 'Segoe UI,Helvetica', 'Arial,sans-serif', 'Apple Color Emoji', 'Segoe UI Emoji'];

/// 背景色
const colorBgTertiary = Color(0xfff6f8fa);

/// 边框颜色
const colorBorderSecondary = Color(0xffeaecef);

/// 错误弹框背景
const colorAlertErrorBg = Color(0xffffe3e6);

/// 错误弹框边框
const colorAlertErrorBorder = Color.fromRGBO(158, 28, 35, 0.2);

/// 错误弹框icon颜色
const colorAlertErrorIcon = Color.fromRGBO(158, 28, 35, 0.6);

/// 字体主题色
const colorTextPrimary = Color(0xff24292e);

/// 字体颜色
const colorTextSecondary = Color(0xff586069);

/// 字体颜色
const colorTextTertiary = Color(0xff6a737d);

/// 输入框边框色
const colorInputBorder = Color(0xffe1e4e8);

/// 按钮背景颜色
const colorBtnPrimaryBg = Color(0xff2ea44f);

/// 按钮disabled背景颜色
const colorBtnPrimaryDisabledBg = Color(0xff94d3a2);

/// 按钮边框颜色
const colorBtnPrimaryBorder = Color.fromRGBO(27, 31, 35, 0.15);

/// 头部的logo颜色
const colorHeaderLogo = Color(0xfff2f2f2);

/// 头部背景色
const colorHeaderBg = Color(0xff24292e);

/// 头部字体颜色
const colorHeaderText = Color(0xffffffb3);

/// 头部搜索框颜色
const colorHeaderSearchBg = Color(0xff24292e);

/// 头部搜索框边框颜色
const colorHeaderSearchBorder = Color(0xff444d56);

/// 头部搜索框边框颜色
const colorHeaderSearchPlaceholder = Color(0xffb4b5b6);

/// 按钮背景色
const colorBtnBg = Color(0xfffafbfc);

/// 底部颜色
const colorBorderBottom = Color(0xfff9826c);

/// 边框颜色
const colorBorderPrimary = Color(0xffe1e4e8);

/// 计数器背景
const colorCounterBg = Color.fromRGBO(209, 213, 218, 0.5);

/// 按钮边框色
const colorBtnBorder = Color.fromRGBO(27, 31, 35, 0.15);

/// 文本边框色
const colorLabelBorder = Color(0xffe1e4e8);

/// 项目语言默认颜色
const colorRepoLanguageColorBorder = Color.fromRGBO(27, 31, 35, 0.1);

/// icon颜色
const colorIconTertiary = Color(0xff959da5);

/// 选中的背景色
const colorStateSelectedPrimary = Color(0xff0366d6);

/// 时间线badge背景色
const colorTimelineBadgeBg = Color(0xffe1e4e8);

/// 默认边框
const primaryBorderSide = BorderSide(
  color: colorBorderSecondary,
  width: 1,
);

/// 错误边框
const errorBorderSide = BorderSide(
  color: colorAlertErrorBorder,
  width: 1,
);

/// 输入框边框
const inputBorderSide = BorderSide(
  color: colorInputBorder,
  width: 1,
);

/// 头部输入框边框
const headerInputBorderSide = BorderSide(
  color: colorHeaderSearchBorder,
  width: 1,
);

/// 按钮边框
const btnBorderSide = BorderSide(
  color: colorBtnBorder,
  width: 1,
);

/// 文本边框
const labelBorderSide = BorderSide(
  color: colorLabelBorder,
  width: 1,
);

/// 默认输入框边框
const BoxDecoration primaryInputBorderDecoration = BoxDecoration(
  color: CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.white,
    darkColor: CupertinoColors.black,
  ),
  border: Border.fromBorderSide(inputBorderSide),
  borderRadius: primaryBorderRadius,
);

/// 头部输入框边框
const BoxDecoration headerInputBorderDecoration = BoxDecoration(
  color: colorHeaderSearchBg,
  border: Border.fromBorderSide(headerInputBorderSide),
  borderRadius: primaryBorderRadius,
);

/// 默认按钮框边框
const BoxDecoration primaryBtnBorderDecoration = BoxDecoration(
  color: colorBtnPrimaryBg,
  border: Border.fromBorderSide(BorderSide(
    color: colorBtnPrimaryBorder,
    width: 1,
  )),
  borderRadius: primaryBorderRadius,
);

/// 按钮框边框
const BoxDecoration btnBorderDecoration = BoxDecoration(
  color: colorBtnBg,
  border: Border.fromBorderSide(btnBorderSide),
  borderRadius: primaryBorderRadius,
);

/// 边框
const BoxDecoration primaryBorderDecoration = BoxDecoration(
  border: Border.fromBorderSide(BorderSide(
    color: colorBorderPrimary,
    width: 1,
  )),
  borderRadius: primaryBorderRadius,
);

/// 默认圆角
const primaryRadius = Radius.circular(6);

/// 默认边框圆角
const primaryBorderRadius = BorderRadius.all(primaryRadius);
