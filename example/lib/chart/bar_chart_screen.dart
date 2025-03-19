import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarChartScreen extends StatefulWidget {
  const BarChartScreen({super.key});

  @override
  State<BarChartScreen> createState() => _BarChartScreenState();
}

class _BarChartScreenState extends State<BarChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Bar', enableCenterTitle: true,),
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
                    label: 'Bar',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Bar 1 Data Horizontal",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TBarChart(
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
              ),
              TAccordion(
                title: "Bar 2 Data Horizontal",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TGroupBarChart(
                  title: "Group bar",
                  direction: Axis.horizontal,
                  seriesList: [
                    ChartSeriesData(
                      label: "1",
                      color: HexColor(primary500),
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
                      label: "2",
                      color: HexColor(secondary500),
                      data: [
                        ChartData("A", 39),
                        ChartData("B", 80),
                        ChartData("C", 15),
                        ChartData("D", 17),
                        ChartData("E", 65),
                        ChartData("F", 15),
                      ],
                    ),
                  ],
                ),
              ),
              TAccordion(
                title: "Bar 3 Data Horizontal",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TGroupBarChart(
                  title: "Group bar",
                  direction: Axis.horizontal,
                  seriesList: [
                    ChartSeriesData(
                      label: "1",
                      color: HexColor(primary500),
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
                      label: "2",
                      color: HexColor(secondary500),
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
                      label: "3",
                      color: HexColor(danger500),
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
              ),
              TAccordion(
                title: "Bar 4 Data Horizontal",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TGroupBarChart(
                  title: "Group bar",
                  direction: Axis.horizontal,
                  seriesList: [
                    ChartSeriesData(
                      label: "1",
                      color: HexColor(primary500),
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
                      label: "2",
                      color: HexColor(secondary500),
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
                      label: "3",
                      color: HexColor(danger500),
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
                      label: "4",
                      color: HexColor(warning500),
                      data: [
                        ChartData("A", 56),
                        ChartData("B", 11),
                        ChartData("C", 37),
                        ChartData("D", 54),
                        ChartData("E", 87),
                        ChartData("F", 15),
                      ],
                    ),
                  ],
                ),
              ),
              TAccordion(
                title: "Bar 5 Data Horizontal",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TGroupBarChart(
                  title: "Group bar",
                  direction: Axis.horizontal,
                  seriesList: [
                    ChartSeriesData(
                      label: "1",
                      color: HexColor(primary500),
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
                      label: "2",
                      color: HexColor(secondary500),
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
                      label: "3",
                      color: HexColor(danger500),
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
                      label: "4",
                      color: HexColor(warning500),
                      data: [
                        ChartData("A", 56),
                        ChartData("B", 11),
                        ChartData("C", 37),
                        ChartData("D", 54),
                        ChartData("E", 87),
                        ChartData("F", 15),
                      ],
                    ),
                    ChartSeriesData(
                      label: "5",
                      color: HexColor(neutral500),
                      data: [
                        ChartData("A", 35),
                        ChartData("B", 26),
                        ChartData("C", 11),
                        ChartData("D", 37),
                        ChartData("E", 54),
                        ChartData("F", 39),
                      ],
                    ),
                  ],
                ),
              ),
              TAccordion(
                title: "Bar 1 Data Vertical",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TBarChart(
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
              ),
              TAccordion(
                title: "Bar 2 Data Vertical",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TGroupBarChart(
                  title: "Group bar",
                  direction: Axis.vertical,
                  seriesList: [
                    ChartSeriesData(
                      label: "1",
                      color: HexColor(primary500),
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
                      label: "2",
                      color: HexColor(secondary500),
                      data: [
                        ChartData("A", 39),
                        ChartData("B", 80),
                        ChartData("C", 15),
                        ChartData("D", 17),
                        ChartData("E", 65),
                        ChartData("F", 15),
                      ],
                    ),
                  ],
                ),
              ),
              TAccordion(
                title: "Bar 3 Data Vertical",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TGroupBarChart(
                  title: "Group bar",
                  direction: Axis.vertical,
                  seriesList: [
                    ChartSeriesData(
                      label: "1",
                      color: HexColor(primary500),
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
                      label: "2",
                      color: HexColor(secondary500),
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
                      label: "3",
                      color: HexColor(danger500),
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
              ),
              TAccordion(
                title: "Bar 4 Data Vertical",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TGroupBarChart(
                  title: "Group bar",
                  direction: Axis.vertical,
                  seriesList: [
                    ChartSeriesData(
                      label: "1",
                      color: HexColor(primary500),
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
                      label: "2",
                      color: HexColor(secondary500),
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
                      label: "3",
                      color: HexColor(danger500),
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
                      label: "4",
                      color: HexColor(warning500),
                      data: [
                        ChartData("A", 56),
                        ChartData("B", 11),
                        ChartData("C", 37),
                        ChartData("D", 54),
                        ChartData("E", 87),
                        ChartData("F", 15),
                      ],
                    ),
                  ],
                ),
              ),
              TAccordion(
                title: "Bar 5 Data Vertical",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TGroupBarChart(
                  title: "Group bar",
                  direction: Axis.vertical,
                  seriesList: [
                    ChartSeriesData(
                      label: "1",
                      color: HexColor(primary500),
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
                      label: "2",
                      color: HexColor(secondary500),
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
                      label: "3",
                      color: HexColor(danger500),
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
                      label: "4",
                      color: HexColor(warning500),
                      data: [
                        ChartData("A", 56),
                        ChartData("B", 11),
                        ChartData("C", 37),
                        ChartData("D", 54),
                        ChartData("E", 87),
                        ChartData("F", 15),
                      ],
                    ),
                    ChartSeriesData(
                      label: "5",
                      color: HexColor(neutral500),
                      data: [
                        ChartData("A", 35),
                        ChartData("B", 26),
                        ChartData("C", 11),
                        ChartData("D", 37),
                        ChartData("E", 54),
                        ChartData("F", 39),
                      ],
                    ),
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
