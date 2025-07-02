import 'package:flutter/material.dart';

/// Represents a data point for a doughnut chart.
///
/// Each data point consists of:
/// - A `label` representing the category or name of the data.
/// - A `value` representing the numerical value associated with the category.
/// - A `color` defining the visual representation of the data in the chart.
class DoughnutChartData {
  /// The label or category name of the data point.
  final String label;

  /// The numerical value associated with this data point.
  final double value;

  /// The color used to represent this data point in the chart.
  final Color color;

  /// Creates a new instance of [DoughnutChartData].
  ///
  /// - `label`: The category name of the data point.
  /// - `value`: The numeric value for the data point.
  /// - `color`: The color representing the data point in the chart.
  const DoughnutChartData({
    required this.label,
    required this.value,
    required this.color,
  });
}
