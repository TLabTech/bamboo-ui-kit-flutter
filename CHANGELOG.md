## 0.0.4

### Added

- `TButtonPrimary`, `TButtonSecondary`, `TButtonDestructive`, `TButtonOutline`, `TButtonGhost`, and `TButtonDisable`: new `loadingPosition` parameter (`TButtonLoadingPosition.leading` or `.trailing`) to render the loading spinner on either side of the text.
- `TButton*`: new `iconSpacing` parameter to control the gap between the icon/loading spinner and the text (default `10`).
- `TButton*`: new `spaceBetween` parameter to pin the leading icon/loading to the left edge and the trailing icon/loading to the right edge, with the text centered in between.
- New `TButtonLoadingPosition` enum.

### Documentation

- Added loading position, icon spacing, and space between usage examples to `doc/components/button.md`.
- Added "Button Icon Spacing" examples to `ButtonScreen`.

## 0.0.3

### Added

- `TBadge`: new `borderColor` parameter for custom badge borders.
- `TTile`: new `valueText`, `valueStyle`, and `valueDecoration` parameters for displaying styled value pills.
- `TTile`: new checkbox support via `showCheckbox`, `isChecked`, and `onCheckboxChanged`.
- `TCalendar`: new `selectableDayPredicate` to disable specific dates; disabled dates are dimmed and non-interactive.
- Example screens: custom accordion usage in `BadgeScreen` and updated `TileScreen`, `CalendarScreen`, and `SwitchScreen`.

### Changed

- `TDropdown`: set `isExpanded: true` for improved dropdown layout.
- `TTile`: hit-test behavior changed to `HitTestBehavior.opaque`.

### Fixed

- `TCalendar`: range and multi-select selections now respect `selectableDayPredicate`.

### Documentation

- Added `selectableDayPredicate` usage examples to `doc/components/calendar.md`.

## 0.0.2

- Miscellaneous fixes and improvements.
- Documentation updates.

## 0.0.1

* Initial public release of TLab Bamboo UI Kit.
