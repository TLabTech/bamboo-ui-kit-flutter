import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class TBottomNavigationItem {
  final Widget screen;
  final Widget? inactiveIcon;
  final Widget activeIcon;
  final String title;
  final Color? activeForegroundColor;
  final Color? inactiveForegroundColor;

  TBottomNavigationItem({
    required this.screen,
    required this.activeIcon,
    this.inactiveIcon,
    required this.title,
    this.activeForegroundColor,
    this.inactiveForegroundColor,
  });

  PersistentTabConfig toPersistentTabConfig(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return PersistentTabConfig(
      screen: screen,
      item: ItemConfig(
        icon: activeIcon,
        inactiveIcon: inactiveIcon ?? activeIcon,
        title: title,
        activeForegroundColor: activeForegroundColor ?? theme.primary,
        inactiveForegroundColor:
            inactiveForegroundColor ?? theme.mutedForeground,
      ),
    );
  }
}
