import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderScreen extends StatefulWidget {
  const HeaderScreen({super.key});

  @override
  State<HeaderScreen> createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = context.read<TThemeManager>().state;
    final isDarkMode = theme == context.read<TThemeManager>().darkTheme;

    return Scaffold(
      backgroundColor: theme.background,
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  child: SizedBox(
                    height: 80,
                    child: THeader(
                      title: "Placeholder",
                      suffixAction: [
                        THeaderAction(
                          icon: SvgPicture.asset(
                            Assets.svg.magnifyingGlass,
                            width: 18,
                            height: 18,
                            colorFilter: ColorFilter.mode(
                              isDarkMode ? Colors.white : Colors.black,
                              BlendMode.srcIn,
                            ),
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
              ),
              TAccordion(
                title: "Homepage",
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  child: SizedBox(
                    height: 80,
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
              ),
              TAccordion(
                title: "Nested",
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  child: SizedBox(
                    height: 80,
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
              ),
              TAccordion(
                title: "Search",
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  child: SizedBox(
                    height: 80,
                    child: THeader.search(
                      hintText: 'Placeholder',
                      iconColor: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              TAccordion(
                title: "Brand",
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  child: SizedBox(
                    height: 80,
                    child: THeader.brand(
                      icon: SvgPicture.asset(Assets.svg.logo),
                      suffixAction: [
                        THeaderAction(
                          icon: TAvatar(
                            imageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
                            shape: AvatarShape.circle,
                            size: 40,
                            backgroundColor: theme.accent,
                          ),
                          onPress: () {},
                        ),
                        THeaderAction(
                          icon: TAvatar(
                            icon: Icon(
                              Icons.more_horiz_rounded,
                              color: theme.foreground,
                            ),
                            shape: AvatarShape.circle,
                            size: 40,
                            backgroundColor: theme.accent,
                          ),
                          onPress: () {},
                        ),
                      ],
                    ),
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
