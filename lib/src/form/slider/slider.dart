import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/src/form/slider/slider_tumb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbInnerColor;
  final Color? thumbOuterColor;

  const TSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.thumbInnerColor,
    this.thumbOuterColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: activeColor ?? theme.primary,
        thumbShape: CustomSliderThumb(
          theme: theme,
          innerColor: thumbInnerColor,
          outerColor: thumbOuterColor,
        ),
        inactiveTrackColor: inactiveColor ?? theme.border,
        trackHeight: 6.0,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Slider(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
