import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TSwitch extends StatefulWidget {
  final String label;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? error;
  final bool isEnabled;
  final bool isError;
  final Color? inactiveTrackColor;
  final Color? inactiveThumbColor;

  const TSwitch({
    super.key,
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged,
    this.error,
    this.isEnabled = false,
    this.isError = false,
    this.inactiveTrackColor,
    this.inactiveThumbColor,
  });

  @override
  State<TSwitch> createState() => _TSwitchState();
}

class _TSwitchState extends State<TSwitch> {
  bool _internalValue = false;

  @override
  void initState() {
    super.initState();
    _internalValue = widget.value;

    if (widget.isEnabled == false) _internalValue = false;
  }

  @override
  void didUpdateWidget(covariant TSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _internalValue = widget.value;
    }

    if (widget.isEnabled == false) _internalValue = false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    return GestureDetector(
      onTap: () {
        if (widget.error == null && widget.isEnabled) {
          setState(() {
            _internalValue = !_internalValue;
          });
          widget.onChanged(_internalValue);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchTheme(
            data: SwitchThemeData(
              trackColor: WidgetStateProperty.resolveWith((states) {
                if (!states.contains(WidgetState.selected)) {
                  return widget.inactiveTrackColor ?? theme.background;
                }
                return widget.isError ? theme.destructive : theme.primary;
              }),
              thumbColor: WidgetStateProperty.resolveWith((states) {
                if (!states.contains(WidgetState.selected)) {
                  return widget.inactiveThumbColor ?? theme.border;
                }
                return HexColor(gray050);
              }),
              trackOutlineColor: WidgetStateProperty.resolveWith((states) {
                if (!states.contains(WidgetState.selected)) {
                  return theme.border;
                }
                return Colors.transparent;
              }),
            ),
            child: Switch(
              value: _internalValue,
              onChanged: (newValue) {
                if (widget.isEnabled) {
                  setState(() {
                    _internalValue = newValue;
                  });
                  widget.onChanged(newValue);
                } else if (!widget.isEnabled) {
                  setState(() {
                    _internalValue = false;
                  });
                  widget.onChanged(_internalValue);
                }
              },
              activeColor: HexColor(gray050),
              activeTrackColor:
                  widget.isError ? theme.destructive : theme.primary,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: TFontRegular.body(context).copyWith(
                  color: widget.isError ? theme.destructive : theme.foreground,
                ),
              ),
              Text(
                widget.description,
                style: TFontRegular.footNote(context).copyWith(
                  color: theme.foreground,
                ),
              ),
              if (widget.error != null) ...[
                const SizedBox(height: 4),
                Text(
                  widget.error!,
                  style: TFontRegular.footNote(context).copyWith(
                    color: theme.destructive,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
