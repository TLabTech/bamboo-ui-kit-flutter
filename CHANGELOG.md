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
