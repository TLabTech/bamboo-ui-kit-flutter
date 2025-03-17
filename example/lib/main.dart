import 'package:example/bottom_navigation_sample/bottom_navigation_sample.dart';
import 'package:example/chart/bar_chart_screen.dart';
import 'package:example/chart/doughnut_chart_screen.dart';
import 'package:example/chart/line_chart_screen.dart';
import 'package:example/chart/pie_chart_screen.dart';
import 'package:example/chart_screen.dart';
import 'package:example/data_presentation/accordion_screen.dart';
import 'package:example/data_presentation/avatar_screen.dart';
import 'package:example/data_presentation/badge_screen.dart';
import 'package:example/feedback/alert_screen.dart';
import 'package:example/feedback/progress_screen.dart';
import 'package:example/form/button_screen.dart';
import 'package:example/form/calendar_screen.dart';
import 'package:example/form/check_box_group_screen.dart';
import 'package:example/form/check_box_screen.dart';
import 'package:example/form/radio_group_screen.dart';
import 'package:example/form/radio_screen.dart';
import 'package:example/form/slider_screen.dart';
import 'package:example/form/switch_screen.dart';
import 'package:example/form/text_field_screen.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/navigation/bottom_navigation_screen.dart';
import 'package:example/navigation/breadcrumbs_screen.dart';
import 'package:example/navigation/header_screen.dart';
import 'package:example/navigation/home_indicator_screen.dart';
import 'package:example/navigation/keyboard_screen.dart';
import 'package:example/navigation/status_bar_screen.dart';
import 'package:example/navigation/stepper_screen.dart';
import 'package:example/navigation/tabs_screen.dart';
import 'package:example/navigation/tittle_section_screen.dart';
import 'package:example/overlay/dialog_screen.dart';
import 'package:example/tile/tile_group_screen.dart';
import 'package:example/tile/tile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      // home: BottomNavigationSample(),
      // home: ChartScreen(),
      home: MyHomePage(title: "Bamboo UI Kit"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(neutral050),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Bamboo UI Kit Mobile',
                    style: TFontRegular.title1,
                  ),
                  TBadge(
                    label: 'Version 1.0',
                    backgroundColor: HexColor(primary050),
                    textColor: HexColor(primary500),
                  ),
                  TAccordion(
                    title: "Form",
                    titleStyle: TFontBold.headline.copyWith(
                      color: HexColor(neutral900),
                    ),
                    showDivider: false,
                    initiallyExpanded: true,
                    trailing: SvgPicture.asset(Assets.svg.chevronDown),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TGroupTile(
                        enableBorder: false,
                        tiles: [
                          TTile(
                            title: "Button",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ButtonScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Calendar",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CalendarScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Checkbox",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckBoxScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Checkbox Group",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckBoxGroupScreen(),
                                ),
                              );
                            },
                          ),
                          TTile(
                            title: "Radio",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RadioScreen(),
                                ),
                              );
                            },
                          ),
                          TTile(
                            title: "Radio Group",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RadioGroupScreen(),
                                ),
                              );
                            },
                          ),
                          TTile(
                            title: "Slider",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SliderScreen(),
                                ),
                              );
                            },
                          ),
                          TTile(
                            title: "Switch",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SwitchScreen(),
                                ),
                              );
                            },
                          ),
                          TTile(
                            title: "Text Field",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TextFieldScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  TAccordion(
                    title: "Data Presentation",
                    titleStyle: TFontBold.headline.copyWith(
                      color: HexColor(neutral900),
                    ),
                    showDivider: false,
                    initiallyExpanded: false,
                    trailing: SvgPicture.asset(Assets.svg.chevronDown),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TGroupTile(
                        enableBorder: false,
                        tiles: [
                          TTile(
                            title: "Accordion",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AccordionScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Avatar",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AvatarScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Badge",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BadgeScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  TAccordion(
                    title: "Tile",
                    titleStyle: TFontBold.headline.copyWith(
                      color: HexColor(neutral900),
                    ),
                    showDivider: false,
                    initiallyExpanded: false,
                    trailing: SvgPicture.asset(Assets.svg.chevronDown),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TGroupTile(
                        enableBorder: false,
                        tiles: [
                          TTile(
                            title: "Tile",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TileScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Tile Group",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TileGroupScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  TAccordion(
                    title: "Navigation",
                    titleStyle: TFontBold.headline.copyWith(
                      color: HexColor(neutral900),
                    ),
                    showDivider: false,
                    initiallyExpanded: false,
                    trailing: SvgPicture.asset(Assets.svg.chevronDown),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TGroupTile(
                        enableBorder: false,
                        tiles: [
                          TTile(
                            title: "Bottom Navigation",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavigationScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Breadcrumbs",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BreadcrumbsScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Header",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HeaderScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Home Indicator",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeIndicatorScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Keyboard",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KeyboardScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Status Bar",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StatusBarScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Stepper",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StepperScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Tab",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TabsScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Tittle Section",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TittleSectionScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  TAccordion(
                    title: "Feedback",
                    titleStyle: TFontBold.headline.copyWith(
                      color: HexColor(neutral900),
                    ),
                    showDivider: false,
                    initiallyExpanded: false,
                    trailing: SvgPicture.asset(Assets.svg.chevronDown),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TGroupTile(
                        enableBorder: false,
                        tiles: [
                          TTile(
                            title: "Alert",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AlertScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Progress",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProgressScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  TAccordion(
                    title: "Overlay",
                    titleStyle: TFontBold.headline.copyWith(
                      color: HexColor(neutral900),
                    ),
                    showDivider: false,
                    initiallyExpanded: false,
                    trailing: SvgPicture.asset(Assets.svg.chevronDown),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TGroupTile(
                        enableBorder: false,
                        tiles: [
                          TTile(
                            title: "Dialog",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DialogScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  TAccordion(
                    title: "Chart",
                    titleStyle: TFontBold.headline.copyWith(
                      color: HexColor(neutral900),
                    ),
                    showDivider: false,
                    initiallyExpanded: false,
                    trailing: SvgPicture.asset(Assets.svg.chevronDown),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TGroupTile(
                        enableBorder: false,
                        tiles: [
                          TTile(
                            title: "Bar",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BarChartScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Line",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LineChartScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Pie",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PieChartScreen()),
                              );
                            },
                          ),
                          TTile(
                            title: "Donut",
                            titleStyle: TFontRegular.body.copyWith(
                              color: HexColor(neutral900),
                            ),
                            suffixIcon: SvgPicture.asset(
                              Assets.svg.chevronRight,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoughnutChartScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
