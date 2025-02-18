import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

import '../../fondation/hex_color.dart';

class TAccordion extends StatelessWidget {
  final String title;
  final String description;
  final bool initiallyExpanded;
  final Color? borderColor;
  final double borderWidth;
  final bool showDivider;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const TAccordion({
    super.key,
    required this.title,
    required this.description,
    this.initiallyExpanded = false,
    this.borderColor,
    this.borderWidth = 0.5,
    this.showDivider = true,
    this.trailing,
    this.titleStyle,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      collapsedIconColor: HexColor(neutral700),
      iconColor: HexColor(neutral700),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      title: Text(
        title,
        style:
            titleStyle ?? TFontBold.body.copyWith(color: HexColor(neutral900)),
      ),
      trailing: trailing,
      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 0),
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 0,
            right: 12,
            bottom: 12,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: descriptionStyle ??
                  TFontRegular.footNote.copyWith(color: HexColor(neutral500)),
            ),
          ),
        ),
        if (showDivider)
          Divider(
            color: borderColor ?? HexColor(neutral300),
            thickness: borderWidth,
          ),
      ],
    );
  }
}
