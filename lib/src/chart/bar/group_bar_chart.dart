import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_bamboo_ui_kit/widgets/chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TGroupBarChart extends StatelessWidget {
  final String title;
  final List<ChartSeriesData> seriesList;
  final VoidCallback? optionTap;
  final double height;
  final bool showLegends;
  final Axis direction;
  final bool showOption;

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: HexColor(neutral050),
        border: Border.all(color: HexColor(neutral300), width: 1.0),
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
                  style: TFontBold.body.copyWith(color: HexColor(neutral900)),
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
                primaryXAxis: CategoryAxis(),
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
                        textStyle: TFontRegular.caption2
                            .copyWith(color: HexColor(neutral900)),
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
                        textStyle: TFontRegular.caption2
                            .copyWith(color: HexColor(neutral900)),
                        labelAlignment: ChartDataLabelAlignment.outer,
                      ),
                    );
                  }
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
            if (showLegends) _buildCustomLegend(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomLegend() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: seriesList.map((seriesData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: seriesData.color,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  seriesData.label,
                  style: TFontRegular.caption2
                      .copyWith(color: HexColor(neutral900)),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
