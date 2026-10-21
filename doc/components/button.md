# Button

A button.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage

```dart
TButtonPrimary(
  text: "Save",
  onPressed: () { /* ... */ },
);
```

## Variant

### Primary

```dart
TButtonPrimary(
  text: "Button Primary",
  onPressed: () {},
  onLongPress: () {},
  loading: false,
  longPressDuration: Duration(seconds: 3),
);
```
![Button Primary Preview](../assets/button/button_primaary_preview.gif)

### Secondary
```dart
TButtonSecondary(
  text: "Button Secondary",
  onPressed: () {},
  onLongPress: () {},
  longPressDuration: Duration(seconds: 3),
);
```
![Button Secondary Preview](../assets/button/button_secondary_preview.gif)

### Destructive
```dart
TButtonDestructive(
  text: "Button Destructive",
  onPressed: () {},
);
```
![Button Destructive Preview](../assets/button/button_destructive_preview.gif)

### Outline
```dart
TButtonOutline(
  text: "Button Outline",
  onPressed: () {},
);
```
![Button Outline Preview](../assets/button/button_outline_preview.gif)

### Ghost
```dart
TButtonGhost(
  text: "Button Ghost",
  textStyle: TFontBold.body(context).copyWith(color: HexColor(primary500)),
  onPressed: () {},
);
```
![Button Ghost Preview](../assets/button/button_ghost_preview.gif)

### Disable
```dart
TButtonDisable(
  text: "Button Disable",
  onPressed: null, // disabled
);
```
![Button Disable Preview](../assets/button/button_disable_preview.gif)

### Icon only

```dart
TButtonPrimary.icon(
  icon: Icon(Icons.add, color: Colors.white),
  onPressed: () {},
);
```
![Button Icon Preview](../assets/button/button_icon_preview.gif)

### Loading

```dart
TButtonPrimary(
  text: "Submitting",
  loading: true,
  loadingColor: Colors.white,
  onPressed: () {}, // will be ignored while loading == true
);
```
![Button Loading Preview](../assets/button/button_loading_preview.gif)

By default the spinner is shown on the leading (left) side. Use
`loadingPosition` to render it on the trailing (right) side, keeping the
`prefixIcon` visible:

```dart
TButtonPrimary(
  text: "Submitting",
  loading: true,
  loadingPosition: TButtonLoadingPosition.trailing,
  onPressed: () {},
);
```

### Icon spacing

Use `iconSpacing` to control the gap between the icon (or the loading spinner)
and the text. Default is `10`.

```dart
TButtonPrimary(
  text: "Button Primary",
  iconSpacing: 16,
  prefixIcon: Icon(Icons.add, color: Colors.white),
  onPressed: () {},
);
```

### Space between

Set `spaceBetween: true` to push the leading icon/loading to the left edge and
the trailing icon/loading to the right edge, with the text centered in between.

```dart
TButtonPrimary(
  text: "Delete",
  spaceBetween: true,
  prefixIcon: Icon(Icons.delete, color: Colors.white),
  suffixIcon: Icon(Icons.chevron_right, color: Colors.white),
  onPressed: () {},
);
```

### Long-press (custom duration)

```dart
TButtonPrimary(
  text: "Hold me",
  onPressed: () { print('tap'); },
  onLongPress: () { print('long press'); },
  longPressDuration: Duration(milliseconds: 600),
);
```