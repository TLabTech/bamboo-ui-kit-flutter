import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/widgets/bottom_navigation.dart';
import 'package:flutter_bamboo_ui_kit/widgets/button.dart';
import 'package:flutter_bamboo_ui_kit/widgets/header.dart';

class Screen3 extends StatefulWidget {
  final BuildContext parentContext;

  const Screen3({super.key, required this.parentContext});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final helper = TBottomNavigationHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: THeader.brand(
        icon: Image.network(
            'https://banner2.cleanpng.com/20180806/oii/65b606cc249e8b0645b6ae3356fc358b.webp'),
        suffixAction: [
          THeaderAction(icon: Icon(Icons.add), onPress: () {}),
          THeaderAction(icon: Icon(Icons.notifications_active), onPress: () {}),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Screen 3"),
          TButtonPrimary(
              text: "back",
              onPressed: () {
                Navigator.pop(context);
              }),
          TButtonSecondary(
            text: "open profile",
            onPressed: () {
              helper.popScreen(context);
              helper.jumpToTab(3, widget.parentContext);
            },
          ),
        ],
      ),
    );
  }
}
