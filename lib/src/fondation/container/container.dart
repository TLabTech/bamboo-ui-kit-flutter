import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/utils/tshadow.dart';

class TContainerWBoxDecoration extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderRadius;
  final Color backgroundColor;
  final BoxShadow boxShadow;

  TContainerWBoxDecoration({
    super.key,
    this.child = const SizedBox(),
    this.height = 40,
    this.width = 40,
    this.margin = const EdgeInsets.all(16),
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 8,
    this.backgroundColor = Colors.white,
    BoxShadow? boxShadow, // Use nullable parameter
  })  : boxShadow = boxShadow ?? TShadow.shadowM;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [boxShadow],
      ),
      child: child,
    );
  }
}