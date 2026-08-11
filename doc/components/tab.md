# Tab

Overview
- A horizontal tab bar that switches between content views using a `TabController`. Use `TTabs` to organize content into discrete sections with animated transitions between tabs.

Features
- Animated container with 200ms transition between selected/unselected states.
- Configurable colors for background, active tab, inactive tab, and text.
- Theme-aware defaults that follow light/dark mode.
- Works with `TabController` for programmatic tab switching.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage Example

```dart
TTabs(
  controller: tabController,
  tabs: ['Tab 1', 'Tab 2', 'Tab 3'],
  onTabSelected: (index) => print('Selected: $index'),
);
```

## Additional Usage

```dart
TTabs(
  controller: tabController,
  tabs: ['Overview', 'Details', 'Reviews'],
  onTabSelected: (index) => setState(() => currentTab = index),
  initialIndex: 1,
  activeColor: HexColor(primary500),
  inactiveColor: HexColor(gray200),
  activeTextColor: Colors.white,
  inactiveTextColor: HexColor(gray500),
);
```
