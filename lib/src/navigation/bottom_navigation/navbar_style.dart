import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/circular_navbar.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/floating_circular_dot_navbar.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/floating_circular_text_navbar.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/floating_circular_navbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class TNavbarStyle {
  static Widget style3(
    BuildContext context,
    NavBarConfig navBarConfig,
    Color? backgroundColor,
  ) {
    final theme = context.watch<TThemeManager>().state;
    return Style3BottomNavBar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: backgroundColor ?? theme.popover,
      ),
    );
  }

  static Widget fixed4(
    BuildContext context,
    NavBarConfig navBarConfig,
    Color? backgroundColor,
  ) {
    final theme = context.watch<TThemeManager>().state;
    return Style7BottomNavBar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: backgroundColor ?? theme.popover,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      itemAnimationProperties: const ItemAnimation(
        curve: Curves.easeOutQuad,
        duration: Duration(milliseconds: 400),
      ),
    );
  }

  static Widget fixed3(
    BuildContext context,
    NavBarConfig navBarConfig,
    Color? backgroundColor,
  ) {
    final theme = context.watch<TThemeManager>().state;
    return Style10BottomNavBar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: backgroundColor ?? theme.popover,
      ),
    );
  }

  static Widget fixed5(
    BuildContext context,
    NavBarConfig navBarConfig,
    Color? activeColor,
    Color? backgroundColor,
  ) {
    final theme = context.watch<TThemeManager>().state;
    return CircularNavbar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: activeColor ?? theme.primary,
      ),
      backgroundColor: backgroundColor,
    );
  }

  static Widget floating3(
    BuildContext context,
    NavBarConfig navBarConfig,
    Color? activeColor,
    Color? backgroundColor,
  ) {
    final theme = context.watch<TThemeManager>().state;
    return FloatingCircularDotNavBar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: activeColor ?? theme.primary,
      ),
      backgroundColor: backgroundColor ?? theme.popover,
    );
    // return FloatingStyle10NavBar(
    //   navBarConfig: navBarConfig,
    //   backgroundColor: backgroundColor ?? Colors.white.withValues(alpha: 0.9),
    // );
  }

  static Widget floating4(
    BuildContext context,
    NavBarConfig navBarConfig,
    Color? activeColor,
    Color? backgroundColor,
  ) {
    final theme = context.watch<TThemeManager>().state;
    return FloatingCircularTextNavbar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: activeColor ?? theme.primary,
      ),
      backgroundColor: backgroundColor ??
          theme.popover
    );
    // return FloatingStyle4NavBar(
    //   navBarConfig: navBarConfig,
    //   backgroundColor: backgroundColor ?? Colors.white,
    // );
  }

  static Widget floating5(
    BuildContext context,
    NavBarConfig navBarConfig,
    Color? activeColor,
    Color? backgroundColor,
  ) {
    final theme = context.watch<TThemeManager>().state;
    return FloatingCircularNavbar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: activeColor ?? theme.primary,
      ),
      backgroundColor: backgroundColor ?? theme.popover,
    );
  }
}
