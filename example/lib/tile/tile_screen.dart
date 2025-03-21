import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TileScreen extends StatefulWidget {
  const TileScreen({super.key});

  @override
  State<TileScreen> createState() => _TileScreenState();
}

class _TileScreenState extends State<TileScreen> {
  String? wifiSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(gray050),
      appBar: THeader.nested(title: 'Tile', enableCenterTitle: true,),
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
                    label: 'Tile',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Tile',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "UnTappable",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
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
                      color: HexColor(gray300),
                    ),
                  ),
                  child: TTile<String>(
                    title: "Personalization",
                    prefixIcon: SvgPicture.asset(Assets.svg.user),
                    suffixIcon: SvgPicture.asset(Assets.svg.chevronRight),
                  ),
                ),
              ),
              TAccordion(
                title: "Disabled",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
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
                      color: HexColor(gray300),
                    ),
                  ),
                  child: TTile<String>(
                    title: "Personalization",
                    prefixIcon: SvgPicture.asset(
                      Assets.svg.user,
                      colorFilter: ColorFilter.mode(
                        HexColor(gray500),
                        BlendMode.srcIn,
                      ),
                    ),
                    suffixIcon: SvgPicture.asset(
                      Assets.svg.chevronRight,
                      colorFilter: ColorFilter.mode(
                        HexColor(gray500),
                        BlendMode.srcIn,
                      ),
                    ),
                    enable: false,
                  ),
                ),
              ),
              TAccordion(
                title: "With Subtitle",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
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
                      color: HexColor(gray300),
                    ),
                  ),
                  child: TTile<String>(
                    title: "Notifications",
                    subtitle: "Banner, sound, badges",
                    prefixIcon: SvgPicture.asset(
                      Assets.svg.bell,
                    ),
                    suffixIcon: SvgPicture.asset(
                      Assets.svg.chevronRight,
                    ),
                  ),
                ),
              ),
              TAccordion(
                title: "With Details",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
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
                      color: HexColor(gray300),
                    ),
                  ),
                  child: TTile<String>(
                    title: "Wifi",
                    detail: "Forus labs (5G)",
                    prefixIcon: SvgPicture.asset(
                      Assets.svg.wifi,
                    ),
                    suffixIcon: SvgPicture.asset(
                      Assets.svg.chevronRight,
                    ),
                  ),
                ),
              ),
              TAccordion(
                title: "With Radio",
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
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
                      color: HexColor(gray300),
                    ),
                  ),
                  child: TTile<String>(
                    title: "Wifi",
                    prefixIcon: SvgPicture.asset(
                      Assets.svg.wifi,
                    ),
                    value: "wifi",
                    groupValue: wifiSelected,
                    onChanged: (value) {
                      setState(() {
                        if (wifiSelected == value) {
                          wifiSelected = null;
                        } else {
                          wifiSelected = value;
                        }
                      });
                    },
                    showRadio: true,
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
