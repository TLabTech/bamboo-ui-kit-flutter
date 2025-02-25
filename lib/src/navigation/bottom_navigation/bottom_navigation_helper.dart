import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/widgets/bottom_navigation.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class TBottomNavigationHelper {
  static PersistentTabController? _controller;

  static void setController(PersistentTabController controller) {
    _controller = controller;
  }

  void pushNewScreen(
    BuildContext context, {
    required Widget screen,
    required bool withNavBar,
  }) {
    pushScreen(
      context,
      screen: screen,
      withNavBar: withNavBar,
    );
  }

  void pushNewScreenWithNavBar(BuildContext context, MaterialPageRoute route) {
    pushWithNavBar(
      context,
      route,
    );
  }

  void pushNewScreenWithoutNavBar(
    BuildContext context,
    MaterialPageRoute route,
  ) {
    pushWithoutNavBar(
      context,
      route,
    );
  }

  void popScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void jumpToTab(int index, BuildContext? context) {
    if (_controller != null) {
      _controller!.jumpToTab(index);
    } else if (context != null) {
      final state = context.findAncestorStateOfType<TBottomNavigationState>();
      if (state != null) {
        state.controller.jumpToTab(index);
      } else {
        throw Exception('TBottomNavigation not found in widget tree and controller not set');
      }
    } else {
      throw Exception('TBottomNavigation controller not initialized');
    }
  }

  int getCurrentIndex({BuildContext? context}) {
    if (_controller != null) {
      return _controller!.index;
    } else if (context != null) {
      final state = context.findAncestorStateOfType<TBottomNavigationState>();
      if (state != null) {
        return state.controller.index;
      } else {
        throw Exception('TBottomNavigation not found in widget tree and controller not set');
      }
    } else {
      throw Exception('TBottomNavigation controller not initialized');
    }
  }
}
