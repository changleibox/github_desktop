// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// Minimum padding from edges of the segmented control to edges of
// encompassing widget.
const EdgeInsetsGeometry _kHorizontalItemPadding = EdgeInsets.symmetric(horizontal: 16.0);

// Minimum height of the segmented control.
const double _kMinSegmentedControlHeight = 28.0;

// The duration of the fade animation used to transition when a new widget
// is selected.
const Duration _kFadeDuration = Duration(milliseconds: 165);

// 圆角
const Radius _kRadius = Radius.circular(6.0);

/// An iOS-style segmented control.
///
/// Displays the widgets provided in the [Map] of [children] in a
/// horizontal list. Used to select between a number of mutually exclusive
/// options. When one option in the segmented control is selected, the other
/// options in the segmented control cease to be selected.
///
/// A segmented control can feature any [Widget] as one of the values in its
/// [Map] of [children]. The type T is the type of the keys used
/// to identify each widget and determine which widget is selected. As
/// required by the [Map] class, keys must be of consistent types
/// and must be comparable. The ordering of the keys will determine the order
/// of the widgets in the segmented control.
///
/// When the state of the segmented control changes, the widget calls the
/// [onValueChanged] callback. The map key associated with the newly selected
/// widget is returned in the [onValueChanged] callback. Typically, widgets
/// that use a segmented control will listen for the [onValueChanged] callback
/// and rebuild the segmented control with a new [groupValue] to update which
/// option is currently selected.
///
/// The [children] will be displayed in the order of the keys in the [Map].
/// The height of the segmented control is determined by the height of the
/// tallest widget provided as a value in the [Map] of [children].
/// The width of each child in the segmented control will be equal to the width
/// of widest child, unless the combined width of the children is wider than
/// the available horizontal space. In this case, the available horizontal space
/// is divided by the number of provided [children] to determine the width of
/// each widget. The selection area for each of the widgets in the [Map] of
/// [children] will then be expanded to fill the calculated space, so each
/// widget will appear to have the same dimensions.
///
/// A segmented control may optionally be created with custom colors. The
/// [unselectedColor], [selectedColor], [borderColor], and [pressedColor]
/// arguments can be used to override the segmented control's colors from
/// [CupertinoTheme] defaults.
///
/// See also:
///
///  * [SegmentedControl], a segmented control widget in the style used
///    up until iOS 13.
///  * <https://developer.apple.com/design/human-interface-guidelines/ios/controls/segmented-controls/>
class SegmentedControl<T extends Object> extends StatefulWidget {
  /// Creates an iOS-style segmented control bar.
  ///
  /// The [children] and [onValueChanged] arguments must not be null. The
  /// [children] argument must be an ordered [Map] such as a [LinkedHashMap].
  /// Further, the length of the [children] list must be greater than one.
  ///
  /// Each widget value in the map of [children] must have an associated key
  /// that uniquely identifies this widget. This key is what will be returned
  /// in the [onValueChanged] callback when a new value from the [children] map
  /// is selected.
  ///
  /// The [groupValue] is the currently selected value for the segmented control.
  /// If no [groupValue] is provided, or the [groupValue] is null, no widget will
  /// appear as selected. The [groupValue] must be either null or one of the keys
  /// in the [children] map.
  SegmentedControl({
    Key key,
    @required this.children,
    @required this.onValueChanged,
    this.groupValue,
    this.unselectedColor,
    this.selectedColor,
    this.borderColor,
    this.selectedBorderColor,
    this.pressedColor,
    this.padding,
    this.radius = const BorderRadius.all(_kRadius),
  })  : assert(children != null),
        assert(children.length >= 2),
        assert(onValueChanged != null),
        assert(
          groupValue == null || children.keys.any((T child) => child == groupValue),
          'The groupValue must be either null or one of the keys in the children map.',
        ),
        super(key: key);

