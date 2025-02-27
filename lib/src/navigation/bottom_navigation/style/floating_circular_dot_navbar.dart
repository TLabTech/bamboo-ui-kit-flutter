import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class FloatingCircularDotNavBar extends StatefulWidget {
  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;
  final Color? backgroundColor;

  const FloatingCircularDotNavBar({
    super.key,
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.backgroundColor,
  });

  @override
  State<FloatingCircularDotNavBar> createState() =>
      _FloatingCircularDotNavBarState();
}

class _FloatingCircularDotNavBarState extends State<FloatingCircularDotNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
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
      margin: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 16.0), // Floating effect with padding
      decoration: BoxDecoration(
        color: widget.backgroundColor, // Semi-transparent white for frosted effect
        borderRadius: BorderRadius.circular(40), // Curved edges (20px radius)
        boxShadow: [
          TShadow.shadowS, // Shadow
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Reduce spacing between items
        children: List.generate(widget.navBarConfig.items.length, (index) {
          final isActive = widget.navBarConfig.selectedIndex == index;
          final tab = widget.navBarConfig.items[index];

          return Expanded(
            child: GestureDetector(
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
          );
        }),
      ),
    );
  }
}