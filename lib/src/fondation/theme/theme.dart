import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/gen/fonts.gen.dart';
import '../hex_color.dart';

class TTheme {
  final Color primary;
  final Color primaryForeground;
  final Color primaryPressed;
  final Color secondary;
  final Color secondaryForeground;
  final Color secondaryPressed;
  final Color accent;
  final Color accentForeground;
  final Color destructive;
  final Color destructiveForeground;
  final Color destructivePressed;
  final Color warning;
  final Color warningForeground;
  final Color warningPressed;
  final Color success;
  final Color successForeground;
  final Color successPressed;
  final Color info;
  final Color infoForeground;
  final Color ring;
  final Color active;
  final Color background;
  final Color foreground;
  final Color muted;
  final Color mutedForeground;
  final Color card;
  final Color cardForeground;
  final Color popover;
  final Color popoverForeground;
  final Color border;
  final Color input;
  final String? fontFamily;

  /// ✅ **Predefined Singleton Instances**
  static final TTheme lightTheme = TTheme._light();
  static final TTheme darkTheme = TTheme._dark();

  /// Private constructor for singleton instances
  const TTheme({
    required this.primary,
    required this.primaryForeground,
    required this.primaryPressed,
    required this.secondary,
    required this.secondaryForeground,
    required this.secondaryPressed,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.destructivePressed,
    required this.warning,
    required this.warningForeground,
    required this.warningPressed,
    required this.success,
    required this.successForeground,
    required this.successPressed,
    required this.info,
    required this.infoForeground,
    required this.ring,
    required this.active,
    required this.background,
    required this.foreground,
    required this.muted,
    required this.mutedForeground,
    required this.card,
    required this.cardForeground,
    required this.popover,
    required this.popoverForeground,
    required this.border,
    required this.input,
    this.fontFamily = FontFamily.inter,
  });

  /// ✅ **Use Predefined Instances Instead of New Objects**
  factory TTheme.light() => lightTheme;
  factory TTheme.dark() => darkTheme;

  /// ✅ **Singleton instances for light and dark themes**
  factory TTheme._light() => TTheme(
    primary: HexColor(primary500),
    primaryForeground: HexColor(primary050),
    primaryPressed: HexColor(primary600),
    secondary: HexColor(secondary500),
    secondaryForeground: HexColor(secondary050),
    secondaryPressed: HexColor(secondary600),
    accent: HexColor(gray100),
    accentForeground: HexColor(gray950),
    destructive: HexColor(red500),
    destructiveForeground: HexColor(red050),
    destructivePressed: HexColor(red600),
    warning: HexColor(yellow500),
    warningForeground: HexColor(yellow050),
    warningPressed: HexColor(yellow600),
    success: HexColor(green500),
    successForeground: HexColor(green050),
    successPressed: HexColor(green600),
    info: HexColor(blue500),
    infoForeground: HexColor(blue050),
    ring: HexColor(gray500),
    active: HexColor(gray200),
    background: HexColor(baseWhite),
    foreground: HexColor(gray950),
    muted: HexColor(gray100),
    mutedForeground: HexColor(gray500),
    card: HexColor(baseWhite),
    cardForeground: HexColor(gray950),
    popover: HexColor(baseWhite),
    popoverForeground: HexColor(gray950),
    border: HexColor(gray200),
    input: HexColor(baseWhite),
  );

  factory TTheme._dark() => TTheme(
    primary: HexColor(primary500),
    primaryForeground: HexColor(primary900),
    primaryPressed: HexColor(primary600),
    secondary: HexColor(secondary500),
    secondaryForeground: HexColor(secondary900),
    secondaryPressed: HexColor(secondary600),
    accent: HexColor(gray800),
    accentForeground: HexColor(gray050),
    destructive: HexColor(red500),
    destructiveForeground: HexColor(red900),
    destructivePressed: HexColor(red600),
    warning: HexColor(yellow500),
    warningForeground: HexColor(yellow900),
    warningPressed: HexColor(yellow600),
    success: HexColor(green500),
    successForeground: HexColor(primary900),
    successPressed: HexColor(green600),
    info: HexColor(blue500),
    infoForeground: HexColor(blue900),
    ring: HexColor(gray400),
    active: HexColor(gray500),
    background: HexColor(baseBlack),
    foreground: HexColor(gray050),
    muted: HexColor(gray950),
    mutedForeground: HexColor(gray400),
    card: HexColor(gray950),
    cardForeground: HexColor(red050),
    popover: HexColor(gray950),
    popoverForeground: HexColor(gray050),
    border: HexColor(gray700),
    input: HexColor(gray950),
  );

  /// ✅ **Override Equality for Value Comparison**
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TTheme &&
              runtimeType == other.runtimeType &&
              primary == other.primary &&
              background == other.background &&
              foreground == other.foreground &&
              fontFamily == other.fontFamily;

  @override
  int get hashCode => primary.hashCode ^ background.hashCode ^ foreground.hashCode ^ fontFamily.hashCode;

  /// ✅ **Convert `TTheme` to `ThemeData` with Correct Brightness**
  ThemeData get themeData => ThemeData(
    brightness: this == TTheme.darkTheme ? Brightness.dark : Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    fontFamily: fontFamily,
    colorScheme: ColorScheme(
      brightness: this == TTheme.darkTheme ? Brightness.dark : Brightness.light,
      primary: primary,
      onPrimary: primaryForeground,
      secondary: secondary,
      onSecondary: secondaryForeground,
      surface: background,
      onSurface: foreground,
      error: destructive,
      onError: destructiveForeground,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: foreground),
      bodyMedium: TextStyle(color: foreground),
      bodySmall: TextStyle(color: mutedForeground),
    ),
    cardColor: card,
    dividerColor: border,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: input,
      border: OutlineInputBorder(borderSide: BorderSide(color: border)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) return primaryPressed;
          return primary;
        }),
        foregroundColor: WidgetStateProperty.all(primaryForeground),
      ),
    ),
    dialogTheme: DialogTheme(backgroundColor: popover),
  );
}
