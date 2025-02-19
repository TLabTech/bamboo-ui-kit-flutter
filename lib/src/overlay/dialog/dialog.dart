import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

class TDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonPositive;
  final String buttonNegative;
  final Axis direction;
  final VoidCallback onPositivePressed;
  final VoidCallback onNegativePressed;

  const TDialog({
    super.key,
    required this.title,
    required this.content,
    required this.direction,
    required this.onPositivePressed,
    required this.onNegativePressed,
    this.buttonNegative = "Cancel",
    this.buttonPositive = "Yes",
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: direction == Axis.horizontal
            ? _buildHorizontalContent()
            : _buildVerticalContent(),
      ),
    );
  }

  Widget _buildHorizontalContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TFontBold.title3.copyWith(color: HexColor(neutral900)),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: TFontRegular.body.copyWith(color: HexColor(neutral500)),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TButtonSecondary(text: buttonNegative, onPressed: onNegativePressed),
            const SizedBox(width: 8),
            TButtonPrimary(text: buttonPositive, onPressed: onPositivePressed),
          ],
        ),
      ],
    );
  }

  Widget _buildVerticalContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TFontBold.title3.copyWith(color: HexColor(neutral900)),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          textAlign: TextAlign.center,
          style: TFontRegular.body.copyWith(color: HexColor(neutral500)),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: TButtonPrimary(text: buttonPositive, onPressed: onPositivePressed),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: double.infinity,
          child: TButtonSecondary(text: buttonNegative, onPressed: onNegativePressed),
        ),
      ],
    );
  }
}
