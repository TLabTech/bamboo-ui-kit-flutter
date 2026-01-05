# Bottom Navigation

Overview
A customizable bottom navigation bar component for Flutter applications, built on top of persistent_bottom_nav_bar_v2, that manages navigation between multiple screens (tabs) and offers various built-in styles.

Features
- Supports persistent navigation, maintaining the state of each tab's navigation stack.
- Uses the TBottomNavigationItem class to easily define the screen, icon, and title for each tab.
- Offers multiple built-in navigation styles (e.g., fixed3, fixed4, floating3, etc.) defined in TNavbarStyle.
- Provides a TBottomNavigationHelper for programmatically controlling the tab bar, including jumping to a specific tab or pushing new screens with/without the navigation bar.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/navbar_style.dart'; // Contains TNavbarStyle
```

## Usage
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/widgets/bottom_navigation.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/item/bottom_navigation_item.dart';
import 'package:flutter_bamboo_ui_kit/src/navigation/bottom_navigation/style/navbar_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TBottomNavigation(
      // 1. Define the list of tabs (screens and icons)
      tabs: [
        TBottomNavigationItem(
          screen: const Center(child: Text('Home Screen')),
          activeIcon: const Icon(Icons.home),
          title: 'Home',
        ),
        TBottomNavigationItem(
          screen: const Center(child: Text('Search Screen')),
          activeIcon: const Icon(Icons.search),
          title: 'Search',
        ),
        TBottomNavigationItem(
          screen: const Center(child: Text('Profile Screen')),
          activeIcon: const Icon(Icons.person),
          title: 'Profile',
        ),
      ],
      // 2. Select a specific style for the navigation bar
      navBarBuilder: (navBarConfig) =>
          TNavbarStyle.fixed4(context, navBarConfig, null),
      // Optional: Handle tab change events
      onTabChanged: (index) {
        print('Tab changed to index: $index');
      },
    );
  }
}
```

Preview

![Bottom Navigation Preview](../assets/bottom_navigation/bottom_navigation_preview.gif)

## Additional Usage Examples

### Styling
```dart
TBottomNavigation(
  tabs: [
    // ... same TBottomNavigationItem definitions ...
  ],
  // Use the FloatingCircularNavbar style
  navBarBuilder: (navBarConfig) =>
      TNavbarStyle.floating5(context, navBarConfig, null, Colors.white),
  navBarHeight: 70.0,
);
```

### Navigation with TBottomNavigationHelper
```dart
// To jump to the second tab (index 1)
TBottomNavigationHelper().jumpToTab(1, context);

// To push a new screen on the current tab's stack, keeping the NavBar visible
TBottomNavigationHelper().pushScreenWithNavBar(
  context,
  const DetailScreen(),
);

// To get the current active tab index
final currentIndex = TBottomNavigationHelper().getCurrentIndex(context: context);
```