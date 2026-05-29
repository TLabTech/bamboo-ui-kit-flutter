# Font

Provide consistent font.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage
```dart
class TextDisplayScreen extends StatelessWidget {
  const TextDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TFont Usage Example',
          style: TFontBold.title2(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is a Bold Headline',
              style: TFontBold.headline(context),
            ),
            const SizedBox(height: 16),
            Text(
              'This is regular body text with a font size of 17.',
              style: TFontRegular.body(context),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Variants

### Different font size
```dart
Text(
  'Main Page Title',
  style: TFontRegular.titleLarge(context),
);

// For a secondary section heading (22pt, Bold)
Text(
  'Section Header',
  style: TFontBold.title2(context),
);

// For a small, descriptive note (11pt, Regular)
Text(
  'Required field',
  style: TFontRegular.caption2(context),
);
```

### Customizing text
```dart
Text(
  'Important Note',
  style: TFontBold.footNote(context).copyWith(
    color: Colors.red,
    decoration: TextDecoration.underline,
  ),
);
```
