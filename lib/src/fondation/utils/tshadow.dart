import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';

class TShadow {
  static BoxShadow shadowS({Color? color}) {
    return BoxShadow(
      color: color ?? HexColor("#F1F5F9"),
      offset: Offset(0, 4),
      blurRadius: 4,
    );
  }

  static BoxShadow shadowM({Color? color}) {
    return BoxShadow(
      color: color ?? HexColor("#F1F5F9"),
      offset: Offset(0, 8),
      blurRadius: 8,
    );
  }

  static BoxShadow shadowL({Color? color}) {
    return BoxShadow(
      color: color ?? HexColor("#F1F5F9"),
      offset: Offset(0, 16),
      blurRadius: 16,
    );
  }
}
