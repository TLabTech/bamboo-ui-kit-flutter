import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final theme = context.watch<TThemeManager>().state;

    final value = switch (this.value) {
      < 0.0 => 0.0,
      > 1.0 => 1.0,
      _ => this.value,
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        return type == TProgressType.linear
            ? linearProgress(constraints, value, theme)
            : circularProgress(context, value, theme);
      },
    );
  }

  Widget circularProgress(BuildContext context, double value, TTheme theme) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: strokeWidth,
            backgroundColor: backgroundColor ?? theme.border,
            valueColor:
                AlwaysStoppedAnimation<Color>(color ?? theme.primary),
          ),
        ),
        Text(
          "${(value * 100).toInt()}%",
          style: TFontRegular.body(context).copyWith(
            color: valueColor ?? theme.foreground,
            fontSize: size * 0.2,
          ),
        ),
      ],
    );
  }

  Widget linearProgress(
    BoxConstraints constraints,
    double value,
    TTheme theme,
  ) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 6.0, maxHeight: 6.0),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor ?? theme.border,
            ),
            width: constraints.maxWidth,
          ),
          AnimatedContainer(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color ?? theme.primary,
            ),
            width: value * constraints.maxWidth,
          ),
        ],
      ),
    );
  }
}
