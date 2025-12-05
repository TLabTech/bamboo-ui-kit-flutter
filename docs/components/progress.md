# Progress

A lightweight progress indicator with linear and circular variants.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage

```dart
TProgress(value: 0.5);
```

## Variant

### Circular
```dart
TProgress.circular(
  value: 0.75,
  size: 120,
  strokeWidth: 8.0,
  color: Colors.teal,
  backgroundColor: Colors.grey.shade200,
  valueColor: Colors.white,
);
```

### Linear
```dart
TProgress(
  value: 0.4,
  color: Colors.indigo,          
  backgroundColor: Colors.grey[300],
);
```