import 'package:example/bottom_navigation_sample/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final helper = TBottomNavigationHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: THeader.homepage(
        title: "Header homepage",
        subtitle: "subtitle",
        suffixAction: [
          THeaderAction(icon: Icon(Icons.add), onPress: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: TButtonPrimary(
                text: 'to  Screen 3 with navbar',
                onPressed: () {
                  helper.pushNewScreen(
                    context,
                    screen: Screen3(
                      parentContext: context,
                    ),
                    withNavBar: true,
                  );
                },
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TContainerWBoxDecoration(
              width: 200,
              height: 150,
              boxShadow: TShadow.shadowS(),
              child: Center(
                child: Text("Container with box decoration Shadow 'S'"),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            TContainerWBoxDecoration(
              width: 200,
              height: 200,
              boxShadow: TShadow.shadowM(),
              child: Text("Container with box decoration Shadow 'M'"),
            ),
            SizedBox(
              height: 22,
            ),
            TContainerWBoxDecoration(
              width: 200,
              height: 200,
              boxShadow: TShadow.shadowL(),
              child: Text("Container with box decoration Shadow 'L'"),
            ),
          ],
        ),
      ),
    );
  }
}
