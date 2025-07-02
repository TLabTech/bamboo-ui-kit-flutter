import 'package:flutter/material.dart';

/// Represents a single data point in a chart.
class ChartData {
  /// The label or category of the data point.
  final String label;

  /// The numerical value of the data point.
  final double value;

  /// Creates a [ChartData] instance with the given [label] and [value].
  const ChartData(this.label, this.value);
}

/// Represents a series of data points in a chart, with an assigned color.
class ChartSeriesData {
  /// The label for the series.
  final String label;

  /// The list of data points associated with this series.
  final List<ChartData> data;

  /// The color representing this series in the chart.
  final Color color;

  /// Creates a [ChartSeriesData] instance with the given [label], [data], and [color].
  const ChartSeriesData({
    required this.label,
    required this.data,
    required this.color,
  });
}
