import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

class CustomSliderThumb extends SliderComponentShape {
  final TTheme theme;
  final Color? innerColor;
  final Color? outerColor;
  const CustomSliderThumb({required this.theme, this.innerColor, this.outerColor});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size(24, 24);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint outerCirclePaint = Paint()
      ..color = theme.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Paint innerCirclePaint = Paint()
      ..color = innerColor ?? theme.primaryForeground
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 8, outerCirclePaint);
    canvas.drawCircle(center, 6, innerCirclePaint);
  }
}
