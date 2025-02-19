import 'package:flutter/widgets.dart';
import 'package:flutter_bamboo_ui_kit/gen/assets.gen.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TAlert extends StatelessWidget {
  final String title;
  final String? subtitle;
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
  })  : titleColor = HexColor(neutral500),
        subtitleColor = HexColor(neutral400),
        borderColor = HexColor(neutral300),
        backgroundColor = HexColor(neutral050);

  TAlert.primary({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
  })  : titleColor = HexColor(primary500),
        subtitleColor = HexColor(primary400),
        borderColor = HexColor(primary300),
        backgroundColor = HexColor(primary050);

  TAlert.destructive({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
  })  : titleColor = HexColor(danger500),
        subtitleColor = HexColor(danger400),
        borderColor = HexColor(danger300),
        backgroundColor = HexColor(danger050);

  TAlert.info({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
  })  : titleColor = HexColor(info500),
        subtitleColor = HexColor(info400),
        borderColor = HexColor(info300),
        backgroundColor = HexColor(info050);

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
          icon ?? SvgPicture.asset(
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
                  style: TFontRegular.body.copyWith(color: titleColor),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TFontRegular.footNote.copyWith(color: subtitleColor),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
