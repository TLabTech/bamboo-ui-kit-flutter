import 'package:example/bottom_navigation_sample/bottom_navigation_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/svg.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: THeader.brand(
        icon: SvgPicture.asset('assets/svg/Logo.svg'),
        backgroundColor: Colors.white,
        suffixAction: [
          THeaderAction(
            icon: TAvatar(
              imageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
              shape: AvatarShape.circle,
              size: 40,
              backgroundColor: Colors.grey.shade100,
            ),
            onPress: () {},
          ),
          THeaderAction(
            icon: TAvatar(
              icon: Icon(
                Icons.more_horiz_rounded,
              ),
              shape: AvatarShape.circle,
              size: 40,
              backgroundColor: Colors.grey.shade100,
            ),
            onPress: () {},
          ),
        ],
      ),
      body: Container(),
    );
  }
}
