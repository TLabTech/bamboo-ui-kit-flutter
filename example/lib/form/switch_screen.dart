import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool _isFeatureEnabled = false;
  final bool _isFeatureDisableEnabled = false;
  bool _isFeatureErrorEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Switch'),
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
                    label: 'Switch',
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
                  child: TSwitch(
                    label: "Label",
                    description: "Description",
                    value: _isFeatureEnabled,
                    onChanged: (value) {
                      _isFeatureEnabled = value;
                    },
                    isEnabled: true,
                  ),
                ),
              ),
              TAccordion(
                title: "Disabled",
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
                  child: TSwitch(
                    label: "Label",
                    description: "Description",
                    value: _isFeatureDisableEnabled,
                    onChanged: (value) {
                      _isFeatureEnabled = value;
                    },
                    isEnabled: false,
                  ),
                ),
              ),
              TAccordion(
                title: "Error",
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
                  child: TSwitch(
                    label: "Label",
                    description: "Description",
                    value: _isFeatureErrorEnabled,
                    onChanged: (value) {
                      _isFeatureErrorEnabled = value;
                    },
                    isError: true,
                    error: "Error description,",
                    isEnabled: true,
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
