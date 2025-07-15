import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A customizable Accordion (ExpansionTile) widget for Flutter UI.
///
/// The `TAccordion` provides a collapsible panel that expands or collapses
/// when tapped, revealing or hiding the provided `child` widget.
///
/// ### Features:
/// - Customizable title and trailing icon
/// - Optional border and background decoration
/// - Animated icon rotation to indicate expansion
/// - Supports dynamic theming via `TThemeManager`
/// - Optional divider at the bottom of the expanded content
///
/// ### Parameters:
/// - `title`: The main label displayed in the accordion header.
/// - `child`: The widget displayed when the accordion is expanded.
/// - `initiallyExpanded`: Whether the accordion starts in expanded state.
/// - `borderColor`: Color of the bottom divider when expanded (optional).
/// - `borderWidth`: Thickness of the bottom divider when expanded (default is `0.5`).
/// - `showDivider`: Whether to display a divider below the `child` content (default is `true`).
/// - `enableDecoration`: If `true`, wraps the accordion with a decorated container (e.g., border, background color).
/// - `decoration`: Custom `BoxDecoration` for the container (used if `enableDecoration` is `true`).
/// - `trailing`: Custom trailing widget (e.g., custom arrow icon). Defaults to an animated `Icons.keyboard_arrow_up`.
/// - `titleStyle`: Custom `TextStyle` for the title.
/// - `padding`: Reserved for future use (currently unused).
///
/// ### Example:
/// ```dart
/// TAccordion(
///   title: "Order Details",
///   child: Column(
///     children: [
///       Text("Order ID: 12345"),
///       Text("Status: Shipped"),
///     ],
///   ),
///   initiallyExpanded: false,
///   enableDecoration: true,
///   trailing: Icon(Icons.expand_more),
/// )
/// ```
///
/// ### Notes:
/// - The trailing icon automatically rotates when expanded/collapsed.
/// - The widget integrates with `TThemeManager` for dynamic theming support.
/// - `padding` is included for API consistency but currently not applied.
///
/// ---
class TAccordion extends StatefulWidget {
  final String title;
  final Widget? child;
  final bool initiallyExpanded;
  final Color? borderColor;
  final double borderWidth;
  final bool showDivider;
  final bool enableDecoration;
  final BoxDecoration? decoration;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final EdgeInsets? padding;

  const TAccordion({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
    this.borderColor,
    this.borderWidth = 0.5,
    this.showDivider = true,
    this.enableDecoration = false,
    this.decoration,
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
    final theme = context.watch<TThemeManager>().state;
    BoxDecoration? boxDecoration;
    if (widget.enableDecoration) {
      boxDecoration = widget.decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: HexColor(gray200),
              width: 1.0,
            ),
            color: theme.background,
          );
    }

    return Container(
      decoration: boxDecoration,
      margin: EdgeInsets.zero,
      child: ExpansionTile(
        initiallyExpanded: widget.initiallyExpanded,
        collapsedIconColor: theme.foreground,
        iconColor: theme.foreground,
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
        ),
        title: Text(
          widget.title,
          style: widget.titleStyle ??
              TFontBold.body(context)
                  .copyWith(color: theme.foreground),
        ),
        trailing: AnimatedRotation(
          turns: isExpanded ? 0.5 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: widget.trailing ?? const Icon(Icons.keyboard_arrow_up),
        ),
        tilePadding: const EdgeInsets.symmetric(horizontal: 18.0),
        childrenPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        children: [
          widget.child ?? const SizedBox.shrink(),
          if (widget.showDivider)
            Divider(
              color: widget.borderColor ?? theme.border,
              thickness: widget.borderWidth,
            ),
        ],
      ),
    );
  }
}
