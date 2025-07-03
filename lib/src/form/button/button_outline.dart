import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/theme.dart';
import '../../fondation/tfont.dart';

class TButtonOutline extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final Color? borderColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool loading;
  final Widget? child;
  final Size minimumSize;
  final Size maximumSize;
  final double minFontSize;
  final bool centerContent;

  const TButtonOutline({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 8,
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.loading = false,
    this.child,
    this.minimumSize = const Size(double.infinity, 48),
    this.maximumSize = const Size(double.infinity, 48),
    this.minFontSize = 12.0,
    this.centerContent = true,
  });

  const TButtonOutline.icon({
    super.key,
    required Widget icon,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 8,
    this.borderColor,
    this.padding = EdgeInsets.zero,
    this.textStyle,
    this.loading = false,
    this.minimumSize = const Size(48, 40),
    this.maximumSize = const Size(48, 40),
    this.minFontSize = 12.0,
    this.centerContent = true,
  })  : child = icon,
        text = null,
        suffixIcon = null,
        prefixIcon = null;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          width: 1.0,
          color: borderColor ?? theme.primary,
        ),
        minimumSize: minimumSize,
        maximumSize: maximumSize,
      ),
      onPressed: loading ? null : onPressed,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    if (child != null) {
      return child!;
    }

    // Determine what icons to show
    Widget? leadingIcon = loading
        ? SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              color: theme.primary,
              strokeWidth: 2,
            ),
          )
        : prefixIcon;

    Widget? trailingIcon = loading ? null : suffixIcon;

    List<Widget> children = [];

    if (leadingIcon != null) {
      children.add(leadingIcon);
    }

    if (leadingIcon != null && text != null) {
      children.add(const SizedBox(width: 10));
    }

    if (text != null) {
      children.add(
        Flexible(
          fit: FlexFit.loose,
          child: AutoSizeText(
            text!,
            maxLines: 1,
            minFontSize: minFontSize,
            stepGranularity: 0.5,
            overflow: TextOverflow.ellipsis,
            style: textStyle ??
                TFontBold.body(context).copyWith(color: theme.primary),
          ),
        ),
      );
    }

    if (trailingIcon != null && text != null) {
      children.add(const SizedBox(width: 10));
    }

    if (trailingIcon != null) {
      children.add(trailingIcon);
    }

    bool hasLeading = leadingIcon != null;
    bool hasTrailing = trailingIcon != null;
    bool hasOnlyText = !hasLeading && !hasTrailing;

    if (!centerContent) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (hasLeading) children[0],
          if (hasLeading && text != null) children[1],
          if (text != null)
            Expanded(
              child: AutoSizeText(
                text!,
                maxLines: 1,
                minFontSize: minFontSize,
                textAlign: hasOnlyText ? TextAlign.center : TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: textStyle ??
                    TFontBold.body(context).copyWith(color: theme.primary),
              ),
            ),
          if (hasTrailing && text != null) children[children.length - 2],
          if (hasTrailing) children.last,
        ],
      );
    }

    if (hasOnlyText) {
      // Only text - center it
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    } else if (hasLeading && !hasTrailing) {
      // Leading icon + text - center both together
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    } else if (!hasLeading && hasTrailing) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          children[0], // leading icon
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children.sublist(1, children.length - 1),
            ),
          ),
          children.last, // trailing icon
        ],
      );
    }
  }
}