  /// The identifying keys and corresponding widget values in the
  /// segmented control.
  ///
  /// The map must have more than one entry.
  /// This attribute must be an ordered [Map] such as a [LinkedHashMap].
  final Map<T, Widget> children;

  /// The identifier of the widget that is currently selected.
  ///
  /// This must be one of the keys in the [Map] of [children].
  /// If this attribute is null, no widget will be initially selected.
  final T groupValue;

  /// The callback that is called when a new option is tapped.
  ///
  /// This attribute must not be null.
  ///
  /// The segmented control passes the newly selected widget's associated key
  /// to the callback but does not actually change state until the parent
  /// widget rebuilds the segmented control with the new [groupValue].
  ///
  /// The callback provided to [onValueChanged] should update the state of
  /// the parent [StatefulWidget] using the [State.setState] method, so that
  /// the parent gets rebuilt; for example:
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// class SegmentedControlExample extends StatefulWidget {
  ///   const SegmentedControlExample({Key? key}) : super(key: key);
  ///
  ///   @override
  ///   State createState() => SegmentedControlExampleState();
  /// }
  ///
  /// class SegmentedControlExampleState extends State<SegmentedControlExample> {
  ///   final Map<int, Widget> children = const <int, Widget>{
  ///     0: Text('Child 1'),
  ///     1: Text('Child 2'),
  ///   };
  ///
  ///   late int currentValue;
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return CupertinoSegmentedControl<int>(
  ///       children: children,
  ///       onValueChanged: (int newValue) {
  ///         setState(() {
  ///           currentValue = newValue;
  ///         });
  ///       },
  ///       groupValue: currentValue,
  ///     );
  ///   }
  /// }
  /// ```
  /// {@end-tool}
  final ValueChanged<T> onValueChanged;

  /// The color used to fill the backgrounds of unselected widgets and as the
  /// text color of the selected widget.
  ///
  /// Defaults to [CupertinoTheme]'s `primaryContrastingColor` if null.
  final Color unselectedColor;

  /// The color used to fill the background of the selected widget and as the text
  /// color of unselected widgets.
  ///
  /// Defaults to [CupertinoTheme]'s `primaryColor` if null.
  final Color selectedColor;

  /// The color used as the border around each widget.
  ///
  /// Defaults to [CupertinoTheme]'s `primaryColor` if null.
  final Color borderColor;

  /// The color used as the border around each widget.
  ///
  /// Defaults to [CupertinoTheme]'s `primaryColor` if null.
  final Color selectedBorderColor;

  /// The color used to fill the background of the widget the user is
  /// temporarily interacting with through a long press or drag.
  ///
  /// Defaults to the selectedColor at 20% opacity if null.
  final Color pressedColor;

  /// The CupertinoSegmentedControl will be placed inside this padding.
  ///
  /// Defaults to EdgeInsets.symmetric(horizontal: 16.0)
  final EdgeInsetsGeometry padding;

  /// radius
  final BorderRadius radius;

  @override
  _SegmentedControlState<T> createState() => _SegmentedControlState<T>();
}

class _SegmentedControlState<T extends Object> extends State<SegmentedControl<T>> with TickerProviderStateMixin<SegmentedControl<T>> {
  T _pressedKey;

  final List<AnimationController> _selectionControllers = <AnimationController>[];
  final List<ColorTween> _childTweens = <ColorTween>[];

  ColorTween _forwardBackgroundColorTween;
  ColorTween _reverseBackgroundColorTween;
  ColorTween _textColorTween;

  Color _selectedColor;
  Color _unselectedColor;
  Color _borderColor;
  Color _selectedBorderColor;
  Color _pressedColor;

  AnimationController createAnimationController() {
    return AnimationController(
      duration: _kFadeDuration,
      vsync: this,
    )..addListener(() {
        setState(() {
          // State of background/text colors has changed
        });
      });
  }

