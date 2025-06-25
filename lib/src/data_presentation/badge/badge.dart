import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TBadgeType { raw, primary, secondary, outline, destructive, general }

/// A customizable badge widget for displaying labels with various styles.
///
/// This widget provides different badge styles including primary, secondary,
/// outline, and destructive. It is designed for use in UI elements that require
/// labeled indicators.
class TBadge extends StatelessWidget {
  /// The text displayed inside the badge.
  final String label;

  /// The background color of the badge.
  final Color? backgroundColor;

  /// The text color of the badge label.
  final Color? textColor;

  /// The optional border color for outlined badges.
  final Color? borderColor;
  final TBadgeType badgeType;

  /// Default primary badge constructor.
  const TBadge({
    Key? key,
    required String label,
    Color? backgroundColor,
    Color? textColor,
  }) : this._(
          label: label,
          backgroundColor: backgroundColor,
          textColor: textColor,
          badgeType: TBadgeType.raw,
        );

  const TBadge.primary({
    Key? key,
    required String label,
  }) : this._(
          label: label,
          badgeType: TBadgeType.primary,
        );

  const TBadge.secondary({
    Key? key,
    required String label,
  }) : this._(
          label: label,
          badgeType: TBadgeType.secondary,
        );

  const TBadge.outline({
    Key? key,
    required String label,
    Color? textColor,
    Color? borderColor,
  }) : this._(
          label: label,
          borderColor: borderColor,
          textColor: textColor,
          badgeType: TBadgeType.outline,
        );

  const TBadge.destructive({
    Key? key,
    required String label,
  }) : this._(
          label: label,
          badgeType: TBadgeType.destructive,
        );

  const TBadge.general({
    Key? key,
    required String label,
  }) : this._(
          label: label,
          badgeType: TBadgeType.general,
        );

  /// Private constructor used internally by the named constructors.
  const TBadge._({
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    required this.badgeType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    Color backgroundColor;
    Color textColor;
    Color? borderColor;

    switch (badgeType) {
      case TBadgeType.primary:
        backgroundColor = theme.primaryForeground;
        textColor = theme.primary;
        break;
      case TBadgeType.secondary:
        backgroundColor = theme.muted;
        textColor = theme.mutedForeground;
        break;
      case TBadgeType.outline:
        backgroundColor = Colors.transparent;
        textColor = theme.primary;
        borderColor = theme.primary;
        break;
      case TBadgeType.destructive:
        backgroundColor = theme.destructiveForeground;
        textColor = theme.destructive;
        break;
      case TBadgeType.general:
        backgroundColor = Colors.white;
        textColor = theme.foreground;
        borderColor = theme.border;
        break;
      default:
        backgroundColor = this.backgroundColor ?? theme.primaryForeground;
        textColor = this.textColor ?? theme.primary;
        borderColor = this.borderColor;
    }

    return IntrinsicWidth(
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 22.0,
          minWidth: 50.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: backgroundColor,
          border: borderColor != null || borderColor != null
              ? Border.all(
                  color: borderColor,
                  width: 1.0,
                )
              : null,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TFontBold.caption2(context).copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
