import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/circular_navbar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class TNavbarStyle {
  static Widget style3(NavBarConfig navBarConfig, Color? backgroundColor) {
    return Style3BottomNavBar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: backgroundColor ?? Colors.white,
      ),
    );
  }

  static Widget style7(NavBarConfig navBarConfig, Color? backgroundColor) {
    return Style7BottomNavBar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      itemAnimationProperties: const ItemAnimation(
        curve: Curves.easeOutQuad,
        duration: Duration(milliseconds: 400),
      ),
    );
  }

  static Widget style10(NavBarConfig navBarConfig, Color? backgroundColor) {
    return Style10BottomNavBar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: backgroundColor ?? Colors.white,
      ),
    );
  }

  static Widget styleCircular(
      NavBarConfig navBarConfig, Color? activeColor, Color? backgroundColor) {
    return CircularNavbar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: activeColor ?? HexColor('#00DE9C'),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
