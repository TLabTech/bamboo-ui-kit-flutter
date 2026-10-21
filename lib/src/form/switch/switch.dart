import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TSwitch extends StatelessWidget {
  /// Label & deskripsi bawaan; `null` = switch polos (atom) tanpa kolom teks.
  final String? label;
  final String? description;
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
    this.label,
    this.description,
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

    final switchWidget = _buildSwitch(theme, handleToggle);

    if (label == null && description == null) {
      if (error == null) return switchWidget;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          switchWidget,
          const SizedBox(height: 4),
          Text(
            error!,
            style: TFontRegular.footNote(context).copyWith(
              color: theme.destructive,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        switchWidget,
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (label != null)
              Text(
                label!,
                style: TFontRegular.body(context).copyWith(
                  color: isError ? theme.destructive : theme.foreground,
                ),
              ),
            if (description != null)
              Text(
                description!,
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

  Widget _buildSwitch(TTheme theme, void Function(bool) handleToggle) {
    if (label == null && description == null) {
      return _buildCompactSwitch(theme, handleToggle);
    }

    return SwitchTheme(
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
    );
  }

  Widget _buildCompactSwitch(TTheme theme, void Function(bool) handleToggle) {
    final trackWidth = width ?? 42;
    final trackHeight = height ?? 24;
    final thumbSize = trackHeight > 8 ? trackHeight - 8 : trackHeight;
    final trackColor = value
        ? (isError ? theme.destructive : theme.primary)
        : theme.background;

    return Semantics(
      toggled: value,
      enabled: isEnabled,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: isEnabled ? () => handleToggle(!value) : null,
        child: Opacity(
          opacity: isEnabled ? 1 : 0.5,
          child: SizedBox(
            width: trackWidth + 6,
            height: trackHeight,
            child: Center(
              child: AnimatedContainer(
                key: const ValueKey('tswitch-compact-track'),
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                width: trackWidth,
                height: trackHeight,
                padding: const EdgeInsets.all(4),
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: trackColor,
                  border: value ? null : Border.all(color: theme.border),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: AnimatedContainer(
                  key: const ValueKey('tswitch-compact-thumb'),
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeOut,
                  width: thumbSize,
                  height: thumbSize,
                  decoration: BoxDecoration(
                    color: value ? HexColor(gray050) : theme.border,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
