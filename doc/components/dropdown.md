# Dropdown

Overview
A flexible dropdown input for selecting a single value from a list. Use TDropdown for simple select lists and TDropdownSearch when you want an inline searchable select UI. Both components integrate with the library theme and support custom display mapping.

Features
- Simple single-value selection with onChanged callback.
- Generic support: build dropdowns for any value type (TDropdown<T>).
- Display mapping: provide itemLabel or displayText callbacks to convert items to strings.
- Searchable dropdown variant with text input and customizable border/background (TDropdownSearch).
- Works with maps, model objects, or primitive lists.


## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage
```dart
// Example items and state in a StatefulWidget
final items = [
  {"label": "1", "value": "Central Java"},
  {"label": "2", "value": "Central Borneo"},
  {"label": "3", "value": "Central Sumatra"},
  {"label": "4", "value": "Yogyakarta"},
  {"label": "5", "value": "Jakarta"},
];

String? selectedItem;

// Simple TDropdown with map items
TDropdown<Map<String, String>>(
  hintText: "Please select",
  items: items,
  value: selectedItem != null
      ? items.firstWhere((item) => item["value"] == selectedItem)
      : null,
  itemLabel: (item) => item["value"]!,
  onChanged: (newValue) {
    setState(() {
      selectedItem = newValue?["value"];
    });
  },
);
```

Preview

![Dropdown Preview](../assets/dropdown/dropdown_preview.gif)

## Additional Usage Examples

### Searchable dropdown
```dart
// TDropdownSearch with map items and custom displayText
TDropdownSearch<Map<String, String>>(
  hint: "Select province",
  list: items,
  value: selectedItem != null
      ? items.firstWhere((item) => item["value"] == selectedItem)
      : null,
  textEditingController: TextEditingController(),
  displayText: (Map<String, String> province) => province["value"] ?? '',
  onChanged: (Map<String, String> province) {
    setState(() {
      selectedItem = province["value"];
    });
  },
  backgroundColor: HexColor(baseWhite),
  borderColor: theme.border,
);
```

### Disable/placeholder
```dart
TDropdown<String>(
  hintText: "Choose option",
  items: ["Option A", "Option B", "Option C"],
  value: null, // no selection yet
  itemLabel: (item) => item,
  onChanged: null, // disabled when onChanged is null
);
```

### Custom Object
```dart
class Country { final String code; final String name; Country(this.code, this.name); }

final countries = [Country('ID', 'Indonesia'), Country('MY', 'Malaysia')];
Country? selectedCountry;

TDropdown<Country>(
  hintText: "Select country",
  items: countries,
  value: selectedCountry,
  itemLabel: (c) => c.name,
  onChanged: (c) => setState(() => selectedCountry = c),
);
```