import 'package:example/bottom_navigation_sample/screen1.dart';
import 'package:example/bottom_navigation_sample/screen2.dart';
import 'package:example/bottom_navigation_sample/screen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

enum NavbarStyle {
  style3,
  fixed4,
  fixed3,
  fixed5,
  floating3,
  floating4,
  floating5
}

class BottomNavigationSample extends StatefulWidget {
  final int initialIndex;
  final NavbarStyle navbarStyle;

  const BottomNavigationSample({
    super.key,
    this.initialIndex = 0,
    this.navbarStyle = NavbarStyle.fixed3,
  });

  @override
  State<BottomNavigationSample> createState() => _BottomNavigationSampleState();
}

class _BottomNavigationSampleState extends State<BottomNavigationSample> {
  final helper = TBottomNavigationHelper();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      helper.jumpToTab(widget.initialIndex, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<TBottomNavigationItem> tabs = [
      TBottomNavigationItem(
        screen: Screen1(),
        activeIcon: widget.navbarStyle == NavbarStyle.fixed5 ||
                widget.navbarStyle == NavbarStyle.floating5
            ? const Icon(
                Icons.home,
                color: Colors.white,
              )
            : widget.navbarStyle == NavbarStyle.floating4
                ? const Icon(
                    Icons.home,
                    color: Color(0xff00DE9C),
                  )
                : const Icon(
                    Icons.home,
                  ),
        inactiveIcon: const Icon(
          Icons.home,
          color: Colors.grey,
        ),
        title: "Home",
      ),
      TBottomNavigationItem(
        screen: Screen2(),
        activeIcon: widget.navbarStyle == NavbarStyle.fixed5 ||
                widget.navbarStyle == NavbarStyle.floating5
            ? const Icon(
                Icons.work,
                color: Colors.white,
              )
            : widget.navbarStyle == NavbarStyle.floating4
                ? const Icon(
                    Icons.work,
                    color: Color(0xff00DE9C),
                  )
                : const Icon(Icons.work),
        inactiveIcon: const Icon(
          Icons.work,
          color: Colors.grey,
        ),
        title: "Work",
      ),
      TBottomNavigationItem(
        screen: const Center(child: Text("Settings")),
        activeIcon: widget.navbarStyle == NavbarStyle.fixed5 ||
                widget.navbarStyle == NavbarStyle.floating5
            ? const Icon(Icons.settings, color: Colors.white)
            : widget.navbarStyle == NavbarStyle.floating4
                ? const Icon(
                    Icons.settings,
                    color: Color(0xff00DE9C),
                  )
                : const Icon(
                    Icons.settings,
                  ),
        inactiveIcon: const Icon(
          Icons.settings,
          color: Colors.grey,
        ),
        title: "Settings",
      ),
      TBottomNavigationItem(
        screen: Screen4(),
        activeIcon: widget.navbarStyle == NavbarStyle.fixed5 ||
                widget.navbarStyle == NavbarStyle.floating5
            ? const Icon(Icons.person, color: Colors.white)
            : widget.navbarStyle == NavbarStyle.floating4
                ? const Icon(
                    Icons.person,
                    color: Color(0xff00DE9C),
                  )
                : const Icon(
                    Icons.person,
                  ),
        inactiveIcon: const Icon(
          Icons.person,
          color: Colors.grey,
        ),
        title: "Account",
      ),
    ];
    return Scaffold(
      body: TBottomNavigation(
        tabs: tabs,
        navBarBuilder: (config) {
          switch (widget.navbarStyle) {
            case NavbarStyle.fixed3:
              return TNavbarStyle.fixed3(context, config, Colors.white);
            case NavbarStyle.fixed4:
              return TNavbarStyle.fixed4(context, config, Colors.white);
            case NavbarStyle.fixed5:
              return TNavbarStyle.fixed5(
                  context, config, Colors.green, Colors.white);
            case NavbarStyle.floating3:
              return TNavbarStyle.floating3(
                  context, config, Colors.green, Colors.white);
            case NavbarStyle.floating4:
              return TNavbarStyle.floating4(
                  context, config, Color(0xff00DE9C), Colors.white);
            case NavbarStyle.floating5:
              return TNavbarStyle.floating5(
                context,
                config,
                Color(0xff00DE9C),
                null,
              );
            case NavbarStyle.style3:
              return TNavbarStyle.style3(
                context,
                config,
                Colors.green,
              );
          }
        },
        backgroundColor: Colors.white10,
        navBarHeight: 80.0,
      ),
    );
  }
}
