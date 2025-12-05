# TLab Bamboo DLS
A custom widget library created by TLab for TLab.

## Features

The package provides the following components and utilities:

- [**Button**](docs/components/button.md): Various button styles and behaviors.
- [**Checkbox**](docs/components/check_box.md) & [**Checkbox group**](docs/components/check_box_group.md): Checkbox widget.
- [**Radio**](docs/components/radio.md) & [**Radio Group**](docs/components/radio_group.md): Radio Button widget.
- [**Switch**](docs/components/switch.md): Input controls for selection and toggles.
- [**Text Field**](docs/components/textfield.md) & [**Dropdown**](docs/components/dropdown.md): Form inputs and dropdown selectors.
- [**Accordion**](docs/components/accordion.md): Expandable content widget.
- [**Avatar**](docs/components/avatar.md) & [**Badge**](docs/components/badge.md): Avatar and badge components for identity and notifications.
- [**Tile**](docs/components/tile.md) & [**Header**](docs/components/header.md): Layout tiles and header components.
- [**Tab**](docs/components/tab.md) & [**Stepper**](docs/components/stepper.md): Tab navigation and stepper for multi-step flows.
- [**Alert**](docs/components/alert.md) & [**Dialog**](docs/components/dialog.md): Notification and interactive dialog components.
- [**Progress**](docs/components/progress.md) & [ **Slider**](docs/components/slider.md): Progress indicators and sliders for value input.
- [**Bottom Navigation**](docs/components/bottom_navigation.md): Bottom navigation with multiple styles.
- [**Calendar**](docs/components/calendar.md): Calendar widget.
- [**Charts**](docs/components/chart.md): Bar, pie, doughnut, line charts and more for data visualization.
- [**Breadcrumbs**](docs/components/breadcrumbs.md): Breadcrumb navigation.
- [**Font**](docs/components/font.md): font widget.
- [**Title Section**](docs/components/title_section.md): Section header to present a clear title.
- [**Theme**](docs/components/theme.md): Title components and theme management.

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
