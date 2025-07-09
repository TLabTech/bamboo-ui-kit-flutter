import 'package:example/bottom_navigation_sample/screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_svg/svg.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  final GlobalKey<TCalendarState> _calendarKey = GlobalKey<TCalendarState>();
  final helper = TBottomNavigationHelper();

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
            onPress: () {
              helper.pushNewScreenWithNavBar(
                context,
                MaterialPageRoute(builder: (_) => Screen1())
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // FCalendar(
            //   controller: FCalendarController.date(),
            //   start: DateTime(2000),
            //   end: DateTime(2030),
            // ),
            SizedBox(
              height: 20,
            ),
            TButtonPrimary(
                text: "Goto",
                onPressed: () {
                  // _calendarKey.currentState?.animateToDate(DateTime(2025, 2, 18));
                  _calendarKey.currentState?.jumpToDate(DateTime(2025, 2, 18));
                }),
            Container(
              padding: EdgeInsets.all(12),
              child: TCalendar(
                key: _calendarKey,
                firstDay: DateTime(2000, 4, 4),
                lastDay: DateTime(2030, 1, 2),
                events: [
                  EventData(
                    date: DateTime(2025, 2, 18),
                    title: 'Meeting',
                    description: 'Discuss project updates',
                  ),
                  EventData(
                    date: DateTime(2025, 3, 1),
                    title: 'Deadline',
                  ),
                ],
                onEventTap: (event) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped: ${event.title}')),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
