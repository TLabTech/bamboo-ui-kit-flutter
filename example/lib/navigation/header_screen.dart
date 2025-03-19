import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderScreen extends StatefulWidget {
  const HeaderScreen({super.key});

  @override
  State<HeaderScreen> createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(
        title: 'Header',
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
                    label: 'Navigation',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Header',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Tittle",
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
                  child: THeader(
                    title: "Placeholder",
                    suffixAction: [
                      THeaderAction(
                        icon: SvgPicture.asset(
                          Assets.svg.magnifyingGlass,
                          width: 18,
                          height: 18,
                        ),
                        onPress: () {},
                      ),
                      THeaderAction(
                        icon: Icon(Icons.more_horiz_rounded),
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Homepage",
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
                  child: THeader.homepage(
                    title: "Placeholder",
                    subtitle: "description",
                    prefixAction:  TAvatar(
                      imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                      predefinedSize: AvatarSize.large,
                      type: AvatarType.general,
                      shape: AvatarShape.circle,
                    ),
                    suffixAction: [
                      THeaderAction(
                        icon: Icon(Icons.more_horiz_rounded),
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Nested",
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
                  child: THeader.nested(
                    title: "Placeholder",
                    enableCenterTitle: true,
                    suffixAction: [
                      THeaderAction(
                        icon: Icon(Icons.more_horiz_rounded),
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Search",
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
                  child: THeader.search(
                    hintText: 'Placeholder',
                  ),
                ),
              ),
              TAccordion(
                title: "Brand",
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
                  child: THeader.brand(
                    icon: SvgPicture.asset(Assets.svg.logo),
                    backgroundColor: Colors.white,
                    suffixAction: [
                      THeaderAction(
                        icon: TAvatar(
                          imageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
                          shape: AvatarShape.circle,
                          size: 40,
                          backgroundColor: Colors.grey.shade100,
                        ),
                        onPress: () {},
                      ),
                      THeaderAction(
                        icon: TAvatar(
                          icon: Icon(
                            Icons.more_horiz_rounded,
                          ),
                          shape: AvatarShape.circle,
                          size: 40,
                          backgroundColor: Colors.grey.shade100,
                        ),
                        onPress: () {},
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
