import 'package:flutter_bamboo_ui_kit/src/fondation/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TThemeManager extends Cubit<TTheme> {
  final TTheme lightTheme;
  final TTheme darkTheme;

  TThemeManager({TTheme? lightTheme, TTheme? darkTheme})
      : lightTheme = lightTheme ?? TTheme.light(), // Use fallback if not provided
        darkTheme = darkTheme ?? TTheme.dark(), // Use fallback if not provided
        super(lightTheme ?? TTheme.light());

  void toggleTheme() {
    emit(state == lightTheme ? darkTheme : lightTheme);
  }

  /// Set a specific theme manually
  void setTheme(TTheme newTheme) {
    emit(newTheme);
  }
}
