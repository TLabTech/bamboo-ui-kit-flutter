import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_bamboo_ui_kit/widgets/bar_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// A widget that displays a bar chart using [SfCartesianChart].
///
/// This widget supports horizontal and vertical bar charts, optional legends,
/// and an additional options button.
class TBarChart extends StatelessWidget {
  /// The title of the bar chart.
  final String title;

  /// The data to be displayed in the chart.
  final List<ChartData> data;

  /// Callback function triggered when the options button is tapped.
  final VoidCallback? optionTap;

  /// Determines whether to show legends below the chart.
  final bool showLegends;

  /// Determines whether to show the options button.
  final bool showOption;

  /// The direction of the bar chart, either [Axis.horizontal] or [Axis.vertical].
  final Axis direction;

  /// The height of the chart container.
  final double? height;

  /// The color of the bars in the chart.
  final Color? barColor;

  /// Creates a [TBarChart] widget.
  const TBarChart({
    super.key,
    required this.title,
    required this.data,
    this.optionTap,
    this.showLegends = true,
    this.showOption = true,
    this.direction = Axis.horizontal,
    this.height = 300,
    this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: HexColor(gray050),
        border: Border.all(color: HexColor(gray300), width: 1.0),
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
                      .copyWith(color: HexColor(gray900)),
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
                primaryXAxis: CategoryAxis(
                  isInversed: direction == Axis.horizontal ? false : true,
                ),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 100,
                  interval: 20,
                ),
                series: <CartesianSeries<dynamic, dynamic>>[
                  direction == Axis.horizontal
                      ? ColumnSeries<dynamic, dynamic>(
                          dataSource: data,
                          xValueMapper: (data, _) => data.label,
                          yValueMapper: (data, _) => data.value,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: TFontRegular.caption2(context)
                                .copyWith(color: HexColor(gray900)),
                            labelAlignment: ChartDataLabelAlignment.outer,
                          ),
                          color: barColor ?? HexColor(primary500),
                        )
                      : BarSeries<dynamic, dynamic>(
                          dataSource: data,
                          xValueMapper: (data, _) => data.label,
                          yValueMapper: (data, _) => data.value,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: TFontRegular.caption2(context)
                                .copyWith(color: HexColor(gray900)),
                            labelAlignment: ChartDataLabelAlignment.outer,
                          ),
                          color: barColor ?? HexColor(primary500),
                        )
                ],
                legend: Legend(isVisible: false),
              ),
            ),
            const SizedBox(height: 10),
            if (showLegends)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    color: barColor ?? HexColor(primary500),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "1",
                    style: TFontRegular.caption2(context)
                        .copyWith(color: HexColor(gray900)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
