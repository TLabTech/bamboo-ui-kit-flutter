import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

class TDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String Function(T) itemLabel;
  final EdgeInsetsGeometry padding;
  final InputDecoration? decoration;
  final Color? borderColor;
  final double borderWidth;
  final String? hintText;

  const TDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.itemLabel,
    this.value,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.decoration,
    this.borderColor,
    this.borderWidth = 1.0,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<T>(
          value: value,
          decoration: decoration ??
              InputDecoration(
                hintText: hintText,
                contentPadding: padding,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: borderColor ?? HexColor(neutral300),
                      width: borderWidth),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: borderColor ?? HexColor(neutral300),
                    width: borderWidth,
                  ),
                ),
              ),
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                itemLabel(item),
                style: TFontRegular.body,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
