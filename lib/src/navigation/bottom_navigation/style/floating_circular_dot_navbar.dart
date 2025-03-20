import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class FloatingCircularDotNavBar extends StatefulWidget {
  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;
  final Color? backgroundColor;
  final double itemSpacing;

  const FloatingCircularDotNavBar({
    super.key,
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.backgroundColor,
    this.itemSpacing = 16.0,
  });

  @override
  State<FloatingCircularDotNavBar> createState() =>
      _FloatingCircularDotNavBarState();
}

class _FloatingCircularDotNavBarState extends State<FloatingCircularDotNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 200),
    );

    if (widget.navBarConfig.selectedIndex >= 0) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FloatingCircularDotNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.navBarConfig.selectedIndex !=
        oldWidget.navBarConfig.selectedIndex) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          TShadow.shadowS(), // Shadow
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.navBarConfig.items.length, (index) {
          final isActive = widget.navBarConfig.selectedIndex == index;
          final tab = widget.navBarConfig.items[index];

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  widget.navBarConfig.onItemSelected(index);
                  setState(() {});
                },
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: isActive ? tab.icon : tab.inactiveIcon,
                          ),
                          if (isActive)
                            Container(
                              width: 6,
                              height: 6,
                              margin: EdgeInsets.only(right: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.navBarDecoration.color, // Green dot
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              if (index < widget.navBarConfig.items.length - 1)
                SizedBox(width: widget.itemSpacing),
            ],
          );
        }),
      ),
    );
  }
}
