import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineChartScreen extends StatefulWidget {
  const LineChartScreen({super.key});

  @override
  State<LineChartScreen> createState() => _LineChartScreenState();
}

class _LineChartScreenState extends State<LineChartScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = context.read<TThemeManager>().state;
    final isDarkMode = theme == context.read<TThemeManager>().darkTheme;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: THeader.nested(title: 'Line', enableCenterTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBreadcrumbs(
                items: [
                  TBreadcrumbItem(
                    onTap: () {},
                    icon: SvgPicture.asset(Assets.svg.home),
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Chart',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Line',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Line 1 Data",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineChart(
                  title: "Line Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                    ],
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                  ],
                ),
              ),
              TAccordion(
                title: "Line 2 Data",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineChart(
                  title: "Line Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 39, color: HexColor(secondary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(secondary500)),
                      LineChartData(x: "C", y: 80, color: HexColor(secondary500)),
                      LineChartData(x: "D", y: 17, color: HexColor(secondary500)),
                      LineChartData(x: "E", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "F", y: 15, color: HexColor(secondary500)),
                    ],
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                    LegendLabel(label: "2", color: HexColor(secondary500)),
                  ],
                ),
              ),
              TAccordion(
                title: "Line 3 Data",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineChart(
                  title: "Line Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 39, color: HexColor(secondary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(secondary500)),
                      LineChartData(x: "C", y: 80, color: HexColor(secondary500)),
                      LineChartData(x: "D", y: 17, color: HexColor(secondary500)),
                      LineChartData(x: "E", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "F", y: 15, color: HexColor(secondary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 59, color: HexColor(red500)),
                      LineChartData(x: "B", y: 45, color: HexColor(red500)),
                      LineChartData(x: "C", y: 85, color: HexColor(red500)),
                      LineChartData(x: "D", y: 88, color: HexColor(red500)),
                      LineChartData(x: "E", y: 67, color: HexColor(red500)),
                      LineChartData(x: "F", y: 97, color: HexColor(red500)),
                    ]
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                    LegendLabel(label: "2", color: HexColor(secondary500)),
                    LegendLabel(label: "3", color: HexColor(red500)),
                  ],
                ),
              ),
              TAccordion(
                title: "Line 4 Data",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineChart(
                  title: "Line Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                      LineChartData(x: "G", y: 85, color: HexColor(primary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 39, color: HexColor(secondary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(secondary500)),
                      LineChartData(x: "C", y: 80, color: HexColor(secondary500)),
                      LineChartData(x: "D", y: 17, color: HexColor(secondary500)),
                      LineChartData(x: "E", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "F", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "G", y: 45, color: HexColor(secondary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 59, color: HexColor(red500)),
                      LineChartData(x: "B", y: 45, color: HexColor(red500)),
                      LineChartData(x: "C", y: 85, color: HexColor(red500)),
                      LineChartData(x: "D", y: 88, color: HexColor(red500)),
                      LineChartData(x: "E", y: 67, color: HexColor(red500)),
                      LineChartData(x: "F", y: 97, color: HexColor(red500)),
                      LineChartData(x: "G", y: 92, color: HexColor(red500)),
                    ],
                    [
                      LineChartData(x: "A", y: 59, color: HexColor(yellow500)),
                      LineChartData(x: "B", y: 45, color: HexColor(yellow500)),
                      LineChartData(x: "C", y: 85, color: HexColor(yellow500)),
                      LineChartData(x: "D", y: 88, color: HexColor(yellow500)),
                      LineChartData(x: "E", y: 67, color: HexColor(yellow500)),
                      LineChartData(x: "F", y: 97, color: HexColor(yellow500)),
                      LineChartData(x: "G", y: 15, color: HexColor(yellow500)),
                    ]
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                    LegendLabel(label: "2", color: HexColor(secondary500)),
                    LegendLabel(label: "3", color: HexColor(red500)),
                    LegendLabel(label: "4", color: HexColor(yellow500)),
                  ],
                ),
              ),
              TAccordion(
                title: "Line 5 Data",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineChart(
                  title: "Line Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                      LineChartData(x: "G", y: 85, color: HexColor(primary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 39, color: HexColor(secondary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(secondary500)),
                      LineChartData(x: "C", y: 80, color: HexColor(secondary500)),
                      LineChartData(x: "D", y: 17, color: HexColor(secondary500)),
                      LineChartData(x: "E", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "F", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "G", y: 45, color: HexColor(secondary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 15, color: HexColor(red500)),
                      LineChartData(x: "B", y: 33, color: HexColor(red500)),
                      LineChartData(x: "C", y: 90, color: HexColor(red500)),
                      LineChartData(x: "D", y: 77, color: HexColor(red500)),
                      LineChartData(x: "E", y: 67, color: HexColor(red500)),
                      LineChartData(x: "F", y: 97, color: HexColor(red500)),
                      LineChartData(x: "G", y: 92, color: HexColor(red500)),
                    ],
                    [
                      LineChartData(x: "A", y: 59, color: HexColor(yellow500)),
                      LineChartData(x: "B", y: 45, color: HexColor(yellow500)),
                      LineChartData(x: "C", y: 85, color: HexColor(yellow500)),
                      LineChartData(x: "D", y: 88, color: HexColor(yellow500)),
                      LineChartData(x: "E", y: 67, color: HexColor(yellow500)),
                      LineChartData(x: "F", y: 97, color: HexColor(yellow500)),
                      LineChartData(x: "G", y: 15, color: HexColor(yellow500)),
                    ],
                    [
                      LineChartData(x: "A", y: 44, color: HexColor(gray500)),
                      LineChartData(x: "B", y: 23, color: HexColor(gray500)),
                      LineChartData(x: "C", y: 65, color: HexColor(gray500)),
                      LineChartData(x: "D", y: 34, color: HexColor(gray500)),
                      LineChartData(x: "E", y: 12, color: HexColor(gray500)),
                      LineChartData(x: "F", y: 66, color: HexColor(gray500)),
                      LineChartData(x: "G", y: 74, color: HexColor(gray500)),
                    ]
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                    LegendLabel(label: "2", color: HexColor(secondary500)),
                    LegendLabel(label: "3", color: HexColor(red500)),
                    LegendLabel(label: "4", color: HexColor(yellow500)),
                    LegendLabel(label: "5", color: HexColor(gray500)),
                  ],
                ),
              ),
              TAccordion(
                title: "Line 1 Data With Background",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineAreaChart(
                  title: "Tittle Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                    ],
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                  ],
                ),
              ),
              TAccordion(
                title: "Line 2 Data With Background",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineAreaChart(
                  title: "Tittle Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 39, color: HexColor(secondary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(secondary500)),
                      LineChartData(x: "C", y: 80, color: HexColor(secondary500)),
                      LineChartData(x: "D", y: 17, color: HexColor(secondary500)),
                      LineChartData(x: "E", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "F", y: 15, color: HexColor(secondary500)),
                    ],
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                    LegendLabel(label: "2", color: HexColor(secondary500)),
                  ],
                ),
              ),
              TAccordion(
                title: "Line 3 Data With Background",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineAreaChart(
                  title: "Tittle Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 39, color: HexColor(secondary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(secondary500)),
                      LineChartData(x: "C", y: 80, color: HexColor(secondary500)),
                      LineChartData(x: "D", y: 17, color: HexColor(secondary500)),
                      LineChartData(x: "E", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "F", y: 15, color: HexColor(secondary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 59, color: HexColor(red500)),
                      LineChartData(x: "B", y: 45, color: HexColor(red500)),
                      LineChartData(x: "C", y: 85, color: HexColor(red500)),
                      LineChartData(x: "D", y: 88, color: HexColor(red500)),
                      LineChartData(x: "E", y: 67, color: HexColor(red500)),
                      LineChartData(x: "F", y: 97, color: HexColor(red500)),
                    ]
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                    LegendLabel(label: "2", color: HexColor(secondary500)),
                    LegendLabel(label: "3", color: HexColor(red500)),
                  ],
                ),
              ),
              TAccordion(
                title: "Line 4 Data With Background",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineAreaChart(
                  title: "Line Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                      LineChartData(x: "G", y: 85, color: HexColor(primary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 39, color: HexColor(secondary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(secondary500)),
                      LineChartData(x: "C", y: 80, color: HexColor(secondary500)),
                      LineChartData(x: "D", y: 17, color: HexColor(secondary500)),
                      LineChartData(x: "E", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "F", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "G", y: 45, color: HexColor(secondary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 59, color: HexColor(red500)),
                      LineChartData(x: "B", y: 45, color: HexColor(red500)),
                      LineChartData(x: "C", y: 85, color: HexColor(red500)),
                      LineChartData(x: "D", y: 88, color: HexColor(red500)),
                      LineChartData(x: "E", y: 67, color: HexColor(red500)),
                      LineChartData(x: "F", y: 97, color: HexColor(red500)),
                      LineChartData(x: "G", y: 92, color: HexColor(red500)),
                    ],
                    [
                      LineChartData(x: "A", y: 89, color: HexColor(yellow500)),
                      LineChartData(x: "B", y: 33, color: HexColor(yellow500)),
                      LineChartData(x: "C", y: 12, color: HexColor(yellow500)),
                      LineChartData(x: "D", y: 33, color: HexColor(yellow500)),
                      LineChartData(x: "E", y: 89, color: HexColor(yellow500)),
                      LineChartData(x: "F", y: 43, color: HexColor(yellow500)),
                      LineChartData(x: "G", y: 15, color: HexColor(yellow500)),
                    ]
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                    LegendLabel(label: "2", color: HexColor(secondary500)),
                    LegendLabel(label: "3", color: HexColor(red500)),
                    LegendLabel(label: "4", color: HexColor(yellow500)),
                  ],
                ),
              ),
              TAccordion(
                title: "Line 5 Data With Background",
                titleStyle: TFontBold.headline(context),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(
                  Assets.svg.chevronDown,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                child: TLineAreaChart(
                  title: "Line Chart",
                  data: [
                    [
                      LineChartData(x: "A", y: 56, color: HexColor(primary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(primary500)),
                      LineChartData(x: "C", y: 76, color: HexColor(primary500)),
                      LineChartData(x: "D", y: 78, color: HexColor(primary500)),
                      LineChartData(x: "E", y: 70, color: HexColor(primary500)),
                      LineChartData(x: "F", y: 37, color: HexColor(primary500)),
                      LineChartData(x: "G", y: 85, color: HexColor(primary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 39, color: HexColor(secondary500)),
                      LineChartData(x: "B", y: 64, color: HexColor(secondary500)),
                      LineChartData(x: "C", y: 80, color: HexColor(secondary500)),
                      LineChartData(x: "D", y: 17, color: HexColor(secondary500)),
                      LineChartData(x: "E", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "F", y: 15, color: HexColor(secondary500)),
                      LineChartData(x: "G", y: 45, color: HexColor(secondary500)),
                    ],
                    [
                      LineChartData(x: "A", y: 59, color: HexColor(red500)),
                      LineChartData(x: "B", y: 45, color: HexColor(red500)),
                      LineChartData(x: "C", y: 85, color: HexColor(red500)),
                      LineChartData(x: "D", y: 88, color: HexColor(red500)),
                      LineChartData(x: "E", y: 67, color: HexColor(red500)),
                      LineChartData(x: "F", y: 97, color: HexColor(red500)),
                      LineChartData(x: "G", y: 92, color: HexColor(red500)),
                    ],
                    [
                      LineChartData(x: "A", y: 89, color: HexColor(yellow500)),
                      LineChartData(x: "B", y: 33, color: HexColor(yellow500)),
                      LineChartData(x: "C", y: 12, color: HexColor(yellow500)),
                      LineChartData(x: "D", y: 33, color: HexColor(yellow500)),
                      LineChartData(x: "E", y: 89, color: HexColor(yellow500)),
                      LineChartData(x: "F", y: 43, color: HexColor(yellow500)),
                      LineChartData(x: "G", y: 15, color: HexColor(yellow500)),
                    ],
                    [
                      LineChartData(x: "A", y: 41, color: HexColor(yellow500)),
                      LineChartData(x: "B", y: 12, color: HexColor(yellow500)),
                      LineChartData(x: "C", y: 42, color: HexColor(yellow500)),
                      LineChartData(x: "D", y: 65, color: HexColor(yellow500)),
                      LineChartData(x: "E", y: 67, color: HexColor(yellow500)),
                      LineChartData(x: "F", y: 34, color: HexColor(yellow500)),
                      LineChartData(x: "G", y: 51, color: HexColor(yellow500)),
                    ]
                  ],
                  legendLabels: [
                    LegendLabel(label: "1", color: HexColor(primary500)),
                    LegendLabel(label: "2", color: HexColor(secondary500)),
                    LegendLabel(label: "3", color: HexColor(red500)),
                    LegendLabel(label: "4", color: HexColor(yellow500)),
                    LegendLabel(label: "5", color: HexColor(gray500)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
