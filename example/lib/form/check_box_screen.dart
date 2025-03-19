import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({super.key});

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  bool _isDefaultChecked = false;
  bool _isErrorChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Checkbox', enableCenterTitle: true,),
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
                    label: 'Check Box',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Default",
                titleStyle: TFontBold.headline(context).copyWith(
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
                  child: TCheckBox(
                    initialValue: _isDefaultChecked,
                    onChanged: (value) {
                      setState(() {
                        _isDefaultChecked = value;
                      });
                    },
                    activeColor: Color(0xff00DE9C),
                    inactiveColor: Color(0xffF6F7F9),
                    borderColor: Colors.transparent,
                    label: "Label",
                    description: "Description",
                    error: "error message",
                    isEnabled: true,
                    isError: false,
                  ),
                ),
              ),
              TAccordion(
                title: "Disabled",
                titleStyle: TFontBold.headline(context).copyWith(
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
                  child: TCheckBox(
                    initialValue: _isDefaultChecked,
                    onChanged: (value) {
                      setState(() {
                        _isDefaultChecked = value;
                      });
                    },
                    activeColor: Color(0xff00DE9C),
                    inactiveColor: Color(0xffF6F7F9),
                    borderColor: Colors.transparent,
                    label: "Label",
                    description: "Description",
                    isEnabled: false,
                  ),
                ),
              ),
              TAccordion(
                title: "Error",
                titleStyle: TFontBold.headline(context).copyWith(
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
                  child: TCheckBox(
                    initialValue: _isErrorChecked,
                    onChanged: (value) {
                      setState(() {
                        _isErrorChecked = value;
                      });
                    },
                    activeColor: Color(0xff00DE9C),
                    inactiveColor: Color(0xffF6F7F9),
                    borderColor: Colors.transparent,
                    label: "Label",
                    description: "Description",
                    error: "Error description.",
                    isEnabled: true,
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
