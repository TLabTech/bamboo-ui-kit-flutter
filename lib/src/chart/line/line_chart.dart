import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/chart/line/legend_label.dart';
import 'package:flutter_bamboo_ui_kit/src/chart/line/line_chart_data.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TLineChart extends StatelessWidget {
  final String title;
  final List<List<LineChartData>> data;
  final List<LegendLabel>? legendLabels;
  final VoidCallback? optionTap;
  final bool showLegends;
  final bool showOption;
  final double? height;

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
            SizedBox(height: 10,),
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
            const SizedBox(height: 10),
            if (showLegends) legendLabels == null ? SizedBox() : _buildLegends()
          ],
        ),
      ),
    );
  }

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
