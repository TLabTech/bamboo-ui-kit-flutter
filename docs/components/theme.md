# Theme

Overview
- A foundational set of classes (TTheme, TThemeManager, TThemeProvider) designed to manage the color palette, typography, and visual configuration of the entire application. It centralizes styling and allows for easy dynamic switching between light and dark modes.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
```

## Usage
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:example/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    // 1. Provide the TThemeManager at the root.
    BlocProvider(
      create: (context) => TThemeManager(
        // Optional: Use custom theme definitions
        // lightTheme: ThemeConfig().customLightTheme, 
        // darkTheme: ThemeConfig().customDarkTheme,
      ),
      // 2. Wrap the app with TThemeProvider to make the theme available.
      child: const TThemeProvider(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 3. Use BlocBuilder to rebuild the MaterialApp when the theme state changes.
    return BlocBuilder<TThemeManager, TTheme>(
      builder: (context, theme) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          // 4. Connect TTheme.themeData to MaterialApp.theme
          theme: theme.themeData, 
          home: const MyHomePage(title: "Bamboo UI Kit"),
        );
      },
    );
  }
}
```

## Additional Usage

### Toggling the theme
```dart
// Inside any widget build method or event handler:

GestureDetector(
  onTap: () {
    // 1. Determine the current state
    final themeManager = context.read<TThemeManager>();
    final isDarkMode = themeManager.state == themeManager.darkTheme;

    // 2. Call the toggle method to switch the theme
    themeManager.toggleTheme(!isDarkMode);
  },
  child: // ... A toggle button or icon
);
```

### Accessing theme color
```dart
// Inside a widget build method:

// Get the current TTheme object
final TTheme theme = context.read<TThemeManager>().state;

// Use theme properties for styling
return Scaffold(
  // Sets the scaffold background color using the theme's background color
  backgroundColor: theme.background, 
  body: Container(
    // Uses the primary color for a button or indicator
    decoration: BoxDecoration(
      color: theme.primary, 
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
```
