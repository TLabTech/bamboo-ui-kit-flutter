import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

class TGroupTile extends StatelessWidget {
  final String? title;
  final List<TTile> tiles;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool enable;
  final bool enableBorder;

  const TGroupTile({
    super.key,
    this.title,
    required this.tiles,
    this.backgroundColor,
    this.borderColor,
    this.enable = true,
    this.enableBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              title!,
              style: TFontRegular.body.copyWith(
                color: HexColor(neutral700),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: enable
                ? backgroundColor ?? Colors.transparent
                : HexColor(neutral050),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor ?? HexColor(neutral300)),
          ),
          child: Column(
            children: [
              for (int i = 0; i < tiles.length; i++) ...[
                tiles[i].copyWith(borderColor: Colors.transparent),
                if (enableBorder)
                  if (i != tiles.length - 1)
                    Divider(
                      color: HexColor(neutral300),
                      height: 1,
                      thickness: 1,
                    ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
