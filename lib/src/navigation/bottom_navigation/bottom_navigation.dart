import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class TBottomNavigation extends StatefulWidget {
  final List<TBottomNavigationItem> tabs;
  final Color? backgroundColor;
  final double navBarHeight;
  final void Function(int)? onTabChanged;
  final Widget Function(NavBarConfig) navBarBuilder;

  const TBottomNavigation({
    super.key,
    required this.tabs,
    required this.navBarBuilder,
    this.backgroundColor,
    this.navBarHeight = 60.0,
    this.onTabChanged,
  });

  @override
  State<TBottomNavigation> createState() => TBottomNavigationState();
}

class TBottomNavigationState extends State<TBottomNavigation> {
  late final PersistentTabController controller;

  @override
  void initState() {
    controller = PersistentTabController(initialIndex: 0);
    TBottomNavigationHelper.setController(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return PersistentTabView(
      controller: controller,
      tabs: widget.tabs
          .map((item) => item.toPersistentTabConfig(context))
          .toList(),
      navBarBuilder: widget.navBarBuilder,
      backgroundColor: widget.backgroundColor ?? theme.popover,
      navBarHeight: widget.navBarHeight,
      onTabChanged: widget.onTabChanged,
    );
  }
}