  bool _updateColors() {
    assert(mounted, 'This should only be called after didUpdateDependencies');
    var changed = false;
    final selectedColor = widget.selectedColor ?? CupertinoTheme.of(context).primaryColor;
    if (_selectedColor != selectedColor) {
      changed = true;
      _selectedColor = selectedColor;
    }
    final unselectedColor = widget.unselectedColor ?? CupertinoTheme.of(context).primaryContrastingColor;
    if (_unselectedColor != unselectedColor) {
      changed = true;
      _unselectedColor = unselectedColor;
    }
    final borderColor = widget.borderColor ?? CupertinoTheme.of(context).primaryColor;
    if (_borderColor != borderColor) {
      changed = true;
      _borderColor = borderColor;
    }
    final selectedBorderColor = widget.selectedBorderColor ?? CupertinoTheme.of(context).primaryColor;
    if (_selectedBorderColor != selectedBorderColor) {
      changed = true;
      _selectedBorderColor = selectedBorderColor;
    }
    final pressedColor = widget.pressedColor ?? CupertinoTheme.of(context).primaryColor.withOpacity(0.2);
    if (_pressedColor != pressedColor) {
      changed = true;
      _pressedColor = pressedColor;
    }

    _forwardBackgroundColorTween = ColorTween(
      begin: _pressedColor,
      end: _selectedColor,
    );
    _reverseBackgroundColorTween = ColorTween(
      begin: _unselectedColor,
      end: _selectedColor,
    );
    _textColorTween = ColorTween(
      begin: _selectedColor,
      end: _unselectedColor,
    );
    return changed;
  }

  void _updateAnimationControllers() {
    assert(mounted, 'This should only be called after didUpdateDependencies');
    for (final controller in _selectionControllers) {
      controller.dispose();
    }
    _selectionControllers.clear();
    _childTweens.clear();

    for (final key in widget.children.keys) {
      final animationController = createAnimationController();
      if (widget.groupValue == key) {
        _childTweens.add(_reverseBackgroundColorTween);
        animationController.value = 1.0;
      } else {
        _childTweens.add(_forwardBackgroundColorTween);
      }
      _selectionControllers.add(animationController);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_updateColors()) {
      _updateAnimationControllers();
    }
  }

  @override
  void didUpdateWidget(SegmentedControl<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_updateColors() || oldWidget.children.length != widget.children.length) {
      _updateAnimationControllers();
    }

    if (oldWidget.groupValue != widget.groupValue) {
      var index = 0;
      for (final key in widget.children.keys) {
        if (widget.groupValue == key) {
          _childTweens[index] = _forwardBackgroundColorTween;
          _selectionControllers[index].forward();
        } else {
          _childTweens[index] = _reverseBackgroundColorTween;
          _selectionControllers[index].reverse();
        }
        index += 1;
      }
    }
  }

  @override
  void dispose() {
    for (final animationController in _selectionControllers) {
      animationController.dispose();
    }
    super.dispose();
  }

  void _onTapDown(T currentKey) {
    if (_pressedKey == null && currentKey != widget.groupValue) {
      setState(() {
        _pressedKey = currentKey;
      });
    }
  }

  void _onTapCancel() {
    setState(() {
      _pressedKey = null;
    });
  }

  void _onTap(T currentKey) {
    if (currentKey != _pressedKey) {
      return;
    }
    if (currentKey != widget.groupValue) {
      widget.onValueChanged(currentKey);
    }
    _pressedKey = null;
  }

  Color getTextColor(int index, T currentKey) {
    if (_selectionControllers[index].isAnimating) {
      return _textColorTween.evaluate(_selectionControllers[index]);
    }
    if (widget.groupValue == currentKey) {
      return _unselectedColor;
    }
    return _selectedColor;
  }

  Color getBackgroundColor(int index, T currentKey) {
    if (_selectionControllers[index].isAnimating) {
      return _childTweens[index].evaluate(_selectionControllers[index]);
    }
    if (widget.groupValue == currentKey) {
      return _selectedColor;
    }
    if (_pressedKey == currentKey) {
      return _pressedColor;
    }
    return _unselectedColor;
  }

