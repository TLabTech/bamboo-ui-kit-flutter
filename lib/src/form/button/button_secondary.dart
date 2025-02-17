import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

import '../../fondation/hex_color.dart';

class TButtonSecondary extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool loading;
  final Widget? child;

  const TButtonSecondary({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 8,
    this.padding,
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.loading = false,
    this.child,
  });

  const TButtonSecondary.icon(
      {super.key,
      required Widget icon,
      required this.onPressed,
      this.backgroundColor = Colors.transparent,
      this.borderRadius = 8,
      this.padding,
      this.textStyle,
      this.loading = false})
      : child = icon,
        text = null,
        suffixIcon = null,
        prefixIcon = null;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(width: 1.0, color: HexColor(neutral400)),
      ),
      onPressed: onPressed,
      child: loading
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    color: HexColor(neutral900),
                  ),
                ),
                if (text != null) SizedBox(width: 8),
                if (text != null)
                  Text(
                    text!,
                    style: textStyle ??
                        TFontBold.body.copyWith(color: HexColor(neutral900)),
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
            style: textStyle ??
                TFontBold.body.copyWith(color: HexColor(neutral900)),
          ),
        if (suffixIcon != null && text != null) SizedBox(width: 10),
        if (suffixIcon != null) suffixIcon!,
      ],
    );
  }
}
