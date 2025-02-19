import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/bottom_navigation_item.dart';

class TBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int>? onTap;
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double iconSize = 24.0;
  final double selectedFontSize = 14.0;
  final double unselectedFontSize = 12.0;
  final bool? showUnselectedLabels;
  final bool? showSelectedLabels;
  final bool? showIndicator;

  const TBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.items,
    required this.currentIndex,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.showIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: backgroundColor ?? Colors.white,
      selectedItemColor: selectedItemColor ?? HexColor(primary500),
      unselectedItemColor: unselectedItemColor ?? HexColor(neutral400),
      showSelectedLabels:
          showIndicator ?? false ? false : showSelectedLabels ?? true,
      showUnselectedLabels:
          showIndicator ?? false ? false : showUnselectedLabels ?? true,
      type: BottomNavigationBarType.fixed,
      items: items.map((item) {
        int index = items.indexOf(item);
        bool isSelected = currentIndex == index;

        return TBottomNavigationItem.build(
          icon: item.icon,
          index: index,
          label: item.label ?? '',
          showIndicator: showIndicator ?? false,
          isSelected: isSelected,
          selectedItemColor: selectedItemColor,
        );
      }).toList(),
    );
  }
}
