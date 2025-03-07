import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/chart/doughnut/doughnut_chart_data.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TDoughnutChart extends StatelessWidget {
  final String title;
  final List<DoughnutChartData> data;
  final VoidCallback? optionTap;
  final bool showLegends;
  final bool showOption;
  final double? height;

  const TDoughnutChart({
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
              height: height ?? 250,
              child: SfCircularChart(
                margin: EdgeInsets.zero,
                series: <DoughnutSeries<DoughnutChartData, String>>[
                  DoughnutSeries<DoughnutChartData, String>(
                    dataSource: data,
                    xValueMapper: (DoughnutChartData data, _) => data.label,
                    yValueMapper: (DoughnutChartData data, _) => data.value,
                    pointColorMapper: (DoughnutChartData data, _) => data.color,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.inside,
                      labelIntersectAction: LabelIntersectAction.hide,
                      builder: (dynamic data, dynamic point, dynamic series,
                          int pointIndex, int seriesIndex) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              data.label,
                              style: TFontRegular.caption2.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${data.value}",
                              style: TFontBold.body.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    innerRadius: '30%',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            if (showLegends) _buildCustomLegend()
          ],
        ),
      ),
    );
  }

  Widget _buildCustomLegend() {
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
                style: TFontRegular.caption2
                    .copyWith(color: HexColor(neutral900)),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
