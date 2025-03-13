import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  String? _selectedDefaultValue;
  String? _selectedDisableValue;
  String? _selectedErrorValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Radio'),
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
                    label: 'Radio',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Default",
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
                  child: TRadioButton<String>(
                    value: "label",
                    groupValue: _selectedDefaultValue ?? '',
                    onChanged: (newValue) {
                      setState(() {
                        if (_selectedDefaultValue == newValue) {
                          _selectedDefaultValue = null;
                        } else {
                          _selectedDefaultValue = newValue;
                        }
                      });
                    },
                    label: "Label",
                    description: "Description.",
                    error: "error message",
                    isDisabled: false,
                    isError: false,
                  ),
                ),
              ),
              TAccordion(
                title: "Disabled",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: false,
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
                  child: TRadioButton<String>(
                    value: "label",
                    groupValue: _selectedDisableValue ?? '',
                    onChanged: (newValue) {},
                    label: "Label",
                    description: "Description.",
                    error: "error message",
                    isDisabled: true,
                    isError: false,
                  ),
                ),
              ),
              TAccordion(
                title: "Error",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: false,
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
                  child: TRadioButton<String>(
                    value: "label",
                    groupValue: _selectedErrorValue ?? '',
                    onChanged: (newValue) {
                      setState(() {
                        if (_selectedErrorValue == newValue) {
                          _selectedErrorValue = null;
                        } else {
                          _selectedErrorValue = newValue;
                        }
                      });
                    },
                    label: "Label",
                    description: "Description.",
                    error: "Error description.",
                    isError: true,
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
