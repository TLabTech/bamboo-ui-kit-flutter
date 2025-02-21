import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_bamboo_ui_kit/widgets/charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TBarChart extends StatelessWidget {
  final String title;
  final List<ChartData> data;
  final VoidCallback? optionTap;
  final bool showLegends;
  final bool showOption;
  final Axis direction;
  final double? height;
  final Color? barColor;

  const TBarChart(
      {super.key,
      required this.title,
      required this.data,
      this.optionTap,
      this.showLegends = true,
      this.showOption = true,
      this.direction = Axis.horizontal,
      this.height = 300,
      this.barColor});

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
                            textStyle: TFontRegular.caption2
                                .copyWith(color: HexColor(neutral900)),
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
                            textStyle: TFontRegular.caption2
                                .copyWith(color: HexColor(neutral900)),
                            labelAlignment: ChartDataLabelAlignment.outer,
                          ),
                          color: barColor ?? HexColor(primary500),
                        )
                ],
                legend: Legend(isVisible: false),
              ),
            ),
            SizedBox(height: 10),
            if (showLegends)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    color: barColor ?? HexColor(primary500),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "1",
                    style: TFontRegular.caption2
                        .copyWith(color: HexColor(neutral900)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
