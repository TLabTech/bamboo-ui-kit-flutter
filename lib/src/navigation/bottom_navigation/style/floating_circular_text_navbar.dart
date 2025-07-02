import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class FloatingCircularTextNavbar extends StatefulWidget {
  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;
  final Color? backgroundColor;
  final double itemSpacing;

  const FloatingCircularTextNavbar({
    super.key,
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.backgroundColor,
    this.itemSpacing = 16,
  });

  @override
  State<FloatingCircularTextNavbar> createState() =>
      _FloatingCircularTextNavbarState();
}

class _FloatingCircularTextNavbarState extends State<FloatingCircularTextNavbar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _bounceAnimation;
  late List<AnimationController> _animationControllerList;
  late List<Animation<double>> _animationList;

  @override
  void initState() {
    super.initState();
    _animationControllerList = List<AnimationController>.empty(growable: true);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );

    _animationList = List<Animation<double>>.empty(growable: true);
    for (int i = 0; i < widget.navBarConfig.items.length; ++i) {
      _animationControllerList.add(
        AnimationController(
          duration: const Duration(
            milliseconds: 300,
          ),
          vsync: this,
        ),
      );
      _animationList.add(
        Tween(begin: 0.95, end: 1.2)
            .chain(CurveTween(curve: Curves.ease))
            .animate(_animationControllerList[i]),
      );
    }

    _bounceAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve:
            Curves.bounceOut, // Bounce effect similar to FloatingStyle4NavBar
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
      });

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
  void didUpdateWidget(FloatingCircularTextNavbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.navBarConfig.selectedIndex !=
        oldWidget.navBarConfig.selectedIndex) {
      _animationController.forward(from: 0.0); // Trigger bounce on tab change
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? theme.popover,
        borderRadius: BorderRadius.circular(40),
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
                  animation: _bounceAnimation,
                  builder: (context, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: isActive ? _bounceAnimation.value : 1.0,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: isActive ? tab.icon : tab.inactiveIcon,
                              ),
                            ),
                          ),
                          Text(
                            tab.title ?? '',
                            style: TFontRegular.caption1(context).copyWith(
                              color: isActive
                                  ? widget.navBarDecoration.color
                                  : theme.mutedForeground,
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
