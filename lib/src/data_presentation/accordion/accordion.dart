import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import '../../fondation/hex_color.dart';

/// A customizable accordion (expansion tile) widget.
///
/// The `TAccordion` widget provides an expandable panel that can show or hide
/// content when tapped. It allows customization of its appearance, including
/// title styling, border properties, and trailing widget.
///
/// ### Example Usage:
/// ```dart
/// TAccordion(
///   title: "Accordion Title",
///   child: Padding(
///     padding: EdgeInsets.all(8.0),
///     child: Text("This is the expanded content"),
///   ),
///   initiallyExpanded: false,
///   borderColor: Colors.grey,
///   borderWidth: 1.0,
///   showDivider: true,
///   trailing: Icon(Icons.arrow_drop_down),
///   titleStyle: TextStyle(fontWeight: FontWeight.bold),
///   padding: EdgeInsets.all(8.0),
/// )
/// ```
///
/// The accordion expands or collapses when tapped, showing or hiding its child widget.
class TAccordion extends StatefulWidget {
  /// The title text displayed on the accordion header.
  final String title;

  /// The widget displayed when the accordion is expanded.
  final Widget? child;

  /// Determines whether the accordion starts in an expanded state.
  final bool initiallyExpanded;

  /// The border color of the accordion when expanded.
  final Color? borderColor;

  /// The border width of the accordion when expanded.
  final double borderWidth;

  /// Whether to show a divider line at the bottom of the expanded content.
  final bool showDivider;

  /// A widget displayed on the right side of the accordion header.
  final Widget? trailing;

  /// The style of the title text.
  final TextStyle? titleStyle;

  /// Padding for the expanded content.
  final EdgeInsets? padding;

  /// Creates an instance of `TAccordion`.
  ///
  /// - [title]: The header text of the accordion (required).
  /// - [child]: The content displayed when expanded.
  /// - [initiallyExpanded]: If `true`, the accordion starts expanded (default: `false`).
  /// - [borderColor]: Color of the border when expanded (default: `null`).
  /// - [borderWidth]: Thickness of the border (default: `0.5`).
  /// - [showDivider]: Whether to show a divider at the bottom (default: `true`).
  /// - [trailing]: A widget displayed on the right side (default: expand/collapse icon).
  /// - [titleStyle]: Custom text style for the title.
  /// - [padding]: Padding for the expanded content.
  const TAccordion({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
    this.borderColor,
    this.borderWidth = 0.5,
    this.showDivider = true,
    this.titleStyle,
    this.trailing,
    this.padding,
  });

  @override
  State<TAccordion> createState() => _TAccordionState();
}

class _TAccordionState extends State<TAccordion> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: widget.initiallyExpanded,
      collapsedIconColor: HexColor(gray700),
      iconColor: HexColor(gray700),
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      title: Text(
        widget.title,
        style: widget.titleStyle ??
            TFontBold.body(context).copyWith(color: HexColor(gray900)),
      ),
      trailing: AnimatedRotation(
        turns: isExpanded ? 0.5 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: widget.trailing ?? const Icon(Icons.expand_more),
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 0),
      onExpansionChanged: (expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
      children: [
        Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: widget.child,
        ),
        if (widget.showDivider)
          Divider(
            color: widget.borderColor ?? HexColor(gray300),
            thickness: widget.borderWidth,
          ),
      ],
    );
  }
}
