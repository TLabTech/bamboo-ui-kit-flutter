import 'package:flutter/material.dart';
import '../../fondation/hex_color.dart';
import '../../fondation/tfont.dart';

/// A customizable badge widget for displaying labels with various styles.
///
/// This widget provides different badge styles including primary, secondary,
/// outline, and destructive. It is designed for use in UI elements that require
/// labeled indicators.
class TBadge extends StatelessWidget {
  /// The text displayed inside the badge.
  final String label;

  /// The background color of the badge.
  final Color backgroundColor;

  /// The text color of the badge label.
  final Color textColor;

  /// The optional border color for outlined badges.
  final Color? borderColor;

  /// Default primary badge constructor.
  ///
  /// If no colors are provided, it defaults to `primary500` for background and
  /// `Colors.white` for text.
  TBadge({
    Key? key,
    required String label,
    Color? backgroundColor,
    Color? textColor,
  }) : this._(
          label: label,
          backgroundColor: backgroundColor ?? HexColor(primary500),
          textColor: textColor ?? Colors.white,
        );

  TBadge.primary({
    Key? key,
    required String label,
  }) : this._(
    label: label,
    backgroundColor: HexColor(primary050),
    textColor: HexColor(primary500),
  );

  /// Secondary badge style with a light background.
  ///
  /// Defaults to `gray050` background and `gray500` text color.
  TBadge.secondary({
    Key? key,
    required String label,
    Color? backgroundColor,
    Color? textColor,
  }) : this._(
          label: label,
          backgroundColor: backgroundColor ?? HexColor(gray050),
          textColor: textColor ?? HexColor(gray500),
        );

  /// Outlined badge style with a transparent background and a border.
  ///
  /// Defaults to `primary500` for text and border color.
  TBadge.outline({
    Key? key,
    required String label,
    Color? textColor,
    Color? borderColor,
  }) : this._(
          label: label,
          backgroundColor: Colors.transparent,
          textColor: textColor ?? HexColor(primary500),
          borderColor: borderColor ?? HexColor(primary500),
        );

  /// Destructive badge style with a red background, indicating a warning or error.
  ///
  /// Defaults to `red500` background and white text color.
  TBadge.destructive({
    Key? key,
    required String label,
  }) : this._(
          label: label,
          backgroundColor: HexColor(red050),
          textColor: HexColor(red500),
        );

  /// Private constructor used internally by the named constructors.
  const TBadge._({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 22.0, // Minimum height
          minWidth: 50.0, // Minimum width
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: backgroundColor,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1.0)
              : null,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TFontBold.caption2(context).copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
