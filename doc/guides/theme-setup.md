# Theme Setup

## Architecture

```
TThemeManager (BLoC)
    ↓
TTheme (immutable data)
    ↓
TThemeProvider (InheritedWidget wrapper)
    ↓
Child Widgets (context.watch<TThemeManager>())
```

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
```

## Setup at App Level

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => TThemeManager(
        // Optional: Use custom theme definitions
        // lightTheme: CustomTheme.createLightTheme(),
        // darkTheme: CustomTheme.createDarkTheme(),
      ),
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
    return BlocBuilder<TThemeManager, TTheme>(
      builder: (context, theme) {
        return MaterialApp(
          title: 'Bamboo Design System',
          debugShowCheckedModeBanner: false,
          theme: theme.themeData,
          home: const MyHomePage(),
        );
      },
    );
  }
}
```

## Theme Switching

```dart
GestureDetector(
  onTap: () {
    final themeManager = context.read<TThemeManager>();
    final isDarkMode = themeManager.state == themeManager.darkTheme;
    themeManager.toggleTheme(!isDarkMode);
  },
  child: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
)
```

## Accessing Theme Colors

```dart
final theme = context.watch<TThemeManager>().state;

Container(
  color: theme.primary,
  child: Text(
    'Content',
    style: TextStyle(color: theme.primaryForeground),
  ),
)
```

## Custom Theme

```dart
class CustomTheme {
  static TTheme createLightTheme() {
    return TTheme(
      primary: HexColor(primary500),
      primaryForeground: HexColor(primary050),
      fontFamily: FontFamily.custom,
      // ... other tokens
    );
  }

  static TTheme createDarkTheme() {
    return TTheme(
      primary: HexColor(primary500),
      primaryForeground: HexColor(primary900),
      // ... other tokens
    );
  }
}

// Use in main()
BlocProvider(
  create: (context) => TThemeManager(
    lightTheme: CustomTheme.createLightTheme(),
    darkTheme: CustomTheme.createDarkTheme(),
  ),
  child: TThemeProvider(child: MyApp()),
)
```