  @override
  Widget build(BuildContext context) {
    final _gestureChildren = <Widget>[];
    final _backgroundColors = <Color>[];
    var index = 0;
    int selectedIndex;
    int pressedIndex;
    for (final currentKey in widget.children.keys) {
      selectedIndex = (widget.groupValue == currentKey) ? index : selectedIndex;
      pressedIndex = (_pressedKey == currentKey) ? index : pressedIndex;

      final defaultTextStyle = DefaultTextStyle.of(context).style;
      final textStyle = defaultTextStyle.copyWith(
        color: getTextColor(index, currentKey),
      );
      final iconTheme = IconThemeData(
        color: getTextColor(index, currentKey),
      );

      Widget child = Center(
        child: widget.children[currentKey],
      );

      child = MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          _onTapDown(currentKey);
        },
        onExit: (event) {
          _onTapCancel();
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (TapDownDetails event) {
            _onTapDown(currentKey);
          },
          onTapCancel: _onTapCancel,
          onTap: () {
            _onTap(currentKey);
          },
          child: IconTheme(
            data: iconTheme,
            child: DefaultTextStyle(
              style: textStyle,
              child: Semantics(
                button: true,
                inMutuallyExclusiveGroup: true,
                selected: widget.groupValue == currentKey,
                child: child,
              ),
            ),
          ),
        ),
      );

      _backgroundColors.add(getBackgroundColor(index, currentKey));
      _gestureChildren.add(child);
      index += 1;
    }

    final Widget box = _SegmentedControlRenderWidget<T>(
      selectedIndex: selectedIndex,
      pressedIndex: pressedIndex,
      backgroundColors: _backgroundColors,
      borderColor: _borderColor,
      selectedBorderColor: _selectedBorderColor,
      radius: widget.radius ?? BorderRadius.zero,
      children: _gestureChildren,
    );

    return Padding(
      padding: widget.padding ?? _kHorizontalItemPadding,
      child: UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: box,
      ),
    );
  }
}

class _SegmentedControlRenderWidget<T> extends MultiChildRenderObjectWidget {
  _SegmentedControlRenderWidget({
    Key key,
    List<Widget> children = const <Widget>[],
    @required this.selectedIndex,
    @required this.pressedIndex,
    @required this.backgroundColors,
    @required this.borderColor,
    @required this.selectedBorderColor,
    @required this.radius,
  }) : super(
          key: key,
          children: children,
        );

  final int selectedIndex;
  final int pressedIndex;
  final List<Color> backgroundColors;
  final Color borderColor;
  final Color selectedBorderColor;
  final BorderRadius radius;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSegmentedControl<T>(
      textDirection: Directionality.of(context),
      selectedIndex: selectedIndex,
      pressedIndex: pressedIndex,
      backgroundColors: backgroundColors,
      borderColor: borderColor,
      selectedBorderColor: selectedBorderColor,
      radius: radius,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderSegmentedControl<T> renderObject) {
    renderObject
      ..textDirection = Directionality.of(context)
      ..selectedIndex = selectedIndex
      ..pressedIndex = pressedIndex
      ..backgroundColors = backgroundColors
      ..borderColor = borderColor
      ..selectedBorderColor = selectedBorderColor
      ..radius = radius;
  }
}

class _SegmentedControlContainerBoxParentData extends ContainerBoxParentData<RenderBox> {
  RRect surroundingRect;
}

typedef _NextChild = RenderBox Function(RenderBox child);

