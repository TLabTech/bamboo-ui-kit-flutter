import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final theme = context.watch<TThemeManager>().state;
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
                  style: TFontRegular.caption2(context)
                      .copyWith(color: activeColor ?? theme.primary),
                ),
                TextSpan(
                  text: " of $totalSteps",
                  style: TFontRegular.caption2(context).copyWith(
                      color: currentStep == totalSteps
                          ? activeColor ?? theme.primary
                          : inactiveColor ?? theme.foreground),
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
                        ? activeColor ?? theme.primary
                        : inactiveColor ?? theme.border,
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
