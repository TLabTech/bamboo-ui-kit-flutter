import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/theme.dart';

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
  final double minWidth;
  final double minHeight;

  const TButtonSecondary({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.loading = false,
    this.child,
    this.minWidth = 44.0,
    this.minHeight = 44.0,
  });

  const TButtonSecondary.icon({
    super.key,
    required Widget icon,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 8,
    this.padding = EdgeInsets.zero,
    this.textStyle,
    this.loading = false,
    this.minWidth = 44.0,
    this.minHeight = 44.0,
  })  : child = icon,
        text = null,
        suffixIcon = null,
        prefixIcon = null;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(width: 1.0, color: theme.border),
        minimumSize: Size(minWidth, minHeight),
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.transparent;
            }
            return Colors.transparent;
          },
        ),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
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
                    color: theme.foreground,
                  ),
                ),
                if (text != null) SizedBox(width: 8),
                if (text != null)
                  Text(
                    text!,
                    style: textStyle ??
                        TFontBold.body(context)
                            .copyWith(color: theme.foreground),
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
        if (hasPrefix && text != null) SizedBox(width: 10),
        if (text != null)
          Expanded(
            child: Text(
              text!,
              textAlign: hasOnlyText ? TextAlign.center : TextAlign.left,
              style: textStyle ??
                  TFontBold.body(context).copyWith(color: theme.foreground),
            ),
          ),
        if (text != null && hasSuffix) Spacer(),
        if (suffixIcon != null) suffixIcon!,
      ],
    );
  }
}
