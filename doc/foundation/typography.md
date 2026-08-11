# Typography

## Font Families

| Family | Usage | Weight Variants |
|--------|-------|-----------------|
| **Inter** | Primary font for all text content | Regular, Bold |
| **Monserrat** | Alternative font (theme-configurable) | Regular, Bold |

## Text Styles

Typography is managed through the `TFont` class with two weight categories:

### Regular Weight

```dart
TFontRegular.body(context)           // 17pt - Main body text
TFontRegular.titleLarge(context)     // 20pt - Large titles
TFontRegular.title1(context)         // 18pt - Primary section heading
TFontRegular.title2(context)         // 16pt - Secondary section heading
TFontRegular.footNote(context)       // 13pt - Small captions
TFontRegular.caption2(context)       // 11pt - Smallest text, labels
```

### Bold Weight

```dart
TFontBold.headline(context)          // 22pt - Main headline/hero title
TFontBold.title2(context)            // 22pt - Bold section header
TFontBold.body(context)              // 17pt - Bold body text
TFontBold.footNote(context)          // 13pt - Bold captions
TFontBold.caption2(context)          // 11pt - Bold labels
```

## Usage Guidelines

- **Headlines**: Use `TFontBold.headline()` for page titles
- **Section Headers**: Use `TFontBold.title2()` for subsection headings
- **Body Text**: Use `TFontRegular.body()` for primary content
- **Labels & Captions**: Use `TFontRegular.caption2()` or `TFontBold.caption2()` for secondary information

## Customization

```dart
Text(
  'Custom Text',
  style: TFontBold.body(context).copyWith(
    color: theme.primary,
    decoration: TextDecoration.underline,
    letterSpacing: 0.5,
  ),
);
```
