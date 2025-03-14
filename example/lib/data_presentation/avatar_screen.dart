import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({super.key});

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Avatar', enableCenterTitle: true,),
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
                    label: 'Data Presentation',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Avatar',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Large Circle",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.large,
                        type: AvatarType.general,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.large,
                        type: AvatarType.general,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.large,
                        type: AvatarType.general,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Medium Circle",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          size: 15,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.general,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.general,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.general,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Small Circle",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          size: 13,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.small,
                        type: AvatarType.general,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.small,
                        type: AvatarType.general,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.small,
                        type: AvatarType.general,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Circle With Notification",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          size: 15,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.notification,
                        notificationCount: 5,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.notification,
                        notificationCount: 5,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.notification,
                        notificationCount: 5,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Circle With Online",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          size: 15,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.online,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.online,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.online,
                        shape: AvatarShape.circle,
                        backgroundColor: HexColor(primary500),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Large Round",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.large,
                        type: AvatarType.general,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.large,
                        type: AvatarType.general,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.large,
                        type: AvatarType.general,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Medium Round",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          size: 15,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.general,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.general,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.general,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Small Round",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          size: 13,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.small,
                        type: AvatarType.general,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.small,
                        type: AvatarType.general,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.small,
                        type: AvatarType.general,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Round With Notification",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          size: 15,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.notification,
                        notificationCount: 5,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.notification,
                        notificationCount: 5,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.notification,
                        notificationCount: 5,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
                      ),
                    ],
                  ),
                ),
              ),
              TAccordion(
                title: "Round With Online",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TAvatar(
                        icon: Icon(
                          Icons.account_circle,
                          size: 15,
                          color: HexColor(neutral500),
                        ),
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.online,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor('#D9D9D9'),
                      ),
                      TAvatar(
                        text: "IU",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.online,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
                      ),
                      TAvatar(
                        imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
                        predefinedSize: AvatarSize.medium,
                        type: AvatarType.online,
                        shape: AvatarShape.roundedSquare,
                        backgroundColor: HexColor(primary500),
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