class _RenderSegmentedControl<T> extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, ContainerBoxParentData<RenderBox>>,
        RenderBoxContainerDefaultsMixin<RenderBox, ContainerBoxParentData<RenderBox>> {
  _RenderSegmentedControl({
    @required int selectedIndex,
    @required int pressedIndex,
    @required TextDirection textDirection,
    @required List<Color> backgroundColors,
    @required Color borderColor,
    @required Color selectedBorderColor,
    @required BorderRadius radius,
  })  : assert(textDirection != null),
        _textDirection = textDirection,
        _selectedIndex = selectedIndex,
        _pressedIndex = pressedIndex,
        _backgroundColors = backgroundColors,
        _borderColor = borderColor,
        _selectedBorderColor = selectedBorderColor,
        _radius = radius;

  int get selectedIndex => _selectedIndex;
  int _selectedIndex;

  set selectedIndex(int value) {
    if (_selectedIndex == value) {
      return;
    }
    _selectedIndex = value;
    markNeedsPaint();
  }

  int get pressedIndex => _pressedIndex;
  int _pressedIndex;

  set pressedIndex(int value) {
    if (_pressedIndex == value) {
      return;
    }
    _pressedIndex = value;
    markNeedsPaint();
  }

  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;

  set textDirection(TextDirection value) {
    if (_textDirection == value) {
      return;
    }
    _textDirection = value;
    markNeedsLayout();
  }

  List<Color> get backgroundColors => _backgroundColors;
  List<Color> _backgroundColors;

  set backgroundColors(List<Color> value) {
    if (_backgroundColors == value) {
      return;
    }
    _backgroundColors = value;
    markNeedsPaint();
  }

  Color get borderColor => _borderColor;
  Color _borderColor;

  set borderColor(Color value) {
    if (_borderColor == value) {
      return;
    }
    _borderColor = value;
    markNeedsPaint();
  }

  Color get selectedBorderColor => _selectedBorderColor;
  Color _selectedBorderColor;

  set selectedBorderColor(Color value) {
    if (_selectedBorderColor == value) {
      return;
    }
    _selectedBorderColor = value;
    markNeedsPaint();
  }

  BorderRadius get radius => _radius;
  BorderRadius _radius;

  set radius(BorderRadius value) {
    if (_radius == value) {
      return;
    }
    _radius = value;
    markNeedsPaint();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    var child = firstChild;
    var minWidth = 0.0;
    while (child != null) {
      final childParentData = child.parentData as _SegmentedControlContainerBoxParentData;
      final childWidth = child.getMinIntrinsicWidth(height);
      minWidth = math.max(minWidth, childWidth);
      child = childParentData.nextSibling;
    }
    return minWidth * childCount;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    var child = firstChild;
    var maxWidth = 0.0;
    while (child != null) {
      final childParentData = child.parentData as _SegmentedControlContainerBoxParentData;
      final childWidth = child.getMaxIntrinsicWidth(height);
      maxWidth = math.max(maxWidth, childWidth);
      child = childParentData.nextSibling;
    }
    return maxWidth * childCount;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    var child = firstChild;
    var minHeight = 0.0;
    while (child != null) {
      final childParentData = child.parentData as _SegmentedControlContainerBoxParentData;
      final childHeight = child.getMinIntrinsicHeight(width);
      minHeight = math.max(minHeight, childHeight);
      child = childParentData.nextSibling;
    }
    return minHeight;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    var child = firstChild;
    var maxHeight = 0.0;
    while (child != null) {
      final childParentData = child.parentData as _SegmentedControlContainerBoxParentData;
      final childHeight = child.getMaxIntrinsicHeight(width);
      maxHeight = math.max(maxHeight, childHeight);
      child = childParentData.nextSibling;
    }
    return maxHeight;
  }

  @override
  double computeDistanceToActualBaseline(TextBaseline baseline) {
    return defaultComputeDistanceToHighestActualBaseline(baseline);
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _SegmentedControlContainerBoxParentData) {
      child.parentData = _SegmentedControlContainerBoxParentData();
    }
  }

  void _layoutRects(_NextChild nextChild, RenderBox leftChild, RenderBox rightChild) {
    var child = leftChild;
    var start = 0.0;
    while (child != null) {
      final childParentData = child.parentData as _SegmentedControlContainerBoxParentData;
      final childOffset = Offset(start, 0.0);
      childParentData.offset = childOffset;
      final childRect = Rect.fromLTWH(start, 0.0, child.size.width, child.size.height);
      RRect rChildRect;
      if (child == leftChild) {
        rChildRect = RRect.fromRectAndCorners(childRect, topLeft: radius.topLeft, bottomLeft: radius.bottomLeft);
      } else if (child == rightChild) {
        rChildRect = RRect.fromRectAndCorners(childRect, topRight: radius.topRight, bottomRight: radius.bottomRight);
      } else {
        rChildRect = RRect.fromRectAndCorners(childRect);
      }
      childParentData.surroundingRect = rChildRect;
      start += child.size.width;
      child = nextChild(child);
    }
  }

  double _calculateChildHeight(BoxConstraints constraints) {
    var maxHeight = _kMinSegmentedControlHeight;
    var childWidth = constraints.minWidth / childCount;
    var child = firstChild;
    while (child != null) {
      childWidth = math.max(childWidth, child.getMaxIntrinsicWidth(double.infinity));
      child = childAfter(child);
    }
    childWidth = math.min(childWidth, constraints.maxWidth / childCount);
    child = firstChild;
    while (child != null) {
      final boxHeight = child.getMaxIntrinsicHeight(childWidth);
      maxHeight = math.max(maxHeight, boxHeight);
      child = childAfter(child);
    }
    return maxHeight;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.constrain(Size(constraints.maxWidth, _calculateChildHeight(constraints)));
  }

  @override
  void performLayout() {
    final constraints = this.constraints;

    final childConstraints = BoxConstraints.tightFor(
      height: _calculateChildHeight(constraints),
    );

    var child = firstChild;
    var currentWidth = 0.0;
    while (child != null) {
      child.layout(childConstraints, parentUsesSize: true);

      currentWidth += child.size.width;

      child = childAfter(child);
    }

    switch (textDirection) {
      case TextDirection.rtl:
        _layoutRects(
          childBefore,
          lastChild,
          firstChild,
        );
        break;
      case TextDirection.ltr:
        _layoutRects(
          childAfter,
          firstChild,
          lastChild,
        );
        break;
    }

    size = constraints.constrain(Size(currentWidth, _calculateChildHeight(constraints)));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    var child = firstChild;
    var index = 0;
    RenderBox selectedChild;
    while (child != null) {
      if (index == selectedIndex) {
        selectedChild = child;
      } else {
        _paintChild(context, offset, child, index);
      }
      child = childAfter(child);
      index += 1;
    }
    _paintChild(context, offset, selectedChild, selectedIndex);
  }

  void _paintChild(PaintingContext context, Offset offset, RenderBox child, int childIndex) {
    assert(child != null);

    final childParentData = child.parentData as _SegmentedControlContainerBoxParentData;

    context.canvas.drawRRect(
      childParentData.surroundingRect.shift(offset),
      Paint()
        ..color = backgroundColors[childIndex]
        ..style = PaintingStyle.fill,
    );
    final selected = selectedIndex == childIndex;
    context.canvas.drawRRect(
      childParentData.surroundingRect.shift(offset),
      Paint()
        ..color = selected ? selectedBorderColor : borderColor
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke,
    );

    context.paintChild(child, childParentData.offset + offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {@required Offset position}) {
    assert(position != null);
    var child = lastChild;
    while (child != null) {
      final childParentData = child.parentData as _SegmentedControlContainerBoxParentData;
      if (childParentData.surroundingRect.contains(position)) {
        return result.addWithPaintOffset(
          offset: childParentData.offset,
          position: position,
          hitTest: (BoxHitTestResult result, Offset localOffset) {
            assert(localOffset == position - childParentData.offset);
            return child.hitTest(result, position: localOffset);
          },
        );
      }
      child = childParentData.previousSibling;
    }
    return false;
  }
}
