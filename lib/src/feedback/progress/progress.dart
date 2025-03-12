import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

enum TProgressType { linear, circular }

class TProgress extends StatelessWidget {
  final double value;
  final Color? valueColor;
  final TProgressType type;
  final double size;
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;

  const TProgress({
    super.key,
    required this.value,
    this.color,
    this.backgroundColor,
  })  : type = TProgressType.linear,
        size = 0,
        valueColor = null,
        strokeWidth = 0;

  const TProgress.circular({
    super.key,
    required this.value,
    this.valueColor,
    this.size = 120,
    this.strokeWidth = 6.0,
    this.color,
    this.backgroundColor,
  }) : type = TProgressType.circular;

  @override
  Widget build(BuildContext context) {
    final value = switch (this.value) {
      < 0.0 => 0.0,
      > 1.0 => 1.0,
      _ => this.value,
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        return type == TProgressType.linear
            ? linearProgress(constraints, value)
            : circularProgress(value);
      },
    );
  }

  Widget circularProgress(double value) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: strokeWidth,
            backgroundColor: backgroundColor ?? HexColor(neutral200),
            valueColor:
                AlwaysStoppedAnimation<Color>(color ?? HexColor(primary500)),
          ),
        ),
        Text(
          "${(value * 100).toInt()}%",
          style: TFontRegular.body.copyWith(
            color: valueColor ?? HexColor(neutral500),
            fontSize: size * 0.2,
          ),
        ),
      ],
    );
  }

  Widget linearProgress(BoxConstraints constraints, double value) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 6.0, maxHeight: 6.0),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor ?? HexColor(neutral200),
            ),
            width: constraints.maxWidth,
          ),
          AnimatedContainer(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color ?? HexColor(primary500),
            ),
            width: value * constraints.maxWidth,
          ),
        ],
      ),
    );
  }
}
