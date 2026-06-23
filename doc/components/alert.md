# Alert

A lightweight alert component for inline notifications and contextual messages.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage

```dart
TAlert(
  title: 'Placeholder',
  subtitle: 'Description',
);
```

## Variant

### Primary
```dart
TAlert.primary(
  title: 'Success',
  subtitle: 'Operation completed successfully.',
);
```
![Alert Primary Preview](../assets/alert/alert_primaary_preview.gif)

### Destructive
```dart
TAlert.destructive(
  title: 'Error',
  subtitle: 'There was a problem processing your request.',
);
```
![Alert Destructive Preview](../assets/alert/alert_destructive__preview.gif)

### Info
```dart
TAlert.info(
  title: 'Note',
  subtitle: 'This is additional information.',
);
```
![Alert Info Preview](../assets/alert/alert_info__preview.gif)

### Custom icon
```dart
TAlert(
  title: 'Custom',
  subtitle: 'Using a custom icon and colors.',
  icon: Icon(Icons.star, color: Colors.yellow),
  titleColor: Colors.deepPurple,
  subtitleColor: Colors.deepPurple,
  borderColor: Colors.deepPurple.shade100,
  backgroundColor: Colors.deepPurple.shade50,
);
```