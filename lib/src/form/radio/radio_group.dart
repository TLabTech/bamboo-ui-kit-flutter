import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TRadioGroup<T> extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final List<T> values;
  final T? selectedValue;
  final ValueChanged<T> onChanged;
  final List<String> items;

  const TRadioGroup({
    super.key,
    required this.values,
    required this.selectedValue,
    required this.onChanged,
    required this.items,
    this.label,
    this.labelStyle,
  });

  @override
  TRadioGroupState<T> createState() => TRadioGroupState<T>();
}

class TRadioGroupState<T> extends State<TRadioGroup<T>> {
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.label!,
              style: widget.labelStyle ??
                  TFontBold.body(context).copyWith(
                    color: theme.foreground,
                  ),
            ),
          ),
        ...List.generate(
          widget.values.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TRadioButton<T>(
                value: widget.values[index],
                groupValue: widget.selectedValue,
                // Can be null now
                onChanged: widget.onChanged,
                label: widget.items[index],
                isError: false,
              ),
            );
          },
        ),
      ],
    );
  }
}
