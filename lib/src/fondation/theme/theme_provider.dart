import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/theme/theme.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/theme/theme_manager.dart';

class TThemeProvider extends StatelessWidget {
  final Widget child;

  const TThemeProvider({super.key, required this.child});

  /// Get the current theme
  static TTheme of(BuildContext context) {
    return context.watch<TThemeManager>().state;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TThemeManager, TTheme>(
      builder: (context, theme) {
        return Theme(
          data: theme.themeData, // Make sure TTheme has a `themeData` method
          child: child,
        );
      },
    );
  }
}
