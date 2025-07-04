import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/widgets/bottom_navigation.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class TBottomNavigationHelper {
  static PersistentTabController? _controller;

  static void setController(PersistentTabController controller) {
    _controller = controller;
  }

  /// Pushes a new screen with transition, optionally with nav bar
  Future<T?> pushNewScreen<T extends Object?>(
      BuildContext context, {
        required Widget screen,
        bool withNavBar = false,
        PageTransitionAnimation pageTransitionAnimation =
            PageTransitionAnimation.platform,
        PageRoute<T>? customPageRoute,
        RouteSettings? settings,
      }) {
    return pushScreen<T>(
      context,
      screen: screen,
      withNavBar: withNavBar,
      pageTransitionAnimation: pageTransitionAnimation,
      customPageRoute: customPageRoute,
      settings: settings,
    );
  }

  /// Push a raw route with nav bar
  Future<T?> pushNewScreenWithNavBar<T>(
      BuildContext context, Route<T> route) {
    return pushWithNavBar(context, route);
  }

  /// Push a raw route without nav bar
  Future<T?> pushNewScreenWithoutNavBar<T>(
      BuildContext context, Route<T> route) {
    return pushWithoutNavBar(context, route);
  }

  /// Push a screen with nav bar, using built-in animation
  Future<T?> pushScreenWithNavBar<T>(BuildContext context, Widget screen) {
    return pushScreen<T>(
      context,
      screen: screen,
      withNavBar: true,
    );
  }

  /// Push a screen without nav bar, using built-in animation
  Future<T?> pushScreenWithoutNavBar<T>(BuildContext context, Widget screen) {
    return pushScreen<T>(
      context,
      screen: screen,
      withNavBar: false,
    );
  }

  /// Replace current route with one with nav bar
  Future<T?> pushReplacementWithNavBar<T extends Object?, TO extends Object?>(
      BuildContext context,
      Route<T> route, {
        TO? result,
      }) {
    return pushReplacementWithNavBar<T, TO>(
      context,
      route,
      result: result,
    );
  }

  /// Replace current route with one without nav bar
  Future<T?> pushReplacementWithoutNavBar<T extends Object?, TO extends Object?>(
      BuildContext context,
      Route<T> route, {
        TO? result,
      }) {
    return pushReplacementWithoutNavBar<T, TO>(
      context,
      route,
      result: result,
    );
  }

  /// Pop the current route
  void popScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  /// Jump to a specific tab index
  void jumpToTab(int index, BuildContext? context) {
    if (_controller != null) {
      _controller!.jumpToTab(index);
    } else if (context != null) {
      final state = context.findAncestorStateOfType<TBottomNavigationState>();
      if (state != null) {
        state.controller.jumpToTab(index);
      } else {
        throw Exception(
            'TBottomNavigation not found in widget tree and controller not set');
      }
    } else {
      throw Exception('TBottomNavigation controller not initialized');
    }
  }

  /// Get the current tab index
  int getCurrentIndex({BuildContext? context}) {
    if (_controller != null) {
      return _controller!.index;
    } else if (context != null) {
      final state = context.findAncestorStateOfType<TBottomNavigationState>();
      if (state != null) {
        return state.controller.index;
      } else {
        throw Exception(
            'TBottomNavigation not found in widget tree and controller not set');
      }
    } else {
      throw Exception('TBottomNavigation controller not initialized');
    }
  }
}
