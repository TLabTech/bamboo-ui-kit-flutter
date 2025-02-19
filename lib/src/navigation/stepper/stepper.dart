import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

class TStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color? activeColor;
  final Color? inactiveColor;

  const TStepper({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Step $currentStep",
                  style: TFontRegular.caption2
                      .copyWith(color: activeColor ?? HexColor(primary500)),
                ),
                TextSpan(
                  text: " of $totalSteps",
                  style: TFontRegular.caption2.copyWith(
                      color: currentStep == totalSteps
                          ? activeColor ?? HexColor(primary500)
                          : inactiveColor ?? HexColor(neutral500)),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: List.generate(totalSteps, (index) {
            bool isActive = index < currentStep;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: isActive
                        ? activeColor ?? HexColor(primary500)
                        : inactiveColor ?? HexColor(neutral300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
