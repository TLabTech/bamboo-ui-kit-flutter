import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController descriptionController = TextEditingController();

  String? selectedItem;
  late List<Map<String, String>> items;

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
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Text Field', enableCenterTitle: true,),
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
                titleStyle: TFontBold.headline.copyWith(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Email",
                              style: TFontBold.body
                                  .copyWith(color: HexColor(neutral900)),
                            ),
                            TextSpan(
                              text: " (Optional)",
                              style: TFontRegular.body
                                  .copyWith(color: HexColor(neutral500)),
                            ),
                          ],
                        ),
                      ),
                      TTextField.email(
                        hintText: "write your email",
                        controller: emailController,
                        onChange: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Right Icon",
                titleStyle: TFontBold.headline.copyWith(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        'Province',
                        style: TFontBold.body
                            .copyWith(color: HexColor(neutral900)),
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
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Password",
                titleStyle: TFontBold.headline.copyWith(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TFontBold.body
                            .copyWith(color: HexColor(neutral900)),
                      ),
                      TTextField.password(
                        hintText: "write your password",
                        controller: passwordController,
                        onChange: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Multiline",
                titleStyle: TFontBold.headline.copyWith(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Description",
                              style: TFontBold.body
                                  .copyWith(color: HexColor(neutral900)),
                            ),
                            TextSpan(
                              text: " (Optional)",
                              style: TFontRegular.body
                                  .copyWith(color: HexColor(neutral500)),
                            ),
                          ],
                        ),
                      ),
                      TTextField.multiline(
                        hintText: "write your description",
                        controller: descriptionController,
                        onChange: (value) {},
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
