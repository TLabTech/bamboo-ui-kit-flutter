import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/fondation/tfont.dart';

class TButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final double padding;
  final TextStyle? textStyle;

  const TButtonPrimary({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.blue,
    this.borderRadius = 8,
    this.padding = 16,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? TFontBold.body,
      ),
    );
  }
}

class TButtonSecondary extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final double padding;
  final TextStyle? textStyle;

  const TButtonSecondary({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.borderRadius = 8,
    this.padding = 16,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? TFontBold.body,
      ),
    );
  }
}
