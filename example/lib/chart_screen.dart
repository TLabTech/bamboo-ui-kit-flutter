import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: THeader.nested(title: 'Chart Sample - nested header'),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TLineAreaChart(
              title: "Line Area",
              legendLabels: [
                LegendLabel(label: "Series 1", color: Colors.green),
                LegendLabel(label: "Series 2", color: Colors.blue),
                LegendLabel(label: "Series 3", color: Colors.red),
                LegendLabel(label: "Series 4", color: Colors.yellow),
                LegendLabel(label: "Series 5", color: Colors.black),
              ],
              data: [
                [
                  LineChartData(x: "A", y: 56, color: Colors.green),
                  LineChartData(x: "B", y: 64, color: Colors.green),
                  LineChartData(x: "C", y: 76, color: Colors.green),
                  LineChartData(x: "D", y: 78, color: Colors.green),
                  LineChartData(x: "E", y: 70, color: Colors.green),
                  LineChartData(x: "F", y: 37, color: Colors.green),
                ],
                [
                  LineChartData(x: "A", y: 39, color: Colors.blue),
                  LineChartData(x: "B", y: 64, color: Colors.blue),
                  LineChartData(x: "C", y: 80, color: Colors.blue),
                  LineChartData(x: "D", y: 17, color: Colors.blue),
                  LineChartData(x: "E", y: 15, color: Colors.blue),
                  LineChartData(x: "F", y: 15, color: Colors.blue),
                ],
                [
                  LineChartData(x: "A", y: 59, color: Colors.red),
                  LineChartData(x: "B", y: 45, color: Colors.red),
                  LineChartData(x: "C", y: 85, color: Colors.red),
                  LineChartData(x: "D", y: 88, color: Colors.red),
                  LineChartData(x: "E", y: 67, color: Colors.red),
                  LineChartData(x: "F", y: 97, color: Colors.red),
                ],
                [
                  LineChartData(x: "A", y: 89, color: Colors.yellow),
                  LineChartData(x: "B", y: 65, color: Colors.yellow),
                  LineChartData(x: "C", y: 15, color: Colors.yellow),
                  LineChartData(x: "D", y: 18, color: Colors.yellow),
                  LineChartData(x: "E", y: 47, color: Colors.yellow),
                  LineChartData(x: "F", y: 27, color: Colors.yellow),
                ],
                [
                  LineChartData(x: "A", y: 29, color: Colors.black),
                  LineChartData(x: "B", y: 15, color: Colors.black),
                  LineChartData(x: "C", y: 45, color: Colors.black),
                  LineChartData(x: "D", y: 22, color: Colors.black),
                  LineChartData(x: "E", y: 35, color: Colors.black),
                  LineChartData(x: "F", y: 89, color: Colors.black),
                ],
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TLineChart(
              title: "Line Chart",
              data: [
                [
                  LineChartData(x: "A", y: 56, color: Colors.green),
                  LineChartData(x: "B", y: 64, color: Colors.green),
                  LineChartData(x: "C", y: 76, color: Colors.green),
                  LineChartData(x: "D", y: 78, color: Colors.green),
                  LineChartData(x: "E", y: 70, color: Colors.green),
                  LineChartData(x: "F", y: 37, color: Colors.green),
                ],
                [
                  LineChartData(x: "A", y: 39, color: Colors.blue),
                  LineChartData(x: "B", y: 64, color: Colors.blue),
                  LineChartData(x: "C", y: 80, color: Colors.blue),
                  LineChartData(x: "D", y: 17, color: Colors.blue),
                  LineChartData(x: "E", y: 15, color: Colors.blue),
                  LineChartData(x: "F", y: 15, color: Colors.blue),
                ],
                [
                  LineChartData(x: "A", y: 59, color: Colors.red),
                  LineChartData(x: "B", y: 45, color: Colors.red),
                  LineChartData(x: "C", y: 85, color: Colors.red),
                  LineChartData(x: "D", y: 88, color: Colors.red),
                  LineChartData(x: "E", y: 67, color: Colors.red),
                  LineChartData(x: "F", y: 97, color: Colors.red),
                ]
              ],
              legendLabels: [
                LegendLabel(label: "Series 1", color: Colors.green),
                LegendLabel(label: "Series 2", color: Colors.blue),
                LegendLabel(label: "Series 3", color: Colors.red),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TBarChart(
              title: "Bar Chart",
              direction: Axis.horizontal,
              height: 300,
              data: [
                ChartData("A", 56),
                ChartData("B", 64),
                ChartData("C", 76),
                ChartData("D", 78),
                ChartData("E", 70),
                ChartData("F", 37),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TBarChart(
              title: "Bar Chart",
              direction: Axis.vertical,
              height: 300,
              data: [
                ChartData("A", 56),
                ChartData("B", 64),
                ChartData("C", 76),
                ChartData("D", 78),
                ChartData("E", 70),
                ChartData("F", 37),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TGroupBarChart(
              title: "Group bar",
              direction: Axis.horizontal,
              seriesList: [
                ChartSeriesData(
                  label: "Series 1",
                  color: Colors.greenAccent,
                  data: [
                    ChartData("A", 56),
                    ChartData("B", 64),
                    ChartData("C", 76),
                    ChartData("D", 78),
                    ChartData("E", 70),
                    ChartData("F", 37),
                  ],
                ),
                ChartSeriesData(
                  label: "Series 2",
                  color: Colors.blueAccent,
                  data: [
                    ChartData("A", 39),
                    ChartData("B", 80),
                    ChartData("C", 15),
                    ChartData("D", 17),
                    ChartData("E", 65),
                    ChartData("F", 15),
                  ],
                ),
                ChartSeriesData(
                  label: "Series 3",
                  color: Colors.orangeAccent,
                  data: [
                    ChartData("A", 45),
                    ChartData("B", 55),
                    ChartData("C", 60),
                    ChartData("D", 72),
                    ChartData("E", 68),
                    ChartData("F", 42),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TGroupBarChart(
              title: "Group bar",
              direction: Axis.vertical,
              seriesList: [
                ChartSeriesData(
                  label: "Series 1",
                  color: Colors.greenAccent,
                  data: [
                    ChartData("A", 56),
                    ChartData("B", 64),
                    ChartData("C", 76),
                    ChartData("D", 78),
                    ChartData("E", 70),
                    ChartData("F", 37),
                  ],
                ),
                ChartSeriesData(
                  label: "Series 2",
                  color: Colors.blueAccent,
                  data: [
                    ChartData("A", 39),
                    ChartData("B", 80),
                    ChartData("C", 15),
                    ChartData("D", 17),
                    ChartData("E", 65),
                    ChartData("F", 15),
                  ],
                ),
                ChartSeriesData(
                  label: "Series 3",
                  color: Colors.orangeAccent,
                  data: [
                    ChartData("A", 45),
                    ChartData("B", 55),
                    ChartData("C", 60),
                    ChartData("D", 72),
                    ChartData("E", 68),
                    ChartData("F", 42),
                  ],
                ),
                ChartSeriesData(
                  label: "Series 4",
                  color: Colors.red,
                  data: [
                    ChartData("A", 25),
                    ChartData("B", 45),
                    ChartData("C", 20),
                    ChartData("D", 62),
                    ChartData("E", 88),
                    ChartData("F", 32),
                  ],
                ),
                ChartSeriesData(
                  label: "Series 5",
                  color: Colors.black,
                  data: [
                    ChartData("A", 25),
                    ChartData("B", 45),
                    ChartData("C", 20),
                    ChartData("D", 62),
                    ChartData("E", 88),
                    ChartData("F", 32),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TPieChart(
              title: "Pie Chart",
              data: [
                PieChartData(label: "A", value: 80, color: Colors.green),
                PieChartData(label: "B", value: 41, color: Colors.blue),
                PieChartData(label: "C", value: 41, color: Colors.black),
                PieChartData(label: "D", value: 41, color: Colors.red),
                PieChartData(label: "E", value: 41, color: Colors.yellow),
              ],
              showLegends: true,
            ),
            SizedBox(
              height: 12,
            ),
            TDoughnutChart(
              title: "Donut Chart",
              data: [
                DoughnutChartData(label: "A", value: 41, color: Colors.green),
                DoughnutChartData(label: "B", value: 80, color: Colors.blue),
                DoughnutChartData(label: "C", value: 22, color: Colors.black),
                DoughnutChartData(label: "D", value: 65, color: Colors.red),
                DoughnutChartData(label: "E", value: 12, color: Colors.yellow),
              ],
              showLegends: true,
            ),
          ],
        ),
      ),
    );
  }
}
