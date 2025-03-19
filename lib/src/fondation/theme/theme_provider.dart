import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/theme/theme.dart';

class TThemeProvider extends InheritedWidget {
  final TTheme theme;

  const TThemeProvider({
    super.key,
    required this.theme,
    required super.child,
  });

  static TThemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TThemeProvider>();
  }

  @override
  bool updateShouldNotify(TThemeProvider oldWidget) {
    return theme != oldWidget.theme;
  }
}
