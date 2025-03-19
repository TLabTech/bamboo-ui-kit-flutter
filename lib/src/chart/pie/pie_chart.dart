import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_bamboo_ui_kit/widgets/charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// A customizable pie chart widget for Flutter applications.
///
/// The `TPieChart` widget displays a pie chart with optional legends and
/// an action button. It uses the `SfCircularChart` from the
/// `syncfusion_flutter_charts` package to render the chart.
///
/// ### Example Usage:
/// ```dart
/// TPieChart(
///   title: "Sales Distribution",
///   data: [
///     PieChartData(label: "Product A", value: 30, color: Colors.blue),
///     PieChartData(label: "Product B", value: 20, color: Colors.red),
///   ],
///   showLegends: true,
///   showOption: true,
///   optionTap: () => print("More options tapped"),
/// )
/// ```
class TPieChart extends StatelessWidget {
  /// The title displayed at the top of the pie chart.
  final String title;

  /// The list of data points to be displayed in the pie chart.
  final List<PieChartData> data;

  /// A callback function triggered when the options button is tapped.
  final VoidCallback? optionTap;

  /// Whether to display the legend below the chart.
  ///
  /// Defaults to `true`.
  final bool showLegends;

  /// Whether to display the options button (three dots).
  ///
  /// Defaults to `true`.
  final bool showOption;

  /// The height of the chart container.
  ///
  /// Defaults to `300`.
  final double? height;

  /// Creates a `TPieChart` instance.
  ///
  /// - [title]: The title of the pie chart.
  /// - [data]: A list of `PieChartData` representing chart values.
  /// - [optionTap]: An optional callback when the options button is tapped.
  /// - [showLegends]: A flag to control the visibility of legends.
  /// - [showOption]: A flag to control the visibility of the options button.
  /// - [height]: The height of the pie chart.
  const TPieChart({
    super.key,
    required this.title,
    required this.data,
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
                  style: TFontBold.body(context).copyWith(color: HexColor(neutral900)),
                ),
                if (showOption)
                  InkWell(
                    onTap: optionTap,
                    child: Icon(Icons.more_horiz),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: height,
              width: double.infinity,
              child: SfCircularChart(
                margin: EdgeInsets.zero,
                series: <PieSeries<PieChartData, String>>[
                  PieSeries<PieChartData, String>(
                    dataSource: data,
                    xValueMapper: (PieChartData data, _) => data.label,
                    yValueMapper: (PieChartData data, _) => data.value,
                    pointColorMapper: (PieChartData data, _) => data.color,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.inside,
                      builder: (dynamic data, dynamic point, dynamic series,
                          int pointIndex, int seriesIndex) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              data.label,
                              style: TFontRegular.caption2(context).copyWith(
                                color: data.labelColor ?? Colors.white,
                              ),
                            ),
                            Text(
                              "${data.value}",
                              style: TFontBold.body(context).copyWith(
                                color: data.valueColor ??Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    explode: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (showLegends) _buildCustomLegend(context)
          ],
        ),
      ),
    );
  }

  /// Builds a custom legend for the pie chart.
  ///
  /// Each legend displays a color indicator alongside the corresponding label.
  Widget _buildCustomLegend(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 10,
        children: data.map((data) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: data.color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                data.label,
                style: TFontRegular.caption2(context).copyWith(
                  color: HexColor(neutral900),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
