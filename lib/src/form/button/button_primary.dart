import 'package:flutter/material.dart';

import '../../fondation/hex_color.dart';
import '../../fondation/tfont.dart';

class TButtonPrimary extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? onPressedBackgroundColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool loading;
  final Widget? child;

  const TButtonPrimary({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.onPressedBackgroundColor,
    this.borderRadius = 8,
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.loading = false,
    this.child,
    this.padding,
  });

  const TButtonPrimary.icon({
    super.key,
    required Widget icon,
    required this.onPressed,
    this.backgroundColor,
    this.onPressedBackgroundColor,
    this.borderRadius = 8,
    this.textStyle,
    this.loading = false,
  })  : child = icon,
        text = null,
        suffixIcon = null,
        prefixIcon = null,
        padding = EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? HexColor(primary500), // Default background
        foregroundColor: Colors.white, // Default text/icon color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Increased rounded corners
        ),
        padding: padding,
        // padding: padding,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return onPressedBackgroundColor ??
                  HexColor(primary600); // Pressed state color
            }
            return backgroundColor ?? HexColor(primary500); // Default color
          },
        ),
      ),
      onPressed: loading ? null : onPressed,
      child: loading
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                if (text != null) SizedBox(width: 8),
                if (text != null)
                  Text(
                    text!,
                    style: textStyle ??
                        TFontBold.body.copyWith(color: Colors.white),
                  ),
              ],
            )
          : child ?? _buildContent(),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixIcon != null) prefixIcon!,
        if (prefixIcon != null && text != null) SizedBox(width: 10),
        if (text != null)
          Text(
            text!,
            style: textStyle ?? TFontBold.body.copyWith(color: Colors.white),
          ),
        if (suffixIcon != null && text != null) SizedBox(width: 10),
        if (suffixIcon != null) suffixIcon!,
      ],
    );
  }
}
