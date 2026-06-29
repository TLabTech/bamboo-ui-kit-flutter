import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TTile<T> extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? disableBackgroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Color? textColor;
  final bool? enable;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final String? detail;
  final String? valueText;
  final TextStyle? valueStyle;
  final BoxDecoration? valueDecoration;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? padding;
  final T? value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final bool showRadio;
  final VoidCallback? onPress;
  final bool showCheckbox;
  final bool isChecked;
  final ValueChanged<bool>? onCheckboxChanged;

  const TTile({
    super.key,
    required this.title,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.disableBackgroundColor,
    this.borderColor,
    this.borderRadius,
    this.textColor,
    this.enable = true,
    this.subtitle,
    this.detail,
    this.valueText,
    this.valueStyle,
    this.valueDecoration,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
    this.value,
    this.groupValue,
    this.onChanged,
    this.showRadio = false,
    this.onPress,
    this.showCheckbox = false,
    this.isChecked = false,
    this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    final hasValueText = valueText != null && valueText!.trim().isNotEmpty;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: enable == true ? onPress : null,
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
        decoration: BoxDecoration(
          color: enable == true
              ? backgroundColor ?? theme.background
              : disableBackgroundColor ?? theme.muted,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          border: Border.all(color: borderColor ?? theme.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              IconTheme(
                data: IconThemeData(
                    color: enable == true ? null : theme.mutedForeground),
                child: prefixIcon!,
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle ??
                        TFontRegular.body(context).copyWith(
                          color: enable == true
                              ? theme.foreground
                              : theme.mutedForeground,
                        ),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: subtitleStyle ??
                          TFontRegular.caption2(context).copyWith(
                            color: theme.mutedForeground,
                          ),
                      overflow: TextOverflow.visible,
                    ),
                ],
              ),
            ),
            if (hasValueText) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: valueDecoration ??
                    BoxDecoration(
                      color: HexColor(primary050),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: HexColor(primary200),
                      ),
                    ),
                child: Text(
                  valueText!,
                  style: valueStyle ??
                      TFontBold.caption1(context).copyWith(
                        color: HexColor(primary600),
                      ),
                ),
              ),
            ],
            if (detail != null || suffixIcon != null) ...[
              const SizedBox(width: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (detail != null)
                    Flexible(
                      child: Text(
                        detail!,
                        style: TFontRegular.body(context)
                            .copyWith(color: theme.mutedForeground),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  if (suffixIcon != null) ...[
                    const SizedBox(width: 8),
                    IconTheme(
                      data: IconThemeData(
                        color: enable == true ? null : theme.mutedForeground,
                      ),
                      child: suffixIcon!,
                    ),
                  ],
                ],
              ),
            ],
            if (showRadio && value != null) ...[
              const SizedBox(width: 8),
              _buildInlineRadio(
                context,
                isSelected: groupValue != null && value == groupValue,
                isEnabled: enable == true,
                isError: false,
                onTap: enable == true
                    ? () {
                        if (onChanged != null) {
                          onChanged!(value as T);
                        }
                      }
                    : null,
              ),
            ],
            if (showCheckbox) ...[
              const SizedBox(width: 8),
              _buildInlineCheckbox(
                context,
                isChecked: isChecked,
                isEnabled: enable == true,
                onTap: enable == true
                    ? () {
                  if (onCheckboxChanged != null) {
                    onCheckboxChanged!(!isChecked);
                  }
                }
                    : null,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

Widget _buildInlineRadio(
  BuildContext context, {
  required bool isSelected,
  required bool isEnabled,
  required bool isError,
  VoidCallback? onTap,
}) {
  final theme = context.watch<TThemeManager>().state;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: !isEnabled
              ? Colors.grey
              : (isSelected
                  ? isError
                      ? HexColor(red500)
                      : HexColor(primary500)
                  : theme.border),
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
    ),
  );
}

Widget _buildInlineCheckbox(
  BuildContext context, {
  required bool isChecked,
  required bool isEnabled,
  VoidCallback? onTap,
}) {
  final theme = context.watch<TThemeManager>().state;

  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: isEnabled
            ? isChecked
                ? HexColor(primary500)
                : theme.background
            : theme.muted,
        border: Border.all(
          color: isEnabled
              ? isChecked
                  ? Colors.transparent
                  : theme.border
              : theme.border,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: isEnabled && isChecked
          ? Icon(
              Icons.check,
              color: theme.primaryForeground,
              size: 14,
            )
          : null,
    ),
  );
}

extension TTileCopy<T> on TTile<T> {
  TTile<T> copyWith({
    String? title,
    TextStyle? titleStyle,
    Color? backgroundColor,
    Color? borderColor,
    BorderRadius? borderRadius,
    Color? textColor,
    bool? enable,
    String? subtitle,
    TextStyle? subtitleStyle,
    String? detail,
    String? valueText,
    TextStyle? valueStyle,
    BoxDecoration? valueDecoration,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsets? padding,
    bool? showRadio,
    T? value,
    T? groupValue,
    ValueChanged<T?>? onChanged,
    bool? showCheckbox,
    bool? isChecked,
    ValueChanged<bool>? onCheckboxChanged,
  }) {
    return TTile<T>(
      title: title ?? this.title,
      titleStyle: titleStyle ?? this.titleStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      textColor: textColor ?? this.textColor,
      enable: enable ?? this.enable,
      subtitle: subtitle ?? this.subtitle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      detail: detail ?? this.detail,
      valueText: valueText ?? this.valueText,
      valueStyle: valueStyle ?? this.valueStyle,
      valueDecoration: valueDecoration ?? this.valueDecoration,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      showRadio: showRadio ?? this.showRadio,
      value: value ?? this.value,
      groupValue: groupValue ?? this.groupValue,
      onChanged: onChanged ?? this.onChanged,
      padding: padding ?? this.padding,
      showCheckbox: showCheckbox ?? this.showCheckbox,
      isChecked: isChecked ?? this.isChecked,
      onCheckboxChanged: onCheckboxChanged ?? this.onCheckboxChanged,
    );
  }
}
