import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// A customizable line chart widget.
///
/// This widget displays multiple series of data in a line chart format.
/// It supports legends, tooltip behavior, and an options button.
///
/// The chart uses `SfCartesianChart` from Syncfusion for rendering.
///
/// Example usage:
/// ```dart
/// TLineChart(
///   title: "Monthly Sales",
///   data: [
///     [LineChartData(x: "Jan", y: 50, color: Colors.blue)],
///     [LineChartData(x: "Feb", y: 80, color: Colors.green)],
///   ],
///   legendLabels: [LegendLabel(label: "Sales", color: Colors.blue)],
///   showLegends: true,
///   showOption: true,
///   optionTap: () => print("Options tapped"),
/// )
/// ```
class TLineChart extends StatelessWidget {
  /// The title of the chart.
  final String title;

  /// A list of datasets representing the line chart series.
  ///
  /// Each list inside `data` represents a separate series.
  final List<List<LineChartData>> data;

  /// Labels for the legends, showing the meaning of each dataset.
  ///
  /// If `null`, legends will not be displayed.
  final List<LegendLabel>? legendLabels;

  /// Callback function triggered when the options button is tapped.
  final VoidCallback? optionTap;

  /// Whether to display legends below the chart.
  final bool showLegends;

  /// Whether to show the options button in the top-right corner.
  final bool showOption;

  /// The height of the chart widget.
  final double? height;

  /// Creates a line chart widget.
  ///
  /// - [title]: The chart's title.
  /// - [data]: The series data for the chart.
  /// - [legendLabels]: Labels for the chart legends.
  /// - [optionTap]: A callback function for the options button.
  /// - [showLegends]: Whether to show legends.
  /// - [showOption]: Whether to show the options button.
  /// - [height]: The height of the chart widget.
  const TLineChart({
    super.key,
    required this.title,
    required this.data,
    this.legendLabels,
    this.optionTap,
    this.showLegends = true,
    this.showOption = true,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: theme.background,
        border: Border.all(color: theme.border, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style:
                      TFontBold.body(context).copyWith(color: theme.foreground),
                ),
                if (showOption)
                  InkWell(
                    onTap: optionTap,
                    child: const Icon(Icons.more_horiz),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: height ?? 250,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 100,
                  interval: 20,
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: _buildLineSeries(),
              ),
            ),
            const SizedBox(height: 10),
            if (showLegends)
              legendLabels == null
                  ? const SizedBox()
                  : _buildLegends(context, theme),
          ],
        ),
      ),
    );
  }

  /// Builds the series of the line chart.
  ///
  /// Each dataset is represented as a `SplineSeries`.
  List<SplineSeries<LineChartData, String>> _buildLineSeries() {
    return List.generate(data.length, (index) {
      return SplineSeries<LineChartData, String>(
        dataSource: data[index],
        xValueMapper: (LineChartData data, _) => data.x,
        yValueMapper: (LineChartData data, _) => data.y,
        pointColorMapper: (LineChartData data, _) => data.color,
        markerSettings: const MarkerSettings(isVisible: true),
        dataLabelSettings: const DataLabelSettings(isVisible: true),
      );
    });
  }

  /// Builds the legend widget displaying series colors and labels.
  Widget _buildLegends(BuildContext context, TTheme theme) {
    return Center(
      child: Wrap(
        spacing: 10,
        children: legendLabels!.map((data) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: data.color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                data.label,
                style: TFontRegular.caption2(context)
                    .copyWith(color: theme.foreground),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
