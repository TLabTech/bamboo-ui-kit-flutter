# TLab Bamboo DLS
A custom widget library created by TLab for TLab.

## Features

The package provides the following components and utilities:

- [**Button**](doc/components/button.md): Various button styles and behaviors.
- [**Checkbox**](doc/components/check_box.md) & [**Checkbox group**](doc/components/check_box_group.md): Checkbox widget.
- [**Radio**](doc/components/radio.md) & [**Radio Group**](doc/components/radio_group.md): Radio Button widget.
- [**Switch**](doc/components/switch.md): Input controls for selection and toggles.
- [**Text Field**](doc/components/textfield.md) & [**Dropdown**](doc/components/dropdown.md): Form inputs and dropdown selectors.
- [**Accordion**](doc/components/accordion.md): Expandable content widget.
- [**Avatar**](doc/components/avatar.md) & [**Badge**](doc/components/badge.md): Avatar and badge components for identity and notifications.
- [**Tile**](doc/components/tile.md) & [**Header**](doc/components/header.md): Layout tiles and header components.
- [**Tab**](doc/components/tab.md) & [**Stepper**](doc/components/stepper.md): Tab navigation and stepper for multi-step flows.
- [**Alert**](doc/components/alert.md) & [**Dialog**](doc/components/dialog.md): Notification and interactive dialog components.
- [**Progress**](doc/components/progress.md) & [ **Slider**](doc/components/slider.md): Progress indicators and sliders for value input.
- [**Bottom Navigation**](doc/components/bottom_navigation.md): Bottom navigation with multiple styles.
- [**Calendar**](doc/components/calendar.md): Calendar widget.
- [**Charts**](doc/components/chart.md): Bar, pie, doughnut, line charts and more for data visualization.
- [**Breadcrumbs**](doc/components/breadcrumbs.md): Breadcrumb navigation.
- [**Font**](doc/components/font.md): font widget.
- [**Title Section**](doc/components/title_section.md): Section header to present a clear title.
- [**Theme**](doc/components/theme.md): Title components and theme management.

## Getting started

Add the package to your `pubspec.yaml`:

```dart
dependencies:
  flutter_bamboo_ui_kit:
```

## Usage

Example usage of a Text Field:

```dart
TTextField(
  label: "Full Name",
  hintText: "Enter your name",
  onChanged: (value) {
    print("Name: $value");
  },
)
```
