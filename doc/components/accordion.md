# Accordion

Overview
- A customizable collapsible panel (accordion) for grouping content. Use TAccordion to hide or reveal related UI, show nested sections, or create compact settings and details panels with animated expansion and theme-aware styling.

Features
- Expand/collapse with animated rotation for the trailing icon.
- Custom title text style and optional trailing widget.
- Optional decoration (border, background) via enableDecoration / decoration.
- Control initial state with initiallyExpanded.
- Optional divider below content with customizable color and thickness.
- Supports nesting (accordion inside accordion) for hierarchical content.
- Uses TThemeManager and TFont helpers for consistent theming.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage Example
```dart
TAccordion(
  title: "Default",
  titleStyle: TFontBold.headline(context),
  showDivider: false,
  initiallyExpanded: true,
  trailing: SvgPicture.asset(
    Assets.svg.chevronDown,
    colorFilter: ColorFilter.mode(
      isDarkMode ? Colors.white : Colors.black,
      BlendMode.srcIn,
    ),
  ),
  child: Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.all(0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: HexColor(gray300),
      ),
    ),
    child: Column(
      spacing: 8,
      children: [
        TAccordion(
          title: "Lorem ipsum dolor sit amet",
          initiallyExpanded: true,
          trailing: SvgPicture.asset(
            Assets.svg.chevronDown,
            colorFilter: ColorFilter.mode(
              isDarkMode ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
            style: TFontRegular.footNote(context).copyWith(
              color: HexColor(gray500),
            ),
          ),
        ),
        TAccordion(
          title: "Another item",
          initiallyExpanded: true,
          trailing: SvgPicture.asset(
            Assets.svg.chevronDown,
            colorFilter: ColorFilter.mode(
              isDarkMode ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          child: Text(
            'Additional content for the second accordion item.',
            style: TFontRegular.footNote(context).copyWith(
              color: HexColor(gray500),
            ),
          ),
        ),
        // Add more nested items as needed...
      ],
    ),
  ),
)
```

UI Preview

![Accordion Preview](../assets/accordion/accordion_preview.gif)

## Additional Usage Examples

### Basic accordion
```dart
TAccordion(
  title: "Order Details",
  child: Column(
    children: [
      Text("Order ID: 12345"),
      Text("Status: Shipped"),
    ],
  ),
  initiallyExpanded: false,
)
```

### Accordion with decoration and custom divider
```dart
TAccordion(
  title: "Profile",
  enableDecoration: true,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Colors.grey.shade200),
  ),
  borderColor: Colors.grey.shade300,
  borderWidth: 1.0,
  showDivider: true,
  trailing: Icon(Icons.expand_more),
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text("Profile details and actions go here."),
  ),
)
```

### Compact nested accordion
```dart
TAccordion(
  title: "Parent",
  initiallyExpanded: true,
  child: TAccordion(
    title: "Child",
    initiallyExpanded: false,
    child: Text("Nested content"),
  ),
)
```