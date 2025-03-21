import 'package:flutter/widgets.dart';
import 'package:flutter_bamboo_ui_kit/gen/assets.gen.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TAlert extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? icon;
  final Color titleColor;
  final Color subtitleColor;
  final Color borderColor;
  final Color backgroundColor;

  TAlert({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.titleStyle,
    this.subtitleStyle,
  })  : titleColor = HexColor(gray500),
        subtitleColor = HexColor(gray400),
        borderColor = HexColor(gray300),
        backgroundColor = HexColor(gray050);

  TAlert.primary({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.titleStyle,
    this.subtitleStyle,
  })  : titleColor = HexColor(primary500),
        subtitleColor = HexColor(primary400),
        borderColor = HexColor(primary300),
        backgroundColor = HexColor(primary050);

  TAlert.destructive({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.titleStyle,
    this.subtitleStyle,
  })  : titleColor = HexColor(red500),
        subtitleColor = HexColor(red400),
        borderColor = HexColor(red300),
        backgroundColor = HexColor(red050);

  TAlert.info({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.titleStyle,
    this.subtitleStyle,
  })  : titleColor = HexColor(blue500),
        subtitleColor = HexColor(blue400),
        borderColor = HexColor(blue300),
        backgroundColor = HexColor(blue050);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
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
                colorFilter: ColorFilter.mode(titleColor, BlendMode.srcIn),
              ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: titleStyle ??
                      TFontRegular.body(context).copyWith(color: titleColor),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: subtitleStyle ??
                        TFontRegular.footNote(context).copyWith(color: subtitleColor),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
