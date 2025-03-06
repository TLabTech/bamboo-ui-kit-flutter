import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

class TRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final String label;
  final String? description;
  final String? error;
  final bool isDisabled;
  final bool isError;

  const TRadioButton({
    super.key,
    required this.value,
    this.groupValue,
    required this.onChanged,
    required this.label,
    this.description,
    this.error,
    this.isDisabled = false,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        groupValue != null && value == groupValue;

    return GestureDetector(
      onTap: isDisabled ? null : () => onChanged?.call(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRadio(isSelected, isError),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(
                label,
                style: TFontRegular.body.copyWith(
                  color: isDisabled
                      ? HexColor(neutral400)
                      : (isError ? HexColor(danger500) : HexColor(neutral500)),
                ),
              ),
              if (description != null)
                Text(
                  description!,
                  style: TFontRegular.footNote.copyWith(
                    color: isDisabled
                        ? HexColor(neutral400)
                        : HexColor(neutral500),
                  ),
                ),
              if (isError && error != null)
                Text(
                  error!,
                  style: TFontRegular.footNote.copyWith(
                    color:
                        isDisabled ? HexColor(neutral400) : HexColor(danger500),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadio(bool isSelected, bool isError) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isDisabled
              ? Colors.grey
              : (isSelected
                  ? isError
                      ? HexColor(danger500)
                      : HexColor(primary500)
                  : Colors.grey),
          width: 2,
        ),
        color: isSelected
            ? isError
                ? HexColor(danger500)
                : HexColor(primary500)
            : HexColor(neutral050),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor(neutral050),
                ),
              ),
            )
          : null,
    );
  }
}
