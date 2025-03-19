import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_bamboo_ui_kit/widgets/radio.dart';

class TTile<T> extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? disableBackgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final bool? enable;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final String? detail;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? padding;
  final T? value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final bool showRadio;
  final VoidCallback? onPress;

  const TTile({
    super.key,
    required this.title,
    this.titleStyle,
    this.subtitleStyle,
    this.backgroundColor,
    this.disableBackgroundColor,
    this.borderColor,
    this.textColor,
    this.enable = true,
    this.subtitle,
    this.detail,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
    this.value,
    this.groupValue,
    this.onChanged,
    this.showRadio = false,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable == true ? onPress : null,
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
        decoration: BoxDecoration(
          color: enable == true
              ? backgroundColor ?? Colors.transparent
              : disableBackgroundColor ?? HexColor(neutral050),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor ?? HexColor(neutral300)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              IconTheme(
                data: IconThemeData(
                    color: enable == true ? null : HexColor(neutral500)),
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
                              ? HexColor(neutral900)
                              : HexColor(neutral500),
                        ),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: subtitleStyle ??
                          TFontRegular.caption2(context).copyWith(
                            color: HexColor(neutral500),
                          ),
                      overflow: TextOverflow.visible,
                    ),
                ],
              ),
            ),
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
                            .copyWith(color: HexColor(neutral500)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  if (suffixIcon != null) ...[
                    const SizedBox(width: 8),
                    IconTheme(
                      data: IconThemeData(
                        color: enable == true ? null : HexColor(neutral500),
                      ),
                      child: suffixIcon!,
                    ),
                  ],
                ],
              ),
            ],
            if (showRadio && value != null) ...[
              const SizedBox(width: 8),
              TRadioButton<T>(
                value: value as T,
                groupValue: groupValue,
                onChanged: onChanged,
                label: '',
              ),
            ],
          ],
        ),
      ),
    );
  }
}

extension TTileCopy<T> on TTile<T> {
  TTile<T> copyWith({
    String? title,
    TextStyle? titleStyle,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    bool? enable,
    String? subtitle,
    TextStyle? subtitleStyle,
    String? detail,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsets? padding,
    bool? showRadio,
    T? value,
    T? groupValue,
    ValueChanged<T?>? onChanged,
  }) {
    return TTile<T>(
      title: title ?? this.title,
      titleStyle: titleStyle ?? this.titleStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      textColor: textColor ?? this.textColor,
      enable: enable ?? this.enable,
      subtitle: subtitle ?? this.subtitle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      detail: detail ?? this.detail,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      showRadio: showRadio ?? this.showRadio,
      value: value ?? this.value,
      groupValue: groupValue ?? this.groupValue,
      onChanged: onChanged ?? this.onChanged,
      padding: padding ?? this.padding,
    );
  }
}
