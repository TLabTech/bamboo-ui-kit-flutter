import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PieChartScreen extends StatefulWidget {
  const PieChartScreen({super.key});

  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(gray050),
      appBar: THeader.nested(
        title: 'Pie',
        enableCenterTitle: true,
      ),
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
                    label: 'Pie',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Pie 2 Data",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TPieChart(
                  title: "Pie Chart",
                  data: [
                    PieChartData(
                      label: "A",
                      value: 80,
                      color: HexColor(primary500),
                    ),
                    PieChartData(
                      label: "B",
                      value: 41,
                      color: HexColor(secondary500),
                    ),
                  ],
                  showLegends: true,
                ),
              ),
              TAccordion(
                title: "Pie 3 Data",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TPieChart(
                  title: "Pie Chart",
                  data: [
                    PieChartData(
                      label: "A",
                      value: 80,
                      color: HexColor(primary500),
                    ),
                    PieChartData(
                      label: "B",
                      value: 41,
                      color: HexColor(secondary500),
                    ),
                    PieChartData(
                      label: "C",
                      value: 10,
                      color: HexColor(red500),
                    ),
                  ],
                  showLegends: true,
                ),
              ),
              TAccordion(
                title: "Pie 4 Data",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TPieChart(
                  title: "Pie Chart",
                  data: [
                    PieChartData(
                      label: "A",
                      value: 80,
                      color: HexColor(primary500),
                    ),
                    PieChartData(
                      label: "B",
                      value: 41,
                      color: HexColor(secondary500),
                    ),
                    PieChartData(
                      label: "C",
                      value: 41,
                      color: HexColor(red500),
                    ),
                    PieChartData(
                      label: "D",
                      value: 28,
                      color: HexColor(yellow500),
                    ),
                  ],
                  showLegends: true,
                ),
              ),
              TAccordion(
                title: "Pie 5 Data",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TPieChart(
                  title: "Pie Chart",
                  data: [
                    PieChartData(
                      label: "A",
                      value: 80,
                      color: HexColor(primary500),
                    ),
                    PieChartData(
                      label: "B",
                      value: 41,
                      color: HexColor(secondary500),
                    ),
                    PieChartData(
                      label: "C",
                      value: 41,
                      color: HexColor(red500),
                    ),
                    PieChartData(
                      label: "D",
                      value: 28,
                      color: HexColor(yellow500),
                    ),
                    PieChartData(
                      label: "E",
                      value: 25,
                      labelColor: HexColor(gray500),
                      valueColor: HexColor(gray500),
                      color: HexColor(gray500),
                    ),
                  ],
                  showLegends: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
