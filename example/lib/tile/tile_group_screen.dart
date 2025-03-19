import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TileGroupScreen extends StatefulWidget {
  const TileGroupScreen({super.key});

  @override
  State<TileGroupScreen> createState() => _TileGroupScreenState();
}

class _TileGroupScreenState extends State<TileGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(neutral050),
      appBar: THeader.nested(title: 'Tile Group', enableCenterTitle: true,),
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
                    label: 'Tile',
                  ),
                  TBreadcrumbItem(
                    onTap: () {},
                    label: 'Tile Group',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TAccordion(
                title: "Full Divider",
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
                  child: TGroupTile(
                    enableBorder: true,
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
                ),
              ),
              TAccordion(
                title: "No Divider",
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
                  child: TGroupTile(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
