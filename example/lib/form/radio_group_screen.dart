import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RadioGroupScreen extends StatefulWidget {
  const RadioGroupScreen({super.key});

  @override
  State<RadioGroupScreen> createState() => _RadioGroupScreenState();
}

class _RadioGroupScreenState extends State<RadioGroupScreen> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Radio Group', enableCenterTitle: true,),
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
                    label: 'Radio Group',
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
                  child: TRadioGroup<String>(
                    label: "Label",
                    values: ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'],
                    items: ['Label', 'Label', 'Label', 'Label', 'Label'],
                    selectedValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                        print('radioGroupValue $value');
                      });
                    },
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
