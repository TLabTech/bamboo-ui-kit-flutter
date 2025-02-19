import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/form/slider/slider_tumb.dart';

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
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: activeColor ?? HexColor(primary500),
        thumbShape: CustomSliderThumb(
          innerColor: thumbInnerColor,
          outerColor: thumbOuterColor,
        ),
        inactiveTrackColor: inactiveColor ?? HexColor(neutral200),
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
