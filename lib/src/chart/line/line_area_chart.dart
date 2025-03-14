import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_bamboo_ui_kit/widgets/charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// A customizable line area chart widget.
///
/// This widget displays multiple series of data in a line area chart format.
/// It supports legends, tooltip behavior, and an options button.
///
/// The chart uses `SfCartesianChart` from Syncfusion for rendering.
///
/// Example usage:
/// ```dart
/// TLineAreaChart(
///   title: "Sales Performance",
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
class TLineAreaChart extends StatelessWidget {
  /// The title of the chart.
  final String title;

  /// A list of datasets representing the area chart series.
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
  final double height;

  /// Creates a line area chart widget.
  ///
  /// - [title]: The chart's title.
  /// - [data]: The series data for the chart.
  /// - [legendLabels]: Labels for the chart legends.
  /// - [optionTap]: A callback function for the options button.
  /// - [showLegends]: Whether to show legends.
  /// - [showOption]: Whether to show the options button.
  /// - [height]: The height of the chart widget.
  const TLineAreaChart({
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: HexColor(neutral050),
        border: Border.all(color: HexColor(neutral300), width: 1.0),
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
                  style: TFontBold.body.copyWith(color: HexColor(neutral900)),
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
              height: height,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 100,
                  interval: 20,
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: _buildAreaSeries(),
              ),
            ),
            const SizedBox(height: 10),
            if (showLegends)
              legendLabels == null ? const SizedBox() : _buildLegends(),
          ],
        ),
      ),
    );
  }

  /// Builds the series of the area chart.
  ///
  /// Each dataset is represented as a `SplineAreaSeries`.
  List<SplineAreaSeries<LineChartData, String>> _buildAreaSeries() {
    return List.generate(data.length, (index) {
      final Color baseColor = data[index].first.color;

      return SplineAreaSeries<LineChartData, String>(
        dataSource: data[index],
        xValueMapper: (LineChartData data, _) => data.x,
        yValueMapper: (LineChartData data, _) => data.y,
        color: baseColor.withValues(alpha: 0.3),
        borderColor: baseColor.withValues(alpha: 0.9),
        borderWidth: 2,
        markerSettings: MarkerSettings(
          isVisible: true,
          shape: DataMarkerType.circle,
          borderColor: baseColor,
          borderWidth: 1,
        ),
        dataLabelSettings: const DataLabelSettings(isVisible: false),
      );
    });
  }

  /// Builds the legend widget displaying series colors and labels.
  Widget _buildLegends() {
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
                style:
                    TFontRegular.caption2.copyWith(color: HexColor(neutral900)),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
