import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController descriptionController =
      TextEditingController();

  String? selectedItem;
  Map<String, String>? selectedProvince;
  late List<Map<String, String>> items;
  late FocusNode focusNode = FocusNode();

  @override
  void initState() {
    items = [
      {"label": "1", "value": "Central Java"},
      {"label": "2", "value": "Central Borneo"},
      {"label": "3", "value": "Central Sumatra"},
      {"label": "4", "value": "Yogyakarta"},
      {"label": "5", "value": "Jakarta"},
    ];
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<TThemeManager>().state;
    final isDarkMode = theme == context.read<TThemeManager>().darkTheme;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: THeader.nested(
        title: 'Text Field',
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
                    label: 'Form',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Text Field',
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              TAccordion(
                title: "Left Icon",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Email",
                              style: isDarkMode
                                  ? TFontBold.body(context)
                                  : TFontBold.body(context)
                                      .copyWith(color: HexColor(gray900)),
                            ),
                            TextSpan(
                              text: " (Optional)",
                              style: TFontRegular.body(context)
                                  .copyWith(color: HexColor(gray500)),
                            ),
                          ],
                        ),
                      ),
                      TTextField.email(
                        hintText: "write your email",
                        controller: emailController,
                        onChange: (value) {},
                      ),
                      TTextField(
                        controller: TextEditingController(),
                        hintText: "Notification",
                        onChange: (value) {},
                        leading: SvgPicture.asset(
                          Assets.svg.bell,
                          colorFilter: ColorFilter.mode(
                            theme.mutedForeground,
                            BlendMode.srcIn,
                          ),
                        ),
                        onLeadingPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Right Icon",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        'Province',
                        style: TFontBold.body(context),
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
                      TTextField(
                        controller: TextEditingController(),
                        hintText: "Notification",
                        onChange: (value) {},
                        actionWidget: SvgPicture.asset(
                          Assets.svg.bell,
                          colorFilter: ColorFilter.mode(
                            theme.mutedForeground,
                            BlendMode.srcIn,
                          ),
                        ),
                        onActionPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Password",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TFontBold.body(context),
                      ),
                      TTextField.password(
                        hintText: "write your password",
                        controller: passwordController,
                        focusedBorderColor: Colors.black,
                        focusNode: focusNode,
                        onChange: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Multiline",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Description",
                              style: isDarkMode
                                  ? TFontBold.body(context)
                                  : TFontBold.body(context)
                                      .copyWith(color: HexColor(gray900)),
                            ),
                            TextSpan(
                              text: " (Optional)",
                              style: TFontRegular.body(context)
                                  .copyWith(color: HexColor(gray500)),
                            ),
                          ],
                        ),
                      ),
                      TTextField.multiline(
                        hintText: "write your description",
                        controller: descriptionController,
                        maxLines: null,
                        onChange: (value) {},
                        onSubmitted: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Dropdown Search",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Text(
                        'Province',
                        style: TFontBold.body(context),
                      ),
                      TDropdownSearch<Map<String, String>>(
                        hint: "Select province",
                        list: items,
                        value: selectedItem != null
                            ? items.firstWhere(
                                (item) => item["value"] == selectedItem,
                              )
                            : null,
                        textEditingController: TextEditingController(),
                        displayText: (Map<String, String> province) =>
                            province["value"] ?? '',
                        onChanged: (Map<String, String> province) {
                          setState(() {
                            selectedItem = province["value"];
                          });
                        },
                        backgroundColor: HexColor(baseWhite),
                        borderColor: theme.border,
                      )
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
