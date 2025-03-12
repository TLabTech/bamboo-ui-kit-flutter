import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CircularNavbar extends StatefulWidget {
  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;
  final Color? backgroundColor;

  const CircularNavbar({
    super.key,
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.backgroundColor,
  });

  @override
  State<CircularNavbar> createState() => _CircularNavbarState();
}

class _CircularNavbarState extends State<CircularNavbar>
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
  void didUpdateWidget(CircularNavbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.navBarConfig.selectedIndex !=
        oldWidget.navBarConfig.selectedIndex) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          color: widget.backgroundColor ?? Colors.white,
          padding: EdgeInsets.symmetric(vertical: 8.0),
          duration: Duration(milliseconds: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: isActive ? _scaleAnimation.value : 1.0,
                            child: Opacity(
                              opacity: isActive ? _opacityAnimation.value : 1.0,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isActive
                                      ? widget.navBarDecoration.color
                                      : Colors.transparent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: isActive ? tab.icon : tab.inactiveIcon,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
