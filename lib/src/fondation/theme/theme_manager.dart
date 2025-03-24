import 'package:flutter_bamboo_ui_kit/src/fondation/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TThemeManager extends Cubit<TTheme> {
  final TTheme lightTheme;
  final TTheme darkTheme;

  TThemeManager({TTheme? lightTheme, TTheme? darkTheme})
      : lightTheme = lightTheme ?? TTheme.light(),
        darkTheme = darkTheme ?? TTheme.dark(),
        super(lightTheme ?? TTheme.light());

  void toggleTheme(bool isDark) {
    emit(isDark ? darkTheme : lightTheme);
  }

  /// Set a specific theme manually
  void setTheme(TTheme newTheme) {
    emit(newTheme);
  }
}
