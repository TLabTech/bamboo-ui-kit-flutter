# Text Field
A Text input component with variants for email, password, and multiline.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage
```dart
// Inside a StatefulWidget
final emailController = TextEditingController();

TTextField.email(
  hintText: "write your email",
  controller: emailController,
  onChange: (value) {
    // handle change
    print('Email: $value');
  },
);
```

Preview
![Text Field Preview](../assets/checkbox/text_field_preview.gif)

## Additional Usage

### Left Icon
```dart
TTextField(
  controller: TextEditingController(),
  hintText: "Notification",
  onChange: (value) {},
  leading: SvgPicture.asset(Assets.svg.bell,
    colorFilter: ColorFilter.mode(theme.mutedForeground, BlendMode.srcIn),
  ),
  onLeadingPressed: () {
    // handle leading icon tap
  },
);
```

### Right Icon
```dart
TTextField(
  controller: TextEditingController(),
  hintText: "Notification",
  onChange: (value) {},
  actionWidget: SvgPicture.asset(Assets.svg.bell,
    colorFilter: ColorFilter.mode(theme.mutedForeground, BlendMode.srcIn),
  ),
  onActionPressed: () {
    // handle action tap
  },
);
```

### Pasword
```dart
final passwordController = TextEditingController();
final focusNode = FocusNode();

TTextField.password(
  hintText: "write your password",
  controller: passwordController,
  focusedBorderColor: Colors.black,
  focusNode: focusNode,
  onChange: (value) {},
);
```

### Multiline
```dart
final descriptionController = TextEditingController();

TTextField.multiline(
  hintText: "write your description",
  controller: descriptionController,
  maxLines: null,
  onChange: (value) {},
  onSubmitted: (value) {},
);
```