import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';
import 'package:flutter_bamboo_ui_kit/widgets/charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TLineAreaChart extends StatelessWidget {
  final String title;
  final List<List<LineChartData>> data;
  final List<LegendLabel>? legendLabels;
  final VoidCallback? optionTap;
  final bool showLegends;
  final bool showOption;
  final double height;

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
                    child: Icon(Icons.more_horiz),
                  ),
              ],
            ),
            SizedBox(height: 10,),
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
            const SizedBox(height: 10),
            if (showLegends) legendLabels == null ? SizedBox() : _buildLegends()
          ],
        ),
      ),
    );
  }

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
