import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TSwitch extends StatelessWidget {
  final String label;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? error;
  final bool isEnabled;
  final bool isError;
  final Color? inactiveTrackColor;
  final Color? inactiveThumbColor;
  final double? width;
  final double? height;
  final bool lockWhenEnabled;

  const TSwitch({
    super.key,
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged,
    this.error,
    this.isEnabled = true,
    this.isError = false,
    this.inactiveTrackColor,
    this.inactiveThumbColor,
    this.width,
    this.height,
    this.lockWhenEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    void handleToggle(bool newValue) {
      if (lockWhenEnabled && value == true && newValue == false) {
        return;
      }
      onChanged(newValue);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchTheme(
          data: SwitchThemeData(
            trackColor: WidgetStateProperty.resolveWith((states) {
              if (!states.contains(WidgetState.selected)) {
                return inactiveTrackColor ?? theme.background;
              }
              return isError ? theme.destructive : theme.primary;
            }),
            thumbColor: WidgetStateProperty.resolveWith((states) {
              if (!states.contains(WidgetState.selected)) {
                return inactiveThumbColor ?? theme.border;
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
          child: SizedBox(
            width: width,
            height: height,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Switch(
                value: value,
                onChanged: isEnabled ? handleToggle : null,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TFontRegular.body(context).copyWith(
                color: isError ? theme.destructive : theme.foreground,
              ),
            ),
            Text(
              description,
              style: TFontRegular.footNote(context).copyWith(
                color: theme.foreground,
              ),
            ),
            if (error != null) ...[
              const SizedBox(height: 4),
              Text(
                error!,
                style: TFontRegular.footNote(context).copyWith(
                  color: theme.destructive,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
