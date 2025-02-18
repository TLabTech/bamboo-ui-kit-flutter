import 'package:flutter/material.dart';
import '../../fondation/hex_color.dart';
import '../../fondation/tfont.dart';

class TBadge extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const TBadge._({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
  });

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

  TBadge.secondary({
    Key? key,
    required String label,
    Color? backgroundColor,
    Color? textColor,
  }) : this._(
    label: label,
    backgroundColor: backgroundColor ?? HexColor(neutral050),
    textColor: textColor ?? HexColor(neutral500),
  );

  TBadge.outline({
    Key? key,
    required String label,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
  }) : this._(
    label: label,
    backgroundColor: backgroundColor ?? Colors.transparent,
    textColor: textColor ?? HexColor(primary500),
    borderColor: borderColor ?? HexColor(primary500),
  );

  TBadge.destructive({
    Key? key,
    required String label,
    Color? backgroundColor,
    Color? textColor,
  }) : this._(
    label: label,
    backgroundColor: backgroundColor ?? HexColor(danger500),
    textColor: textColor ?? Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 22.0, // Minimum height
          minWidth: 50.0,  // Minimum width
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: backgroundColor,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1.0)
              : null,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TFontBold.caption2.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}