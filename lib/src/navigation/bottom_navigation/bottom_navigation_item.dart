import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';

class TBottomNavigationItem {
  static BottomNavigationBarItem build({
    required Widget icon,
    required int index,
    required String label,
    required bool showIndicator,
    required bool isSelected,
    required Color? selectedItemColor,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          if (isSelected && showIndicator)
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: selectedItemColor ?? HexColor(primary500),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      label: showIndicator == false ? label : "",
    );
  }
}
