import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeIndicatorScreen extends StatefulWidget {
  const HomeIndicatorScreen({super.key});

  @override
  State<HomeIndicatorScreen> createState() => _HomeIndicatorScreenState();
}

class _HomeIndicatorScreenState extends State<HomeIndicatorScreen> {
  void changeNavigationBarColor(Color color, Brightness iconBrightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: color, // Change bottom navigation bar color
      systemNavigationBarIconBrightness: iconBrightness, // Light or dark icons
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<TThemeManager>().state;
    final isDarkMode = theme == context.read<TThemeManager>().darkTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.background,
        appBar: THeader.nested(
          title: 'Home Indicator',
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
                      label: 'Home Indicator',
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                TAccordion(
                  title: "Light",
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
                    child: TButtonPrimary(
                      text: 'Light',
                      onPressed: () {
                        changeNavigationBarColor(
                          Colors.white,
                          Brightness.dark,
                        );
                      },
                    ),
                  ),
                ),
                TAccordion(
                  title: "Dark",
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
                    child: TButtonPrimary(
                      text: 'Dark',
                      onPressed: () {
                        changeNavigationBarColor(
                          Colors.black,
                          Brightness.light,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
