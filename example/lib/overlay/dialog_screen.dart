import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Dialog'),
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
                    label: 'Overlay',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Dialog',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Horizontal",
                titleStyle: TFontBold.headline.copyWith(
                  color: HexColor(neutral900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(neutral300),
                    ),
                  ),
                  child: TButtonPrimary(
                    text: "Open Dialog",
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
                ),
              ),
              TAccordion(
                title: "Vertical",
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
                  child: TButtonPrimary(
                    text: "Open Dialog",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
