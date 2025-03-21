import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/theme.dart';
import '../../fondation/tfont.dart';

class TButtonDestructive extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? onPressedBackgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool loading;
  final Widget? child;

  const TButtonDestructive({
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

  const TButtonDestructive.icon({
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
    final theme = context.watch<TThemeManager>().state;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.destructive,
        foregroundColor: theme.destructiveForeground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: padding,
        // padding: padding,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return onPressedBackgroundColor ?? theme.destructivePressed;
            }
            return backgroundColor ?? theme.destructive;
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
                    color: theme.destructiveForeground,
                  ),
                ),
                if (text != null) SizedBox(width: 8),
                if (text != null)
                  Text(
                    text!,
                    style: textStyle ??
                        TFontBold.body(context)
                            .copyWith(color: theme.destructiveForeground),
                  ),
              ],
            )
          : child ?? _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    bool hasPrefix = prefixIcon != null;
    bool hasSuffix = suffixIcon != null;
    bool hasOnlyText = !hasPrefix && !hasSuffix;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (prefixIcon != null) prefixIcon!,
        if (prefixIcon != null && text != null) SizedBox(width: 10),
        if (text != null)
          Expanded(
            child: Text(
              text!,
              textAlign: hasOnlyText ? TextAlign.center : TextAlign.left,
              style: textStyle ??
                  TFontBold.body(context)
                      .copyWith(color: theme.destructiveForeground),
            ),
          ),
        if (suffixIcon != null && text != null) SizedBox(width: 10),
        if (suffixIcon != null) suffixIcon!,
      ],
    );
  }
}
