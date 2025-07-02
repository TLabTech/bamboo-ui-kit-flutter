import 'package:flutter/material.dart';

/// Represents a single data point in a pie chart.
///
/// The `PieChartData` class holds information about an individual segment
/// in a pie chart, including its label, value, and associated color.
///
/// ### Example Usage:
/// ```dart
/// List<PieChartData> pieData = [
///   PieChartData(label: "Category A", value: 40, color: Colors.blue),
///   PieChartData(label: "Category B", value: 30, color: Colors.red),
///   PieChartData(label: "Category C", value: 20, color: Colors.green),
/// ];
/// ```
class PieChartData {
  /// The label associated with the pie chart segment.
  final String label;

  /// An optional color for the label of the pie chart segment.
  final Color? labelColor;

  /// The numeric value representing the size of the pie chart segment.
  final double value;

  /// An optional color for the value of the pie chart segment.
  final Color? valueColor;

  /// The color used to represent the pie chart segment.
  final Color color;

  /// Creates a new instance of `PieChartData`.
  ///
  /// - [label]: The name or category of the pie chart segment.
  /// - [value]: The numerical value representing the size of the segment.
  /// - [color]: The color used for the segment in the chart.
  const PieChartData({
    required this.label,
    this.labelColor,
    required this.value,
    this.valueColor,
    required this.color,
  });
}
