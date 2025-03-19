import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/gen/fonts.gen.dart';
import '../hex_color.dart';

class TTheme {
  /// Primary color used for app bars, buttons, etc.
  final Color primary;

  /// Secondary color used for accents, highlights, etc.
  final Color secondary;

  /// Background color for the app or major sections
  final Color background;

  /// Error color for errors, warnings, etc.
  final Color error;

  /// Text color for general text
  final Color text;

  /// Background color for buttons in their default state
  final Color buttonBackground;

  /// Background color for buttons when pressed
  final Color buttonPressed;

  /// Font family for the app
  final String? fontFamily;

  /// Constructor to initialize all theme properties
  TTheme({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.error,
    required this.text,
    required this.buttonBackground,
    required this.buttonPressed,
    this.fontFamily = FontFamily.inter,
  });

  /// Default light theme
  static TTheme light() => TTheme(
    primary: HexColor(primary500),
    secondary: HexColor(secondary500),
    background: HexColor(neutral100),
    error: HexColor(danger500),
    text: HexColor(neutral900),
    buttonBackground: HexColor(primary500),
    buttonPressed: HexColor(primary600),
    fontFamily: FontFamily.inter,
  );

  /// Default dark theme
  static TTheme dark() => TTheme(
    primary: HexColor(primary300),
    secondary: HexColor(secondary300),
    background: HexColor(neutral950),
    error: HexColor(danger400),
    text: HexColor(neutral100),
    buttonBackground: HexColor(primary300),
    buttonPressed: HexColor(primary400),
    fontFamily: FontFamily.inter,
  );

  /// Clone and update colors dynamically
  TTheme copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? error,
    Color? text,
    Color? buttonBackground,
    Color? buttonPressed,
    String? fontFamily,
  }) {
    return TTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      error: error ?? this.error,
      text: text ?? this.text,
      buttonBackground: buttonBackground ?? this.buttonBackground,
      buttonPressed: buttonPressed ?? this.buttonPressed,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  /// Convert the theme into a Flutter `ThemeData` object
  ThemeData get themeData {
    return ThemeData(
      primaryColor: primary,
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: secondary,
        surface: background,
        error: error,
        onSurface: text,
        onPrimary: Colors.white,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: background, // Scaffold background
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: text), // General text style
        bodyMedium: TextStyle(color: text),
        bodySmall: TextStyle(color: text),
      ),
    );
  }
}