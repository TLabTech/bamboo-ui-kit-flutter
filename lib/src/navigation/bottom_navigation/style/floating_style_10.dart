import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class FloatingStyle10NavBar extends StatelessWidget {
  final NavBarConfig navBarConfig;
  final Color? backgroundColor;

  const FloatingStyle10NavBar({
    super.key,
    required this.navBarConfig,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Style10BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: backgroundColor ?? theme.popover,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          padding: EdgeInsets.only(top: 5, bottom: 5),
          boxShadow: [TShadow.shadowS()],
        ),
      ),
    );
  }
}
