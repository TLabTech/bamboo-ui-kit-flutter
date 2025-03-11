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
  String? cashOnDelivery;
  bool _isFeatureEnabled = true;
  late List<Map<String, String>> items;

  final List<String> provinces = ["Central Java", "West Java", "East Java"];
  String? selectedProvince;
  String? selectedItem;

  double sliderValue = 0.5;
  String? selectedOption;

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
              Text(
                'Tittle Section',
                style: TFontBold.headline,
              ),
              TTitleSection(
                title: 'Recent Activity',
                onPressed: () {},
              ),
              TTitleSection(
                title: 'Recent Activity',
                buttonText: "Button",
                onPressed: () {},
              ),
              TTitleSection(
                title: 'Recent Activity',
                icon: Icon(Icons.person_outline),
                onPressed: () {},
              ),
              TTitleSection(
                title: 'Recent Activity',
                description: "with button and icon",
                icon: Icon(Icons.person_outline),
                buttonText: "Button",
                onPressed: () {},
              ),
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
                    suffixIcon: Icon(
                      Icons.add,
                    ),
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
                  TButtonSecondary.icon(
                    icon: Icon(Icons.add),
                    onPressed: () {},
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
                  TButtonDestructive.icon(
                    icon: Icon(Icons.access_time_filled_rounded),
                    onPressed: () {},
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
                  TButtonOutline.icon(
                    icon: Icon(Icons.ac_unit),
                    onPressed: () {},
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
                  TButtonGhost.icon(
                    icon: Icon(Icons.access_time_filled_rounded),
                    onPressed: () {},
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
                  TButtonDisable.icon(
                      icon: Icon(Icons.ac_unit), onPressed: () {}),
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
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: HexColor(neutral200)),
                ),
                child: TCalendar(
                  firstDay: DateTime(2000, 4, 4),
                  lastDay: DateTime(2030, 1, 2),
                  events: [
                    EventData(
                      date: DateTime(2025, 2, 18),
                      title: 'Meeting',
                      description: 'Discuss project updates',
                    ),
                    EventData(
                      date: DateTime(2025, 3, 1),
                      title: 'Deadline',
                    ),
                  ],
                  onEventTap: (event) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped: ${event.title}')),
                    );
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
                'Checkbox Group',
                style: TFontBold.headline,
              ),
              TCheckBoxGroup(
                label: "Your option label",
                items: ["Option 1", "Option 2", "Option 3"],
                initialValues: null,
                activeColor: Color(0xff00DE9C),
                inactiveColor: Color(0xffF6F7F9),
                onChanged: (selectedItems) {
                  print("Selected items: $selectedItems");
                },
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Radio Button',
                style: TFontBold.headline,
              ),
              Wrap(
                children: [
                  TRadioButton<String>(
                    value: "banana",
                    groupValue: _selectedValue ?? '',
                    onChanged: (newValue) {
                      setState(() {
                        if (_selectedValue == newValue) {
                          _selectedValue = null;
                        } else {
                          _selectedValue = newValue;
                        }
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
                        if (_selectedValue == newValue) {
                          _selectedValue = null;
                        } else {
                          _selectedValue = newValue;
                        }
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
                'Radio Group',
                style: TFontBold.headline,
              ),
              TRadioGroup<String>(
                label: "Your Radio Label",
                values: ['Option 1', 'Option 2'],
                items: ['Label', 'Label'],
                selectedValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                    print('radioGroupValue $value');
                  });
                },
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                    style: TFontRegular.footNote
                        .copyWith(color: HexColor(neutral500)),
                  ),
                ),
              ),
              TAccordion(
                title: "Lorem ipsum dolor sit amet",
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
                    style: TFontRegular.footNote
                        .copyWith(color: HexColor(neutral500)),
                  ),
                ),
              ),
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
                    predefinedSize: AvatarSize.large,
                    type: AvatarType.online,
                    shape: AvatarShape.roundedSquare,
                    backgroundColor: HexColor(primary500),
                  ),
                  TAvatar(
                    imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                    predefinedSize: AvatarSize.large,
                    type: AvatarType.notification,
                    notificationCount: 5,
                    shape: AvatarShape.roundedSquare,
                  ),
                  TAvatar(
                    icon: Icon(
                      Icons.account_circle,
                      color: HexColor('#677489'),
                    ),
                    predefinedSize: AvatarSize.medium,
                    shape: AvatarShape.roundedSquare,
                  ),
                  TAvatar(
                    text: "sa",
                    shape: AvatarShape.circle,
                    predefinedSize: AvatarSize.medium,
                    type: AvatarType.online,
                    backgroundColor: HexColor(primary500),
                  ),
                  TAvatar(
                    imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                    shape: AvatarShape.roundedSquare,
                    type: AvatarType.notification,
                    predefinedSize: AvatarSize.small,
                    notificationCount: null,
                  ),
                  TAvatar(
                    icon: Icon(
                      Icons.account_circle,
                      color: HexColor('#677489'),
                      size: 12,
                    ),
                    predefinedSize: AvatarSize.small,
                    shape: AvatarShape.circle,
                    type: AvatarType.online,
                  ),
                  TAvatar(
                    text: "SA",
                    backgroundColor: HexColor(primary500),
                    predefinedSize: AvatarSize.small,
                    shape: AvatarShape.circle,
                    type: AvatarType.online,
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
                onPress: () {
                  print('pressing');
                },
              ),
              TTile<String>(
                title: "Cash On Delivery",
                prefixIcon: const Icon(Icons.money, color: Colors.black54),
                value: "cashOnDelivery",
                groupValue: cashOnDelivery,
                onChanged: (value) {
                  setState(() {
                    if (cashOnDelivery == value) {
                      cashOnDelivery = null;
                    } else {
                      cashOnDelivery = value;
                    }
                  });
                },
                showRadio: true,
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
                    onPress: () {
                      print('pressing profile');
                    },
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
                    onPress: () {
                      print('pressing security');
                    },
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
              TGroupTile<String>(
                title: "E-Wallet",
                borderColor: Colors.white,
                backgroundColor: Colors.white,
                enableRadio: true,
                // Enable radio button selection
                initialValue: "paypall",
                enableBorder: false,
                onChanged: (value) {
                  print("Selected: $value");
                },
                tiles: [
                  TTile<String>(
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    title: "Paypall",
                    value: "paypall",
                  ),
                  TTile<String>(
                    title: "Gopay",
                    prefixIcon: Icon(Icons.monetization_on),
                    subtitle: "gopay",
                    value: "gopay",
                  ),
                  TTile<String>(
                    title: "Shopee Pay",
                    prefixIcon: Icon(Icons.money),
                    value: "shopee",
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
                color: HexColor(primary500),
                backgroundColor: HexColor(neutral200),
                valueColor: Colors.black,
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
