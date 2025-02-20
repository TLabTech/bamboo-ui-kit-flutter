import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/hex_color.dart';
import 'package:flutter_bamboo_ui_kit/src/fondation/tfont.dart';

class TBarChart extends StatelessWidget {
  final String title;
  final List<BarChartGroupData> barGroups;
  final VoidCallback? optionTap;
  final List<String> bottomTitles;
  final bool showLeftTitles;
  final bool showBottomTitles;
  final bool showLegends;
  final bool showOption;
  final double maxY;

  const TBarChart({
    super.key,
    required this.title,
    required this.barGroups,
    required this.bottomTitles,
    this.optionTap,
    this.showLeftTitles = true,
    this.showBottomTitles = true,
    this.showLegends = true,
    this.showOption = true,
    this.maxY = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: HexColor(neutral050),
        border: Border.all(color: HexColor(neutral050), width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
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
            SizedBox(height: 10),
            // Bar Chart
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: maxY,
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (group) => Colors.transparent,
                      tooltipPadding: EdgeInsets.zero,
                      tooltipMargin: 8,
                      getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                      ) {
                        return BarTooltipItem(
                          rod.toY.round().toString(),
                          TFontRegular.caption2
                              .copyWith(color: HexColor(neutral900)),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: showLeftTitles,
                        reservedSize: 40,
                        interval: 20,
                        getTitlesWidget: (value, meta) => Text(
                          value.toInt().toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: showBottomTitles,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            bottomTitles[value.toInt()],
                            style: TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: true, drawVerticalLine: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  barGroups: barGroups,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Legends
            if (showLegends)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 12, height: 12, color: HexColor(primary500)),
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
