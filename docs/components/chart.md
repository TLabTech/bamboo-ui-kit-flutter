# Chart

Overview
- A collection of chart widgets for visualizing data: line (area), line, bar, grouped bar, pie, and doughnut charts. Use these components to display time series, categorical comparisons, proportional distributions, and multi-series comparisons with consistent theming and legend support.

Features
- Line & line-area charts with multiple series and legend labels.
- Single-series bar chart (horizontal or vertical) with data labels.
- Grouped bar chart to compare multiple series side-by-side.
- Pie and doughnut charts with inside data labels and custom legend.
- Theme-aware styling via TThemeManager and TFont helpers.
- Optional options button and custom legend rendering.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage Example
```dart
TLineAreaChart(
   title: "Line Area",
   legendLabels: [
      LegendLabel(label: "Series 1", color: Colors.green),
      LegendLabel(label: "Series 2", color: Colors.blue),
      LegendLabel(label: "Series 3", color: Colors.red),
   ],
   data: [
     [
        LineChartData(x: "A", y: 56, color: Colors.green),
        LineChartData(x: "B", y: 64, color: Colors.green),
        LineChartData(x: "C", y: 76, color: Colors.green),
     ],
     [
        LineChartData(x: "A", y: 39, color: Colors.green),
        LineChartData(x: "B", y: 64, color: Colors.green),
        LineChartData(x: "C", y: 45, color: Colors.green),
     ],           
    ],
),
```

UI Preview

![Chart Preview](../assets/chart/chart_preview.gif)

## Variant

### Bar Chart
```dart
TBarChart(
  title: "Revenue",
  direction: Axis.horizontal,
  data: [
    ChartData("Q1", 40),
    ChartData("Q2", 60),
    ChartData("Q3", 80),
  ],
  barColor: Colors.teal,
  showOption: true,
  optionTap: () => print("Options tapped"),
);
```

### Line chart
```dart
TLineChart(
  title: "Monthly Sales",
  data: [
    [LineChartData(x: "Jan", y: 50, color: Colors.blue)],
    [LineChartData(x: "Jan", y: 30, color: Colors.green)],
  ],
  legendLabels: [
    LegendLabel(label: "Online", color: Colors.blue),
    LegendLabel(label: "Retail", color: Colors.green),
  ],
  showLegends: true,
  showOption: true,
  optionTap: () => print("Line chart options"),
);
```

### Pie chart
```dart
TPieChart(
  title: "Market Share",
  data: [
    PieChartData(label: "Product A", value: 45, color: Colors.blue, labelColor: Colors.white),
    PieChartData(label: "Product B", value: 30, color: Colors.orange, labelColor: Colors.white),
    PieChartData(label: "Product C", value: 25, color: Colors.grey, labelColor: Colors.white),
  ],
  showLegends: true,
);
```

### Grouped bar chart
```dart
TGroupBarChart(
  title: "Segment Comparison",
  seriesList: [
    ChartSeriesData(
      label: "S1",
      color: Colors.redAccent,
      data: [ChartData("A", 20), ChartData("B", 40)],
    ),
    ChartSeriesData(
      label: "S2",
      color: Colors.blueAccent,
      data: [ChartData("A", 30), ChartData("B", 50)],
    ),
  ],
  direction: Axis.vertical,
  height: 220,
  showLegends: false,
);
```