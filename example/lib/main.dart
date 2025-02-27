import 'package:example/bottom_navigation_sample/bottom_navigation_sample.dart';
import 'package:example/chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

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
  late final TextEditingController controller = TextEditingController();
  final GlobalKey<TCalendarState> calendarKey = GlobalKey<TCalendarState>();

  bool _isChecked = false;
  String? _selectedValue;
  bool _isFeatureEnabled = true;
  late List<Map<String, String>> items;

  final List<String> provinces = ["Central Java", "West Java", "East Java"];
  String? selectedProvince;
  String? selectedItem;

  double sliderValue = 0.5;

  @override
  void initState() {
    super.initState();
    items = [
      {"label": "1", "value": "Laptop"},
      {"label": "2", "value": "Smartphone"},
      {"label": "3", "value": "Headphones"},
      {"label": "4", "value": "Keyboard"},
      {"label": "5", "value": "Monitor"},
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      calendarKey.currentState?.addEvents([
        EventData(
          title: "New Year's Day",
          date: DateTime(2025, 1, 1),
          description: "Celebrate the new year!",
          startTime: DateTime(2024, 1, 1, 0, 0),
          endTime: DateTime(2024, 1, 1, 23, 59),
        ),
        EventData(
          title: "Christmas Day",
          date: DateTime(2025, 2, 20),
          description: "Celebrate Christmas with family.",
          startTime: DateTime(2024, 12, 25, 0, 0),
          endTime: DateTime(2024, 12, 25, 23, 59),
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: THeader(
        title: '${widget.title} - base header',
        enableCenterTitle: false,
        suffixAction: [
          THeaderAction(icon: Icon(Icons.add), onPress: () {}),
          THeaderAction(icon: Icon(Icons.notifications_active), onPress: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /**
               * Button
               */
              Text(
                'Button UI KIT',
                style: TFontBold.headline,
              ),
              Wrap(
                spacing: 4,
                children: [
                  TButtonPrimary(
                    text: "Primary - Chart",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChartScreen()),
                      );
                    },
                  ),
                  TButtonPrimary(
                    text: "Primary with icon",
                    onPressed: () {},
                    suffixIcon: Icon(Icons.add),
                    prefixIcon: Icon(Icons.ac_unit),
                  ),
                  TButtonPrimary.icon(
                      icon: Icon(Icons.access_alarm), onPressed: () {}),
                  TButtonSecondary(
                    text: "Secondary - bottom navigation fixed 3",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigationSample(
                                  navbarStyle: NavbarStyle.fixed3,
                                )),
                      );
                    },
                  ),
                  TButtonDestructive(
                    text: "Destructive - bottom navigation fixed 4",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigationSample(
                                  navbarStyle: NavbarStyle.fixed4,
                                )),
                      );
                    },
                  ),
                  TButtonOutline(
                    text: "outline - bottom navigation fixed 5",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigationSample(
                                    navbarStyle: NavbarStyle.fixed5,
                                  )));
                    },
                  ),
                  TButtonPrimary(
                    text: "bottom navigation floating 3",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigationSample(
                                    navbarStyle: NavbarStyle.floating3,
                                  )));
                    },
                  ),
                  TButtonGhost(
                    text: "Ghost",
                    onPressed: () {},
                    normalColor: Colors.black,
                    pressedColor: Colors.green,
                  ),
                  TButtonPrimary(
                    text: "Bottom navigation floating 4",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationSample(
                            navbarStyle: NavbarStyle.floating4,
                          ),
                        ),
                      );
                    },
                  ),
                  TButtonPrimary(
                    text: "Bottom navigation floating 5",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationSample(
                            navbarStyle: NavbarStyle.floating5,
                          ),
                        ),
                      );
                    },
                  ),
                  TButtonDisable(text: "Disable", onPressed: () {}),
                  TButtonPrimary(
                    text: "Loading",
                    onPressed: () {},
                    loading: true,
                  ),
                  TButtonPrimary(
                    text: "Open Dialog horizontal",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (builder) {
                          return TDialog(
                            title: 'Lorem ipsum dolor sit amet',
                            content:
                                "Lorem ipsum dolor sit amet consectetur. Sit sit scelerisque sed nisl sed egestas. Diam amet orci velit facilisis dui dui ullamcorper. Aliquam donec odio ipsum.",
                            direction: Axis.horizontal,
                            onPositivePressed: () {
                              Navigator.of(context).pop();
                            },
                            onNegativePressed: () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    },
                  ),
                  TButtonPrimary(
                    text: "Open Dialog vertical",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (builder) {
                          return TDialog(
                            title: 'Lorem ipsum dolor sit amet',
                            content:
                                "Lorem ipsum dolor sit amet consectetur. Sit sit scelerisque sed nisl sed egestas. Diam amet orci velit facilisis dui dui ullamcorper. Aliquam donec odio ipsum.",
                            direction: Axis.vertical,
                            onPositivePressed: () {
                              Navigator.of(context).pop();
                            },
                            onNegativePressed: () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Breadcrumb UI KIT",
                style: TFontBold.headline,
              ),
              TBreadcrumbs(
                separator: const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.grey,
                ),
                maxVisibleItems: 4,
                direction: BreadcrumbDirection.left,
                items: [
                  TBreadcrumbItem(icon: Icon(Icons.home), onTap: () {}),
                  TBreadcrumbItem(label: "sample 1", onTap: () {}),
                  TBreadcrumbItem(label: "sample 2", onTap: () {}),
                  TBreadcrumbItem(label: "sample 3", onTap: () {}),
                  TBreadcrumbItem(label: "sample 4", onTap: () {}),
                  TBreadcrumbItem(label: "sample 5", onTap: () {}),
                  TBreadcrumbItem(label: "sample 6", onTap: () {}),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Stepper",
                style: TFontBold.headline,
              ),
              TStepper(currentStep: 4, totalSteps: 4),
              SizedBox(
                height: 12,
              ),
              Text(
                'Calendar',
                style: TFontBold.headline,
              ),
              SizedBox(
                height: 400,
                child: TCalendar(
                  key: calendarKey,
                  // Assign the GlobalKey
                  onTitleTapped: (selectedDate) {
                    print("Title tapped: $selectedDate");
                  },
                  onNextMonth: (currentDate) {
                    print("Next month: $currentDate");
                  },
                  onPreviousMonth: (currentDate) {
                    print("Previous month: $currentDate");
                  },
                  onCellTap: (events, date) {
                    print("Cell tapped: $date with events: $events");
                  },
                  onEventTap: (event, date) {
                    print("Event tapped: $event on $date");
                  },
                  onEventLongTap: (event, date) {
                    print("Event long-pressed: $event on $date");
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'CheckBox',
                style: TFontBold.headline,
              ),
              Wrap(
                spacing: 10,
                children: [
                  TCheckBox(
                    initialValue: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value;
                      });
                    },
                    activeColor: Color(0xff00DE9C),
                    inactiveColor: Color(0xffF6F7F9),
                    borderColor: Colors.transparent,
                    label: "Enable",
                    description: "your Description",
                    error: "error message",
                    isEnabled: true,
                    isError: false,
                  ),
                  TCheckBox(
                    initialValue: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value;
                      });
                    },
                    activeColor: Color(0xff00DE9C),
                    inactiveColor: Color(0xffF6F7F9),
                    borderColor: Colors.transparent,
                    label: "Disable",
                    description: "your Description",
                    error: "error message",
                    isEnabled: false,
                    isError: false,
                  ),
                  TCheckBox(
                    initialValue: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value;
                      });
                    },
                    activeColor: Color(0xff00DE9C),
                    inactiveColor: Color(0xffF6F7F9),
                    borderColor: Colors.transparent,
                    label: "Error",
                    description: "your Description",
                    error: "error message",
                    isEnabled: true,
                    isError: true,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'RadioButton',
                style: TFontBold.headline,
              ),
              Wrap(
                children: [
                  TRadioButton<String>(
                    value: "banana",
                    groupValue: _selectedValue ?? '',
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue = newValue;
                      });
                    },
                    label: "Banana",
                    description: "Another tasty fruit",
                    error: "error message",
                    isDisabled: false,
                    isError: false,
                  ),
                  TRadioButton<String>(
                    value: "banana",
                    groupValue: _selectedValue ?? '',
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue = newValue;
                      });
                    },
                    label: "Banana",
                    description: "Another tasty fruit",
                    error: "error message",
                    isDisabled: false,
                    isError: true,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Switch',
                style: TFontBold.headline,
              ),
              Wrap(
                children: [
                  TSwitch(
                    label: "label",
                    description: "description",
                    value: _isFeatureEnabled,
                    onChanged: (value) {
                      _isFeatureEnabled = value;
                    },
                    isError: true,
                    error: "error message",
                    isEnabled: true,
                  ),
                  TSwitch(
                    label: "label",
                    description: "description",
                    value: _isFeatureEnabled,
                    onChanged: (value) {
                      _isFeatureEnabled = value;
                    },
                    isError: false,
                    error: "",
                    isEnabled: true,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Slider',
                style: TFontBold.headline,
              ),
              TSlider(
                value: sliderValue,
                onChanged: (newValue) {
                  setState(() {
                    sliderValue = newValue;
                  });
                },
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Text Field',
                style: TFontBold.headline,
              ),
              TTextField(
                hintText: "hintText",
                controller: controller,
                onChange: (value) {},
              ),
              TTextField(
                hintText: "hintText",
                controller: controller,
                errorMessage: "error message",
                description: "Description",
                onChange: (value) {},
              ),
              TTextField.email(
                hintText: "hintText",
                controller: controller,
                onChange: (value) {},
              ),
              TTextField.password(
                hintText: "hintText",
                controller: controller,
                onChange: (value) {},
              ),
              TTextField.multiline(
                hintText: "hintText",
                controller: controller,
                onChange: (value) {},
              ),
              TDropdown<Map<String, String>>(
                hintText: "Please select",
                items: items,
                value: selectedItem != null
                    ? items.firstWhere(
                        (item) => item["value"] == selectedItem,
                      )
                    : null,
                itemLabel: (item) => item["value"]!,
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue?["value"];
                  });
                },
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Accordion",
                style: TFontBold.headline,
              ),
              TAccordion(
                  title: "Lorem ipsum dolor sit amet",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore."),
              SizedBox(
                height: 12,
              ),
              Text(
                "Avatar",
                style: TFontBold.headline,
              ),
              Wrap(
                spacing: 8,
                children: [
                  TAvatar(
                    text: "sa",
                    size: 80,
                    shape: AvatarShape.roundedSquare,
                  ),
                  TAvatar(
                    imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                    size: 80,
                    shape: AvatarShape.roundedSquare,
                  ),
                  TAvatar(
                    icon: Icon(Icons.person_outline_rounded),
                    shape: AvatarShape.roundedSquare,
                  ),
                  TAvatar(
                    text: "sa",
                    size: 80,
                    shape: AvatarShape.circle,
                  ),
                  TAvatar(
                    imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                    size: 80,
                    shape: AvatarShape.circle,
                  ),
                  TAvatar(
                    icon: Icon(Icons.person_outline_rounded),
                    shape: AvatarShape.circle,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Badge",
                style: TFontBold.headline,
              ),
              Wrap(
                spacing: 10,
                children: [
                  TBadge(label: "primary"),
                  TBadge.secondary(label: "secondary"),
                  TBadge.outline(label: "outline"),
                  TBadge.destructive(label: "destructive"),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Tile",
                style: TFontBold.headline,
              ),
              TTile(
                title: "Wifi",
                subtitle: "focus",
                prefixIcon: Icon(Icons.person_outline_rounded),
                suffixIcon: Icon(Icons.chevron_right),
                detail: "Forus labs (5G)",
                enable: false,
              ),
              TGroupTile(
                enableBorder: false,
                tiles: [
                  TTile(
                    title: "Profile",
                    subtitle: "Manage your profile",
                    detail: "Edit",
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.black54,
                    ),
                    suffixIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.black54,
                    ),
                  ),
                  TTile(
                    title: "Security",
                    subtitle: "Change password & security settings",
                    detail: "Update",
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black54,
                    ),
                    suffixIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.black54,
                    ),
                  ),
                  TTile(
                    title: "Notifications",
                    subtitle: "Customize notification preferences",
                    detail: "Manage",
                    prefixIcon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.black54,
                    ),
                    suffixIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Progress",
                style: TFontBold.headline,
              ),
              TProgress(
                value: 0.5,
              ),
              TProgress.circular(
                value: 0.7,
                backgroundColor: Colors.redAccent,
                valueColor: Colors.redAccent,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Alert",
                style: TFontBold.headline,
              ),
              TAlert.destructive(
                title: "Destructive",
                subtitle: "Lorem ipsum dolor sit amet.",
              ),
              TAlert.primary(
                title: "Primary",
                subtitle: "Lorem ipsum dolor sit amet.",
              ),
              TAlert.info(
                title: "Info",
                subtitle: "Lorem ipsum dolor sit amet.",
              ),
              TAlert(
                title: "Default",
                subtitle: "Lorem ipsum dolor sit amet.",
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
    );
  }
}
