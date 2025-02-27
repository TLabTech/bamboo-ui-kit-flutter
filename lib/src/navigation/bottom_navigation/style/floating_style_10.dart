import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/utils/tshadow.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class FloatingStyle10NavBar extends StatelessWidget {
  final NavBarConfig navBarConfig;
  final Color backgroundColor;

  const FloatingStyle10NavBar({
    super.key,
    required this.navBarConfig,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Style10BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: backgroundColor, // White background for Style10
          borderRadius: BorderRadius.all(Radius.circular(40)),
          padding: EdgeInsets.only(top: 5, bottom: 5),
          boxShadow: [
            TShadow.shadowS
          ],
        ),
      ),
    );
  }
}
