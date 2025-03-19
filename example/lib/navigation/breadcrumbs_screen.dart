import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreadcrumbsScreen extends StatefulWidget {
  const BreadcrumbsScreen({super.key});

  @override
  State<BreadcrumbsScreen> createState() => _BreadcrumbsScreenState();
}

class _BreadcrumbsScreenState extends State<BreadcrumbsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Breadcrumbs', enableCenterTitle: true,),
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
                    label: 'Navigation',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Breadcrumbs',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "1 Page",
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
                  child: TBreadcrumbs(
                    items: [
                      TBreadcrumbItem(
                        onTap: () {},
                        icon: SvgPicture.asset(Assets.svg.home),
                      ),
                      TBreadcrumbItem(
                        onTap: () {},
                        label: 'Breadcrumb',
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "2 Page",
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
                  child: TBreadcrumbs(
                    items: [
                      TBreadcrumbItem(
                        onTap: () {},
                        icon: SvgPicture.asset(Assets.svg.home),
                      ),
                      TBreadcrumbItem(
                        onTap: () {},
                        label: 'Breadcrumb',
                      ),
                      TBreadcrumbItem(
                        onTap: () {},
                        label: 'Breadcrumb',
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "More than 2 Page",
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
                  child: TBreadcrumbs(
                    maxVisibleItems: 4,
                    items: [
                      TBreadcrumbItem(
                        onTap: () {},
                        icon: SvgPicture.asset(Assets.svg.home),
                      ),
                      TBreadcrumbItem(
                        onTap: () {},
                        label: 'Breadcrumb',
                      ),
                      TBreadcrumbItem(
                        onTap: () {},
                        label: 'Breadcrumb',
                      ),
                      TBreadcrumbItem(
                        onTap: () {},
                        label: 'Breadcrumb',
                      ),
                      TBreadcrumbItem(
                        onTap: () {},
                        label: 'Breadcrumb',
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
