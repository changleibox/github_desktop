/*
 * Copyright (c) 2021 CHANGLEI. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:github_desktop/common/resources.dart';

/// Created by changlei on 3/8/21.
/// See also:
///
///  * [PopupMenuDivider], which is the equivalent but for popup menus.
///  * [ListTile.divideTiles], another approach to dividing widgets in a list.
///  * <https://material.io/design/components/dividers.html>
class CupertinoDivider extends StatelessWidget {
  /// Creates a material design divider.
  ///
  /// The [height], [thickness], [indent], and [endIndent] must be null or
  /// non-negative.
  const CupertinoDivider({
    Key key,
    this.height = 1,
    this.thickness = 1,
    this.indent,
    this.endIndent,
    this.color = colorBorderSecondary,
  })  : assert(height == null || height >= 0.0),
        assert(thickness == null || thickness >= 0.0),
        assert(indent == null || indent >= 0.0),
        assert(endIndent == null || endIndent >= 0.0),
        super(key: key);

  /// The divider's height extent.
  ///
  /// The divider itself is always drawn as a horizontal line that is centered
  /// within the height specified by this value.
  ///
  /// If this is null, then the [DividerThemeData.space] is used. If that is
  /// also null, then this defaults to 16.0.
  final double height;

  /// The thickness of the line drawn within the divider.
  ///
  /// A divider with a [thickness] of 0.0 is always drawn as a line with a
  /// height of exactly one device pixel.
  ///
  /// If this is null, then the [DividerThemeData.thickness] is used. If
  /// that is also null, then this defaults to 0.0.
  final double thickness;

  /// The amount of empty space to the leading edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.indent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double indent;

  /// The amount of empty space to the trailing edge of the divider.
  ///
  /// If this is null, then the [DividerThemeData.endIndent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double endIndent;

  /// The color to use when painting the line.
  ///
  /// If this is null, then the [DividerThemeData.color] is used. If that is
  /// also null, then [ThemeData.dividerColor] is used.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// Divider(
  ///   color: Colors.deepOrange,
  /// )
  /// ```
  /// {@end-tool}
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

/// A thin vertical line, with padding on either side.
///
/// In the material design language, this represents a divider. Vertical
/// dividers can be used in horizontally scrolling lists, such as a
/// [ListView] with [ListView.scrollDirection] set to [Axis.horizontal].
///
/// The box's total width is controlled by [width]. The appropriate
/// padding is automatically computed from the width.
///
/// {@tool dartpad --template=stateless_widget_scaffold}
///
/// This sample shows how to display a [VerticalDivider] between an purple and orange box
/// inside a [Row]. The [VerticalDivider] is 20 logical pixels in width and contains a
/// horizontally centered black line that is 1 logical pixels thick. The grey
/// line is indented by 20 logical pixels.
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Container(
///     padding: const EdgeInsets.all(10),
///     child: Row(
///       children: <Widget>[
///         Expanded(
///           child: Container(
///             decoration: BoxDecoration(
///               borderRadius: BorderRadius.circular(10),
///               color: Colors.deepPurpleAccent,
///             ),
///           ),
///         ),
///         const VerticalDivider(
///           color: Colors.grey,
///           thickness: 1,
///           indent: 20,
///           endIndent: 0,
///           width: 20,
///         ),
///         Expanded(
///           child: Container(
///             decoration: BoxDecoration(
///               borderRadius: BorderRadius.circular(10),
///               color: Colors.deepOrangeAccent,
///             ),
///           ),
///         ),
///       ],
///     ),
///   );
/// }
/// ```
/// {@end-tool}
/// See also:
///
///  * [ListView.separated], which can be used to generate vertical dividers.
///  * <https://material.io/design/components/dividers.html>
class CupertinoVerticalDivider extends StatelessWidget {
  /// Creates a material design vertical divider.
  ///
  /// The [width], [thickness], [indent], and [endIndent] must be null or
  /// non-negative.
  const CupertinoVerticalDivider({
    Key key,
    this.width = 1,
    this.thickness = 1,
    this.indent,
    this.endIndent,
    this.color,
  })  : assert(width == null || width >= 0.0),
        assert(thickness == null || thickness >= 0.0),
        assert(indent == null || indent >= 0.0),
        assert(endIndent == null || endIndent >= 0.0),
        super(key: key);

  /// The divider's width.
  ///
  /// The divider itself is always drawn as a vertical line that is centered
  /// within the width specified by this value.
  ///
  /// If this is null, then the [DividerThemeData.space] is used. If that is
  /// also null, then this defaults to 16.0.
  final double width;

  /// The thickness of the line drawn within the divider.
  ///
  /// A divider with a [thickness] of 0.0 is always drawn as a line with a
  /// width of exactly one device pixel.
  ///
  /// If this is null, then the [DividerThemeData.thickness] is used which
  /// defaults to 0.0.
  final double thickness;

  /// The amount of empty space on top of the divider.
  ///
  /// If this is null, then the [DividerThemeData.indent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double indent;

  /// The amount of empty space under the divider.
  ///
  /// If this is null, then the [DividerThemeData.endIndent] is used. If that is
  /// also null, then this defaults to 0.0.
  final double endIndent;

  /// The color to use when painting the line.
  ///
  /// If this is null, then the [DividerThemeData.color] is used. If that is
  /// also null, then [ThemeData.dividerColor] is used.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// const Divider(
  ///   color: Colors.deepOrange,
  /// )
  /// ```
  /// {@end-tool}
  final Color color;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: width,
      color: color,
      indent: indent,
      endIndent: endIndent,
      thickness: thickness,
    );
  }
}
