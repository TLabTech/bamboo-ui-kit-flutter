import 'package:flutter/material.dart';

/// Represents a single data point in a line chart.
///
/// This class is used to store the x-axis label, y-axis value, and the color
/// associated with a specific data point in a line chart.
class LineChartData {
  /// The label or category for the x-axis.
  final String x;

  /// The numerical value for the y-axis.
  final double y;

  /// The color associated with this data point.
  final Color color;

  /// Creates a [LineChartData] instance.
  ///
  /// - [x]: The label for the x-axis.
  /// - [y]: The value for the y-axis.
  /// - [color]: The color of the data point.
  LineChartData({
    required this.x,
    required this.y,
    required this.color,
  });
}
