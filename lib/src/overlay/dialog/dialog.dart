import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonPositive;
  final String buttonNegative;
  final Axis direction;
  final Color? backgroundColor;
  final VoidCallback onPositivePressed;
  final VoidCallback onNegativePressed;

  const TDialog({
    super.key,
    required this.title,
    required this.content,
    required this.direction,
    required this.onPositivePressed,
    required this.onNegativePressed,
    this.backgroundColor,
    this.buttonNegative = "Cancel",
    this.buttonPositive = "Yes",
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    return Align(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: backgroundColor ?? theme.background,
        contentPadding: const EdgeInsets.all(20),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: direction == Axis.horizontal
              ? _buildHorizontalContent(context, theme)
              : _buildVerticalContent(context, theme),
        ),
      ),
    );
  }

  Widget _buildHorizontalContent(BuildContext context, TTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TFontBold.title3(context).copyWith(color: theme.foreground),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style:
              TFontRegular.body(context).copyWith(color: theme.mutedForeground),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TButtonSecondary(
                text: buttonNegative,
                onPressed: onNegativePressed,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TButtonPrimary(
                text: buttonPositive,
                onPressed: onPositivePressed,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVerticalContent(BuildContext context, TTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TFontBold.title3(context).copyWith(color: theme.foreground),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          textAlign: TextAlign.center,
          style:
              TFontRegular.body(context).copyWith(color: theme.mutedForeground),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: TButtonPrimary(
            text: buttonPositive,
            onPressed: onPositivePressed,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: double.infinity,
          child: TButtonSecondary(
            text: buttonNegative,
            onPressed: onNegativePressed,
          ),
        ),
      ],
    );
  }
}
