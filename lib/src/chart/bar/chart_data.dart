import 'package:flutter/material.dart';

class ChartData {
  final String label;
  final double value;

  ChartData(this.label, this.value);
}

class ChartSeriesData {
  final String label;
  final List<ChartData> data;
  final Color color;

  ChartSeriesData({
    required this.label,
    required this.data,
    required this.color,
  });
}
