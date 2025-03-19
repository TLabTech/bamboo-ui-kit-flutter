import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/gen/fonts.gen.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/theme/theme_provider.dart';

const String fontFamily = FontFamily.inter;

class TFontRegular {
  static TextStyle titleLarge(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 34,
  );

  static TextStyle title1(context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 28,
  );

  static TextStyle title2(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 22,
  );

  static TextStyle title3(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );

  static TextStyle headline(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );

  static TextStyle body(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  static TextStyle callOut(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static TextStyle subHeadline(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );

  static TextStyle footNote(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );

  static TextStyle caption1(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static TextStyle caption2(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w400,
    fontSize: 11,
  );
}

class TFontBold {
  static TextStyle titleLarge(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w700,
    fontSize: 34,
  );

  static TextStyle title1(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w700,
    fontSize: 28,
  );

  static TextStyle title2(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w700,
    fontSize: 22,
  );

  static TextStyle title3(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  static TextStyle headline(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );

  static TextStyle body(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );

  static TextStyle callout(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle subHeadline(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static TextStyle footNote(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );

  static TextStyle caption1(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static TextStyle caption2(BuildContext context) => TextStyle(
    fontFamily: _getFontFamily(context),
    fontWeight: FontWeight.w500,
    fontSize: 11,
  );
}

String _getFontFamily(BuildContext context) {
  return TThemeProvider.of(context)?.theme.fontFamily ?? fontFamily;
}