import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccordionScreen extends StatefulWidget {
  const AccordionScreen({super.key});

  @override
  State<AccordionScreen> createState() => _AccordionScreenState();
}

class _AccordionScreenState extends State<AccordionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Accordion', enableCenterTitle: true,),
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
                    label: 'Data Presentation',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Accordion',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Default",
                titleStyle: TFontBold.headline(context).copyWith(
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
                  child: Column(
                    spacing: 8,
                    children: [
                      TAccordion(
                        title: "Lorem ipsum dolor sit amet",
                        initiallyExpanded: true,
                        trailing: SvgPicture.asset(Assets.svg.chevronDown),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                          style: TFontRegular.footNote(context).copyWith(
                            color: HexColor(neutral500),
                          ),
                        ),
                      ),
                      TAccordion(
                        title: "Lorem ipsum dolor sit amet",
                        initiallyExpanded: true,
                        trailing: SvgPicture.asset(Assets.svg.chevronDown),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                          style: TFontRegular.footNote(context).copyWith(
                            color: HexColor(neutral500),
                          ),
                        ),
                      ),
                      TAccordion(
                        title: "Lorem ipsum dolor sit amet",
                        initiallyExpanded: true,
                        trailing: SvgPicture.asset(Assets.svg.chevronDown),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                          style: TFontRegular.footNote(context).copyWith(
                            color: HexColor(neutral500),
                          ),
                        ),
                      ),
                      TAccordion(
                        title: "Lorem ipsum dolor sit amet",
                        initiallyExpanded: true,
                        trailing: SvgPicture.asset(Assets.svg.chevronDown),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                          style: TFontRegular.footNote(context).copyWith(
                            color: HexColor(neutral500),
                          ),
                        ),
                      ),
                      TAccordion(
                        title: "Lorem ipsum dolor sit amet",
                        initiallyExpanded: true,
                        trailing: SvgPicture.asset(Assets.svg.chevronDown),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                          style: TFontRegular.footNote(context).copyWith(
                            color: HexColor(neutral500),
                          ),
                        ),
                      ),
                    ],
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
