# Spacing & Layout

## Spacing Scale

The design system uses a consistent 8px base unit for spacing:

| Token | Size | Usage |
|-------|------|-------|
| xs | 4px | Micro spacing between tightly related elements |
| sm | 8px | Small gaps between components |
| md | 16px | Standard padding/margin for components |
| lg | 24px | Large gaps between sections |
| xl | 32px | Extra large spacing for major sections |
| 2xl | 48px | Page-level spacing |

## Implementation

```dart
Padding(
  padding: EdgeInsets.all(16),      // md
  child: TButton(),
)

Padding(
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  child: THeader(),
)

Container(
  padding: const EdgeInsets.all(24),  // lg
  margin: const EdgeInsets.only(bottom: 16),  // md
  child: Text('Content'),
)
```

## Border Radius

| Size | Radius | Usage |
|------|--------|-------|
| sm | 4px | Small buttons, badges |
| md | 8px | Default (buttons, cards) |
| lg | 12px | Large containers |
| xl | 16px | Modals, bottom sheets |
| full | 9999px | Circular/pills |

## Layout Grid

- **Column-based layout**: Most screens use vertical scrolling with 24px horizontal padding
- **Safe areas**: Built-in padding on cards and sections to prevent overlap with notches
- **Responsive breakpoints**: Adapts to different screen sizes through MediaQuery
