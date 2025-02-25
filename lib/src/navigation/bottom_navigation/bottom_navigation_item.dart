import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class TBottomNavigationItem {
  final Widget screen;
  final Widget? inactiveIcon;
  final Widget activeIcon;
  final String title;
  final Color activeForegroundColor;
  final Color inactiveForegroundColor;

  TBottomNavigationItem({
    required this.screen,
    required this.activeIcon,
    this.inactiveIcon,
    required this.title,
    this.activeForegroundColor = Colors.green,
    this.inactiveForegroundColor = Colors.grey,
  });

  PersistentTabConfig toPersistentTabConfig() {
    return PersistentTabConfig(
      screen: screen,
      item: ItemConfig(
        icon: activeIcon,
        inactiveIcon: inactiveIcon ?? activeIcon,
        title: title,
        activeForegroundColor: activeForegroundColor,
        inactiveForegroundColor: inactiveForegroundColor,
      ),
    );
  }
}
