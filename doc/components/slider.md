# Slider

Overview
- TSlider is a themable, easy-to-use slider component with a custom thumb design. Use it to capture numeric input along a continuum (0.0–1.0 by default) in forms, settings, or interactive controls. It exposes simple callbacks and color hooks for quick customization.

Features
- Simple value binding with onChanged callback.
- Custom thumb shape rendered by CustomSliderThumb for a distinct visual style.
- Theming support via TThemeManager (uses theme.primary / theme.primaryForeground).
- Customizable active/inactive track colors and thumb inner/outer colors.
- Easy drop-in replacement for Flutter's Slider with consistent UX.

Import

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage
```dart
// Inside a StatefulWidget:
double sliderValue = 0.5;

TSlider(
  value: sliderValue,
  onChanged: (newValue) {
    setState(() {
      sliderValue = newValue;
    });
  },
);
```

Preview

![Slider Preview](../assets/checkbox/slider_preview.gif)

## Additional Usage
```dart
TSlider(
  value: sliderValue,
  onChanged: (v) => setState(() => sliderValue = v),
  activeColor: Colors.teal,
  inactiveColor: Colors.grey.shade300,
  thumbInnerColor: Colors.white,
  thumbOuterColor: Colors.tealAccent,
);
```