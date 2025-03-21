import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusBarScreen extends StatefulWidget {
  const StatusBarScreen({super.key});

  @override
  State<StatusBarScreen> createState() => _StatusBarScreenState();
}

class _StatusBarScreenState extends State<StatusBarScreen> {
  void changeStatusBarColor(Color color, Brightness iconBrightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      // Change status bar color
      statusBarIconBrightness: iconBrightness,
      // For Android (dark or light icons)
      statusBarBrightness: iconBrightness, // For iOS (dark or light icons)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(gray050),
        appBar: THeader.nested(
          title: 'Status Bar',
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
                      label: 'Status Bar',
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                TAccordion(
                  title: "Light",
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
                    child: TButtonPrimary(
                      text: 'Light',
                      onPressed: () {
                        changeStatusBarColor(Colors.white, Brightness.dark);
                      },
                    ),
                  ),
                ),
                TAccordion(
                  title: "Dark",
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
                    child: TButtonPrimary(
                      text: 'Dark',
                      onPressed: () {
                        changeStatusBarColor(Colors.black, Brightness.light);
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
