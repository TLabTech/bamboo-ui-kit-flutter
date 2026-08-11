# Shadows

## Elevation Levels

Three predefined shadow levels for depth and hierarchy:

```dart
// Shadow Small (UI elements, cards)
TShadow.shadowS(color: Color)
// Offset: (0, 4), Blur: 4px

// Shadow Medium (Modals, elevated buttons)
TShadow.shadowM(color: Color)
// Offset: (0, 8), Blur: 8px

// Shadow Large (Floating components, top-level overlays)
TShadow.shadowL(color: Color)
// Offset: (0, 16), Blur: 16px
```

## Usage

```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    boxShadow: [TShadow.shadowM()],  // Default color: #F1F5F9
  ),
  child: TCard(),
)

// With custom color
Container(
  decoration: BoxDecoration(
    boxShadow: [
      TShadow.shadowL(color: theme.primary.withOpacity(0.2))
    ],
  ),
)
```
