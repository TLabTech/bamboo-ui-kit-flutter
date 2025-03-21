import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// A grouped bar chart widget that displays multiple series of data.
class TGroupBarChart extends StatelessWidget {
  /// The title of the chart.
  final String title;

  /// A list of series data to be displayed in the chart.
  final List<ChartSeriesData> seriesList;

  /// Callback function triggered when the options button is tapped.
  final VoidCallback? optionTap;

  /// The height of the chart.
  final double height;

  /// Whether to display legends below the chart.
  final bool showLegends;

  /// The orientation of the chart bars (horizontal or vertical).
  final Axis direction;

  /// Whether to show the options button in the top-right corner.
  final bool showOption;

  /// Creates a grouped bar chart widget.
  const TGroupBarChart({
    super.key,
    required this.title,
    required this.seriesList,
    this.optionTap,
    this.showLegends = true,
    this.showOption = true,
    this.direction = Axis.horizontal,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: theme.background,
        border: Border.all(color: theme.border, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TFontBold.body(context)
                      .copyWith(color: theme.foreground),
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
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  isInversed: direction == Axis.horizontal ? false : true,
                ),
                primaryYAxis:
                    NumericAxis(minimum: 0, maximum: 100, interval: 20),
                series: seriesList.map((seriesData) {
                  if (direction == Axis.horizontal) {
                    return ColumnSeries<ChartData, String>(
                      name: seriesData.label,
                      dataSource: seriesData.data,
                      xValueMapper: (ChartData data, _) => data.label,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: seriesData.color,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: TFontRegular.caption2(context)
                            .copyWith(color: theme.foreground),
                        labelAlignment: ChartDataLabelAlignment.outer,
                      ),
                    );
                  } else {
                    return BarSeries<ChartData, String>(
                      name: seriesData.label,
                      dataSource: seriesData.data,
                      xValueMapper: (ChartData data, _) => data.label,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: seriesData.color,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        textStyle: TFontRegular.caption2(context)
                            .copyWith(color: theme.foreground),
                        labelAlignment: ChartDataLabelAlignment.outer,
                      ),
                    );
                  }
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
            if (showLegends) _buildCustomLegend(context, theme),
          ],
        ),
      ),
    );
  }

  /// Builds a custom legend displaying series colors and labels.
  Widget _buildCustomLegend(BuildContext context, TTheme theme) {
    return Center(
      child: Wrap(
        spacing: 10,
        children: seriesList.map((data) {
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
