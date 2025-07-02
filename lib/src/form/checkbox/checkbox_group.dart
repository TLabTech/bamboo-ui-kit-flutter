import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TCheckBoxGroup extends StatefulWidget {
  final String? label;
  final TextStyle? labelStyle;
  final List<String> items;
  final ValueChanged<List<String>> onChanged;
  final List<String>? initialValues;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? borderColor;
  final bool isEnabled;

  const TCheckBoxGroup({
    super.key,
    required this.items,
    required this.onChanged,
    this.label,
    this.labelStyle,
    this.initialValues,
    this.activeColor,
    this.inactiveColor,
    this.borderColor,
    this.isEnabled = true,
  });

  @override
  State<TCheckBoxGroup> createState() => _TCheckBoxGroupState();
}

class _TCheckBoxGroupState extends State<TCheckBoxGroup> {
  late List<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initialValues ?? [];
  }

  void _onItemChanged(String item, bool isChecked) {
    setState(() {
      if (isChecked) {
        _selectedItems.add(item);
      } else {
        _selectedItems.remove(item);
      }
      widget.onChanged(_selectedItems);
    });
  }

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
        ...widget.items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: TCheckBox(
              initialValue: _selectedItems.contains(item),
              onChanged: (isChecked) => _onItemChanged(item, isChecked),
              label: item,
              activeColor: widget.activeColor,
              inactiveColor: widget.inactiveColor,
              borderColor: widget.borderColor,
              isEnabled: widget.isEnabled,
            ),
          );
        }),
      ],
    );
  }
}
