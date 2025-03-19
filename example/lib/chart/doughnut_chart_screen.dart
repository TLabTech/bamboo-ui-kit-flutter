import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoughnutChartScreen extends StatefulWidget {
  const DoughnutChartScreen({super.key});

  @override
  State<DoughnutChartScreen> createState() => _DoughnutChartScreenState();
}

class _DoughnutChartScreenState extends State<DoughnutChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(
        title: 'Donut',
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
                    label: 'Donut',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Donut 2 Data",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TDoughnutChart(
                  title: "Donut Chart",
                  data: [
                    DoughnutChartData(
                      label: "A",
                      value: 41,
                      color: HexColor(primary500),
                    ),
                    DoughnutChartData(
                      label: "B",
                      value: 80,
                      color: HexColor(secondary500),
                    ),
                  ],
                  showLegends: true,
                ),
              ),
              TAccordion(
                title: "Donut 3 Data",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TDoughnutChart(
                  title: "Donut Chart",
                  data: [
                    DoughnutChartData(
                      label: "A",
                      value: 41,
                      color: HexColor(primary500),
                    ),
                    DoughnutChartData(
                      label: "B",
                      value: 80,
                      color: HexColor(secondary500),
                    ),
                    DoughnutChartData(
                      label: "C",
                      value: 22,
                      color: HexColor(danger500),
                    ),
                  ],
                  showLegends: true,
                ),
              ),
              TAccordion(
                title: "Donut 4 Data",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TDoughnutChart(
                  title: "Donut Chart",
                  data: [
                    DoughnutChartData(
                      label: "A",
                      value: 41,
                      color: HexColor(primary500),
                    ),
                    DoughnutChartData(
                      label: "B",
                      value: 80,
                      color: HexColor(secondary500),
                    ),
                    DoughnutChartData(
                      label: "C",
                      value: 22,
                      color: HexColor(danger500),
                    ),
                    DoughnutChartData(
                      label: "D",
                      value: 65,
                      color: HexColor(warning500),
                    ),
                  ],
                  showLegends: true,
                ),
              ),
              TAccordion(
                title: "Donut 5 Data",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: TDoughnutChart(
                  title: "Donut Chart",
                  data: [
                    DoughnutChartData(
                      label: "A",
                      value: 41,
                      color: HexColor(primary500),
                    ),
                    DoughnutChartData(
                      label: "B",
                      value: 80,
                      color: HexColor(secondary500),
                    ),
                    DoughnutChartData(
                      label: "C",
                      value: 22,
                      color: HexColor(danger500),
                    ),
                    DoughnutChartData(
                      label: "D",
                      value: 65,
                      color: HexColor(warning500),
                    ),
                    DoughnutChartData(
                      label: "E",
                      value: 12,
                      color: HexColor(neutral500),
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
