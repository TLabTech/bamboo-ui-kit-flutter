import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Alert'),
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
                    label: 'Feedback',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Alert',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Default",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: TAlert(
                    title: 'Placeholder',
                    subtitle: "Description",
                  ),
                ),
              ),
              TAccordion(
                title: "Primary",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: TAlert.primary(
                    title: 'Placeholder',
                    subtitle: "Description",
                  ),
                ),
              ),
              TAccordion(
                title: "Destructive",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: TAlert.destructive(
                    title: 'Placeholder',
                    subtitle: "Description",
                  ),
                ),
              ),
              TAccordion(
                title: "Info",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: TAlert.info(
                    title: 'Placeholder',
                    subtitle: "Description",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
