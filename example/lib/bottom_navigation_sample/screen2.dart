import 'package:example/bottom_navigation_sample/screen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final helper = TBottomNavigationHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: THeader.search(
        hintText: "Header search",
        onChanged: (value) {
          print('onchange $value');
        },
      ),
      body: Center(
        child: TButtonSecondary(
          text: "to screen 4 without navbar",
          onPressed: () {
            helper.pushNewScreen(
              context,
              screen: Screen4(),
              withNavBar: false,
            );
          },
        ),
      ),
    );
  }
}
