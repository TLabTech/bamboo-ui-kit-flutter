import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bamboo_ui_kit/fondation/hex_color.dart';

class TShadow {
  static final BoxShadow shadowS = BoxShadow(
    color: HexColor("#F1F5F9"),
    offset: Offset(0, 4),
    blurRadius: 4,
  );

  static final BoxShadow shadowM = BoxShadow(
    color: HexColor("#F1F5F9"),
    offset: Offset(0, 8),
    blurRadius: 8,
  );

  static final BoxShadow shadowL = BoxShadow(
    color: HexColor("#F1F5F9"),
    offset: Offset(0, 16),
    blurRadius: 16,
  );
}