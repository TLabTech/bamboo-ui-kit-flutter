# Breadcrumbs

Overview
- A horizontal breadcrumb navigation widget for showing the user's current location in a hierarchy and enabling quick navigation. Use TBreadcrumbs to display a trail of pages or sections with optional icons and customizable separators.

Features
- Render a flexible list of breadcrumb items (label and/or icon).
- Configurable maximum visible items with ellipsis when overflowed.
- Custom separator widget and direction (left-to-right or right-to-left).
- Clickable items via TBreadcrumbItem.onTap.

## 📦 Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

## Usage Example
```dart
TBreadcrumbs(
  items: [
    TBreadcrumbItem(
      onTap: () {},
      icon: SvgPicture.asset(Assets.svg.home),
    ),
    TBreadcrumbItem(
      onTap: () {},
      label: 'Navigation',
    ),
    TBreadcrumbItem(
      onTap: () {},
      label: 'Breadcrumbs',
    ),
  ],
)
```

UI Preview

![Breadcrumbs Preview](../assets/breadcrumbs/breadcrumbs_preview.gif)

## Variant

### Limit visible
````dart
TBreadcrumbs(
  maxVisibleItems: 4,
  items: [
    TBreadcrumbItem(onTap: () {}, icon: SvgPicture.asset(Assets.svg.home)),
    TBreadcrumbItem(onTap: () {}, label: 'Breadcrumb'),
    TBreadcrumbItem(onTap: () {}, label: 'Breadcrumb'),
    TBreadcrumbItem(onTap: () {}, label: 'Breadcrumb'),
    TBreadcrumbItem(onTap: () {}, label: 'Breadcrumb'),
  ],
)
````

### Direction
````dart
TBreadcrumbs(
  direction: BreadcrumbDirection.right,
  items: [
    TBreadcrumbItem(onTap: () {}, icon: SvgPicture.asset(Assets.svg.home)),
    TBreadcrumbItem(onTap: () {}, label: 'Section'),
    TBreadcrumbItem(onTap: () {}, label: 'Current Page'),
  ],
)
````
