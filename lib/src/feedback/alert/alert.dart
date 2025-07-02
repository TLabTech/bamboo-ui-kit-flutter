import 'package:flutter/widgets.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum TAlertType { raw, primary, destructive, info }

class TAlert extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? icon;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final TAlertType alertType;

  const TAlert({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.titleStyle,
    this.subtitleStyle,
    this.titleColor,
    this.subtitleColor,
    this.borderColor,
    this.backgroundColor,
  }) : alertType = TAlertType.raw;

  const TAlert.primary({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.titleStyle,
    this.subtitleStyle,
  })  : titleColor = null,
        subtitleColor = null,
        borderColor = null,
        backgroundColor = null,
        alertType = TAlertType.primary;

  const TAlert.destructive({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.titleStyle,
    this.subtitleStyle,
  })  : titleColor = null,
        subtitleColor = null,
        borderColor = null,
        backgroundColor = null,
        alertType = TAlertType.destructive;

  const TAlert.info({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.titleStyle,
    this.subtitleStyle,
  })  : titleColor = null,
        subtitleColor = null,
        borderColor = null,
        backgroundColor = null,
        alertType = TAlertType.info;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    Color alertTitleColor;
    Color alertSubtitleColor;
    Color alertBorderColor;
    Color alertBackgroundColor;

    switch (alertType) {
      case TAlertType.primary:
        alertTitleColor = titleColor ?? theme.primary;
        alertSubtitleColor = subtitleColor ?? theme.primary;
        alertBorderColor = borderColor ?? theme.primary;
        alertBackgroundColor = backgroundColor ?? theme.primaryForeground;
        break;
      case TAlertType.destructive:
        alertTitleColor = titleColor ?? theme.destructive;
        alertSubtitleColor = subtitleColor ?? theme.destructive;
        alertBorderColor = borderColor ?? theme.destructive;
        alertBackgroundColor = backgroundColor ?? theme.destructiveForeground;
        break;
      case TAlertType.info:
        alertTitleColor = titleColor ?? theme.info;
        alertSubtitleColor = subtitleColor ?? theme.info;
        alertBorderColor = borderColor ?? theme.info;
        alertBackgroundColor = backgroundColor ?? theme.infoForeground;
        break;
      case TAlertType.raw:
        alertTitleColor = titleColor ?? theme.foreground;
        alertSubtitleColor = subtitleColor ?? theme.foreground;
        alertBorderColor = borderColor ?? theme.border;
        alertBackgroundColor = backgroundColor ?? theme.muted;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: alertBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: alertBorderColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          icon ??
              SvgPicture.asset(
                Assets.svg.informationCircle,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(alertTitleColor, BlendMode.srcIn),
              ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: titleStyle ??
                      TFontRegular.body(context).copyWith(color: alertTitleColor),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: subtitleStyle ??
                        TFontRegular.footNote(context).copyWith(color: alertSubtitleColor),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
