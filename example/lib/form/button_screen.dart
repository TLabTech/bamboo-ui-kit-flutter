import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/svg.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(gray050),
      appBar: THeader.nested(
        title: 'Button',
        enableCenterTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 8,
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
                    label: 'Button',
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              TAccordion(
                title: 'Button General',
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonPrimary(
                          text: "Button Primary",
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonSecondary(
                          text: "Button Secondary",
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonDestructive(
                          text: "Button Destructive",
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonOutline(
                          text: "Button Outline",
                          textStyle: TFontBold.body(context)
                              .copyWith(color: HexColor(primary500)),
                          onPressed: () {},
                        ),
                      ),
                      TButtonGhost(
                        text: "Button Ghost",
                        textStyle: TFontBold.body(context)
                            .copyWith(color: HexColor(primary500)),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonDisable(
                          text: "Button Disable",
                          onPressed: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: 'Button With Left Icon',
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonPrimary(
                          text: "Button Primary",
                          prefixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonSecondary(
                          text: "Button Secondary",
                          prefixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonDestructive(
                          text: "Button Destructive",
                          prefixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonOutline(
                          text: "Button Outline",
                          textStyle: TFontBold.body(context)
                              .copyWith(color: HexColor(primary500)),
                          prefixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              HexColor(primary500),
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      TButtonGhost(
                        text: "Button Ghost",
                        textStyle: TFontBold.body(context)
                            .copyWith(color: HexColor(primary500)),
                        prefixIcon: SvgPicture.asset(
                          Assets.svg.plus,
                          colorFilter: ColorFilter.mode(
                            HexColor(primary500),
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonDisable(
                          text: "Button Disable",
                          prefixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: 'Button With Right Icon',
                titleStyle: TFontBold.headline(context).copyWith(
                  color: HexColor(gray900),
                ),
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonPrimary(
                          text: "Button Primary",
                          suffixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonSecondary(
                          text: "Button Secondary",
                          suffixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonDestructive(
                          text: "Button Destructive",
                          suffixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonOutline(
                          text: "Button Outline",
                          textStyle: TFontBold.body(context)
                              .copyWith(color: HexColor(primary500)),
                          suffixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              HexColor(primary500),
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      TButtonGhost(
                        text: "Button Ghost",
                        textStyle: TFontBold.body(context)
                            .copyWith(color: HexColor(primary500)),
                        suffixIcon: SvgPicture.asset(
                          Assets.svg.plus,
                          colorFilter: ColorFilter.mode(
                            HexColor(primary500),
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonDisable(
                          text: "Button Disable",
                          suffixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Button Only Icon",
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: TButtonPrimary.icon(
                          icon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: TButtonSecondary.icon(
                          icon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              HexColor(gray900),
                              BlendMode.srcIn,
                            ),
                          ),
                          minWidth: 40,
                          minHeight: 40,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: TButtonDestructive.icon(
                          icon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      TButtonOutline.icon(
                        icon: SvgPicture.asset(
                          Assets.svg.plus,
                          colorFilter: ColorFilter.mode(
                            HexColor(primary500),
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      TButtonGhost.icon(
                        icon: SvgPicture.asset(
                          Assets.svg.plus,
                          colorFilter: ColorFilter.mode(
                            HexColor(primary500),
                            BlendMode.srcIn,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: TButtonDisable.icon(
                          icon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Button with Button Spinner",
                showDivider: false,
                initiallyExpanded: true,
                trailing: SvgPicture.asset(Assets.svg.chevronDown),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: HexColor(gray300),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        child: TButtonPrimary(
                          loading: true,
                          text: "Button Primary",
                          prefixIcon: SvgPicture.asset(
                            Assets.svg.plus,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {},
                        ),
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
