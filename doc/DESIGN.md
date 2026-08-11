# Bamboo Design System

A comprehensive design system and component library for Flutter applications, built on foundational design principles with a focus on consistency, accessibility, and developer experience.

**Version:** 0.0.3 | **Status:** Production | **Last Updated:** May 2026

---

## Design Philosophy

### Core Principles

1. **Consistency First**: All components follow unified visual and behavioral patterns across the entire design system.
2. **Centralized Control**: Theme colors, typography, and spacing are managed through a single source of truth (`TTheme`).
3. **Accessibility & Clarity**: Components are designed with clear visual hierarchy and meaningful interactions.
4. **Developer Friendly**: Intuitive API and composition patterns reduce learning curve and implementation time.
5. **Dark & Light Mode Support**: Built-in theme switching enables seamless dark mode implementation.
6. **Scalability**: Token-based system allows easy customization and brand adaptation.

---

## Design System Architecture

### Layer Structure

```
┌─────────────────────────────────────┐
│   Screens & Compositions            │  (App-level UI)
├─────────────────────────────────────┤
│   Components                        │  (TButton, TTextField, THeader, etc.)
├─────────────────────────────────────┤
│   Themed Components                 │  (TButtonPrimary, TButtonSecondary, etc.)
├─────────────────────────────────────┤
│   Foundation Layer                  │  (TTheme, TFont, Colors, Spacing)
├─────────────────────────────────────┤
│   Core Tokens                       │  (HexColor, TShadow, FontFamily)
└─────────────────────────────────────┘
```

### Core Classes

| Class | Purpose | Location |
|-------|---------|----------|
| `TTheme` | Centralized theme data with colors, typography, and styling tokens | `src/fondation/theme/theme.dart` |
| `TThemeManager` | BLoC-based state management for theme switching | `src/fondation/theme/theme_manager.dart` |
| `TThemeProvider` | Widget wrapper providing theme context to children | `src/fondation/theme/theme_provider.dart` |
| `TFont` | Typography system with predefined text styles | `src/fondation/tfont.dart` |
| `HexColor` | Color palette with 50-950 variants per color family | `src/fondation/hex_color.dart` |
| `TShadow` | Elevation system with 3 predefined shadow sizes | `src/fondation/utils/tshadow.dart` |

---

## Component Hierarchy

### Tier 1: Foundational Components
Avatar, Badge, Icon — basic building blocks.

### Tier 2: Form Components
Button (5 variants), TextField (3 variants), Checkbox, Radio, Switch, Dropdown, Slider.

### Tier 3: Navigation Components
Header/AppBar, Bottom Navigation, Breadcrumb, Tab.

### Tier 4: Data Presentation
Progress, Alert, Dialog, Tile, Card, Chart, Accordion.

### Tier 5: Composite Components
Header (Homepage variant), Bottom Navigation, Calendar, Stepper.

---

## Most Used Components

### Tier 1: Mission Critical
- **Typography System (TFont)** — 50+ references
- **Theme System (TTheme, TThemeManager)** — 30+ references
- **Button Variants** (Primary, Secondary, Destructive) — 25+ screens

### Tier 2: Highly Used
- **TextField, Header/AppBar, Bottom Navigation, Avatar**

### Tier 3: Regular Use
- Accordion, Alert, Badge, Checkbox, Radio, Dropdown, Slider, Stepper, Switch, Progress, Dialog, Breadcrumb, Chart, Tab, Tile

---

## Getting Started

| Section | Description |
|---------|-------------|
| [Theme Setup](guides/theme-setup.md) | Initialize TThemeManager, connect to MaterialApp, toggle dark/light |
| [Best Practices](guides/best-practices.md) | Coding conventions, common patterns, accessibility |

---

## Foundation

| Doc | Description |
|-----|-------------|
| [Colors](foundation/colors.md) | Color palette, semantic tokens (primary/destructive/success/etc), HexColor families |
| [Typography](foundation/typography.md) | TFont system, font weights (Regular/Bold), text sizes (11-22pt) |
| [Spacing](foundation/spacing.md) | 8px base unit, spacing scale (4/8/16/24/32/48), border radius |
| [Shadows](foundation/shadows.md) | TShadow elevation levels (S/M/L), usage patterns |

---

## Guides

| Doc | Description |
|-----|-------------|
| [Theme Setup](guides/theme-setup.md) | Theme initialization, switching, accessing colors, custom themes |
| [Interaction Patterns](guides/interaction-patterns.md) | Button, form, selection, navigation, modal, loading patterns |
| [Best Practices](guides/best-practices.md) | Do's & don'ts, common patterns (loading/responsive/theme-aware), accessibility |

---

## Components

| Component | Doc | Variants |
|-----------|-----|----------|
| Accordion | [accordion.md](components/accordion.md) | Default |
| Alert | [alert.md](components/alert.md) | Primary, Destructive, Info |
| Avatar | [avatar.md](components/avatar.md) | Text, Image, Circle, Rounded |
| Badge | [badge.md](components/badge.md) | Primary, Secondary, Destructive, Outline, General |
| Bottom Navigation | [bottom_navigation.md](components/bottom_navigation.md) | Fixed, Floating |
| Breadcrumb | [breadcrumbs.md](components/breadcrumbs.md) | Default |
| Button | [button.md](components/button.md) | Primary, Secondary, Destructive, Outline, Ghost, Icon |
| Calendar | [calendar.md](components/calendar.md) | Date picker |
| Charts | [chart.md](components/chart.md) | Line, Bar, Area |
| Checkbox | [check_box.md](components/check_box.md) | Single, Group |
| Dialog | [dialog.md](components/dialog.md) | Default |
| Dropdown | [dropdown.md](components/dropdown.md) | Searchable |
| Header | [header.md](components/header.md) | Default, Nested, Homepage, Search, Brand |
| Progress | [progress.md](components/progress.md) | Bar |
| Radio | [radio.md](components/radio.md) | Single, Group |
| Slider | [slider.md](components/slider.md) | Default |
| Stepper | [stepper.md](components/stepper.md) | Default |
| Switch | [switch.md](components/switch.md) | Toggle |
| Tab | [tab.md](components/tab.md) | Default |
| TextField | [textfield.md](components/textfield.md) | Default, Email, Password, Multiline |
| Tile | [tile.md](components/tile.md) | Single, Group |
| Title Section | [title_section.md](components/title_section.md) | Default |

---

## Resources

- **GitHub**: https://github.com/TLabTech/bamboo-ui-kit-flutter
- **Architecture Graph**: [graph.html](../graphify-out/graph.html) | [GRAPH_REPORT.md](../graphify-out/GRAPH_REPORT.md)
- **Example App**: [../example/](../example/)
- **Changelog**: [../CHANGELOG.md](../CHANGELOG.md)
- **Contributing**: [../CONTRIBUTING.md](../CONTRIBUTING.md)

---

**Maintained By**: TLab Team
