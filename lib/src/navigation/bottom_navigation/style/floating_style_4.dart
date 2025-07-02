import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class FloatingStyle4NavBar extends StatelessWidget {
  final NavBarConfig navBarConfig;
  final Color? backgroundColor;

  const FloatingStyle4NavBar({
    super.key,
    required this.navBarConfig,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return Container(
      margin: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!.withValues(alpha: 0.9)
            : theme.popover,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3), // Drop shadow
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, -2), // Shadow above the nav bar
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Style7BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: backgroundColor ?? theme.popover,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          itemAnimationProperties: const ItemAnimation(
            curve: Curves.easeOutQuad,
            duration: Duration(milliseconds: 400),
          ),
        ),
      ),
    );
  }
}
