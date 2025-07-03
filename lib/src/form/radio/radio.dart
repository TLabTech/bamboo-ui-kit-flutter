import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final theme = context.watch<TThemeManager>().state;
    bool isSelected = groupValue != null && value == groupValue;

    return GestureDetector(
      onTap: isDisabled ? null : () => onChanged?.call(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRadio(isSelected, isError),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TFontRegular.body(context).copyWith(
                    color: isDisabled
                        ? theme.mutedForeground
                        : (isError ? theme.destructive : theme.foreground),
                  ),
                ),
                if (description != null)
                  Text(
                    description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TFontRegular.footNote(context).copyWith(
                      color: isDisabled
                          ? theme.mutedForeground
                          : theme.foreground,
                    ),
                  ),
                if (isError && error != null)
                  Text(
                    error!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TFontRegular.footNote(context).copyWith(
                      color: theme.destructive,
                    ),
                  ),
              ],
            ),
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
                      ? HexColor(red500)
                      : HexColor(primary500)
                  : Colors.grey),
          width: 2,
        ),
        color: isSelected
            ? isError
                ? HexColor(red500)
                : HexColor(primary500)
            : HexColor(gray050),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor(gray050),
                ),
              ),
            )
          : null,
    );
  }
}
