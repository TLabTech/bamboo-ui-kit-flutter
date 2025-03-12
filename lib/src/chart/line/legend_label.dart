import 'package:flutter/material.dart';

/// Represents a legend label for a chart.
///
/// A legend label consists of:
/// - A `label` representing the name or category.
/// - A `color` associated with the label for visual representation in the chart.
class LegendLabel {
  /// The name or category of the legend item.
  final String label;

  /// The color associated with this legend item.
  final Color color;

  /// Creates a new instance of [LegendLabel].
  ///
  /// - `label`: The name or category of the legend item.
  /// - `color`: The color representing this legend item in the chart.
  const LegendLabel({
    required this.label,
    required this.color,
  });
}
