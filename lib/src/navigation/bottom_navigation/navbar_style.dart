import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/circular_navbar.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/floating_circular_text_navbar.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/floating_style_10.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/floating_circular_navbar.dart';
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

  static Widget fixed4(NavBarConfig navBarConfig, Color? backgroundColor) {
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

  static Widget fixed3(NavBarConfig navBarConfig, Color? backgroundColor) {
    return Style10BottomNavBar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: backgroundColor ?? Colors.white,
      ),
    );
  }

  static Widget fixed5(
      NavBarConfig navBarConfig, Color? activeColor, Color? backgroundColor) {
    return CircularNavbar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: activeColor ?? HexColor('#00DE9C'),
      ),
      backgroundColor: backgroundColor,
    );
  }

  static Widget floating3(
      NavBarConfig navBarConfig, Color? activeColor, Color? backgroundColor) {
    return FloatingStyle10NavBar(
      navBarConfig: navBarConfig,
      backgroundColor: backgroundColor ?? Colors.white.withValues(alpha: 0.9),
    );
  }

  static Widget floating4(
      NavBarConfig navBarConfig, Color? activeColor, Color? backgroundColor) {
    return FloatingCircularTextNavbar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: activeColor ??
            HexColor('#00DE9C'), // Green for active circular indicator
      ),
      backgroundColor: backgroundColor ??
          Colors.white.withValues(
              alpha: 0.9), // Semi-transparent white for frosted effect
    );
    // return FloatingStyle4NavBar(
    //   navBarConfig: navBarConfig,
    //   backgroundColor: backgroundColor ?? Colors.white,
    // );
  }

  static Widget floating5(
      NavBarConfig navBarConfig, Color? activeColor, Color? backgroundColor) {
    return FloatingCircularNavbar(
      navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(
        color: activeColor ?? HexColor('#00DE9C'),
      ),
      backgroundColor: backgroundColor ?? Colors.white,
    );
  }
}
