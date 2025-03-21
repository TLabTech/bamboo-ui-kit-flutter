import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/gen/fonts.gen.dart';
import '../hex_color.dart';

class TTheme {
  /// Primary color used for app bars, buttons, etc.
  final Color primary;

  final Color primaryForeground;

  final Color primaryPressed;

  /// Secondary color used for accents, highlights, etc.
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

  /// Background color for the app or major sections
  final Color background;

  /// Foreground color for text and icons
  final Color foreground;

  /// Muted color for disabled or low-priority elements
  final Color muted;

  /// Muted foreground color for disabled text/icons
  final Color mutedForeground;

  /// Card background color
  final Color card;

  /// Card foreground color
  final Color cardForeground;

  /// Popover background color
  final Color popover;

  /// Popover foreground color
  final Color popoverForeground;

  /// Border color
  final Color border;

  /// Input field background color
  final Color input;

  /// Error color for errors, warnings, etc.
  final Color error;

  /// Button background color in default state
  final Color buttonBackground;

  /// Button background color when pressed
  final Color buttonPressed;

  /// Font family for the app
  final String? fontFamily;

  /// Constructor to initialize all theme properties
  TTheme({
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
    required this.error,
    required this.buttonBackground,
    required this.buttonPressed,
    this.fontFamily = FontFamily.inter,
  });

  /// Default light theme
  static TTheme light() => TTheme(
    primary: HexColor("22C55E"), // primary/500
    primaryForeground: Colors.white,
    primaryPressed: HexColor("16A34A"), // primary/600
    secondary: HexColor("3B82F6"), // secondary/500
    secondaryForeground: Colors.white,
    secondaryPressed: HexColor("2563EB"), // secondary/600
    accent: HexColor("FACC15"), // yellow/500
    accentForeground: Colors.black,
    destructive: HexColor("DC2626"), // red/600
    destructiveForeground: Colors.white,
    destructivePressed: HexColor("B91C1C"), // red/700
    warning: HexColor("F59E0B"), // amber/500
    warningForeground: Colors.black,
    warningPressed: HexColor("D97706"), // amber/600
    success: HexColor("22C55E"), // green/500
    successForeground: Colors.white,
    successPressed: HexColor("16A34A"), // green/600
    info: HexColor("06B6D4"), // cyan/500
    infoForeground: Colors.white,
    ring: HexColor("E5E7EB"), // gray/200
    active: HexColor("3B82F6"), // secondary/500
    background: HexColor("FFFFFF"), // base/white
    foreground: HexColor("030712"), // gray/950
    muted: HexColor("F3F4F6"), // gray/100
    mutedForeground: HexColor("6B7280"), // gray/500
    card: HexColor("FFFFFF"), // base/white
    cardForeground: HexColor("030712"), // gray/950
    popover: HexColor("FFFFFF"), // base/white
    popoverForeground: HexColor("030712"), // gray/950
    border: HexColor("E5E7EB"), // gray/200
    input: HexColor("FFFFFF"), // base/white
    error: HexColor("EF4444"), // red/500
    buttonBackground: HexColor("22C55E"), // primary/500
    buttonPressed: HexColor("16A34A"), // primary/600
    fontFamily: FontFamily.inter,
  );

  /// Default dark theme
  static TTheme dark() => TTheme(
    primary: HexColor("22C55E"), // primary/500
    primaryForeground: Colors.black,
    primaryPressed: HexColor("16A34A"), // primary/600
    secondary: HexColor("3B82F6"), // secondary/500
    secondaryForeground: Colors.black,
    secondaryPressed: HexColor("2563EB"), // secondary/600
    accent: HexColor("FACC15"), // yellow/500
    accentForeground: Colors.black,
    destructive: HexColor("DC2626"), // red/600
    destructiveForeground: Colors.white,
    destructivePressed: HexColor("B91C1C"), // red/700
    warning: HexColor("F59E0B"), // amber/500
    warningForeground: Colors.black,
    warningPressed: HexColor("D97706"), // amber/600
    success: HexColor("22C55E"), // green/500
    successForeground: Colors.white,
    successPressed: HexColor("16A34A"), // green/600
    info: HexColor("06B6D4"), // cyan/500
    infoForeground: Colors.white,
    ring: HexColor("374151"), // gray/700
    active: HexColor("3B82F6"), // secondary/500
    background: HexColor("000000"), // base/black
    foreground: HexColor("F9FAFB"), // gray/50
    muted: HexColor("030712"), // gray/950
    mutedForeground: HexColor("9CA3AF"), // gray/400
    card: HexColor("030712"), // gray/950
    cardForeground: HexColor("EF4444"), // red/500
    popover: HexColor("030712"), // gray/950
    popoverForeground: HexColor("F9FAFB"), // gray/50
    border: HexColor("374151"), // gray/700
    input: HexColor("030712"), // gray/950
    error: HexColor("EF4444"), // red/500
    buttonBackground: HexColor("22C55E"), // primary/500
    buttonPressed: HexColor("15803D"), // primary/900
    fontFamily: FontFamily.inter,
  );

  /// Convert the theme into a Flutter `ThemeData` object
  ThemeData get themeData {
    return ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      fontFamily: fontFamily,

      colorScheme: ColorScheme(
        brightness: Brightness.light, // Change to Brightness.dark for dark theme
        primary: primary,
        onPrimary: primaryForeground,
        secondary: secondary,
        onSecondary: secondaryForeground,
        surface: background,
        onSurface: foreground,
        error: error,
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
        border: OutlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return buttonPressed;
            return buttonBackground;
          }),
          foregroundColor: WidgetStateProperty.all(primaryForeground),
        ),
      ), dialogTheme: DialogThemeData(backgroundColor: popover),
    );
  }
}
