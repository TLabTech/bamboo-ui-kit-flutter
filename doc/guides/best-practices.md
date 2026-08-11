# Best Practices

## Always Use Theme Colors

❌ Avoid hardcoding colors:
```dart
Container(color: Color(0xFF00D89C))
```

✅ Use theme-aware colors:
```dart
Container(color: theme.primary)
Container(color: HexColor(primary500))
```

## Semantic Component Usage

❌ Don't override component variants:
```dart
TButtonPrimary(
  text: "Delete",
  backgroundColor: Colors.red,
)
```

✅ Use appropriate variant:
```dart
TButtonDestructive(text: "Delete")
```

## Consistent Spacing

❌ Arbitrary padding:
```dart
Padding(padding: EdgeInsets.all(13), child: Child())
```

✅ Use consistent spacing scale:
```dart
Padding(padding: EdgeInsets.all(16), child: Child())  // md
Padding(padding: EdgeInsets.all(24), child: Child())  // lg
```

## Font Styling

❌ Manual text style creation:
```dart
Text('Headline', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
```

✅ Use TFont system:
```dart
Text('Headline', style: TFontBold.headline(context))
```

## Component Composition

❌ Nesting too many widgets:
```dart
Scaffold(
  body: SingleChildScrollView(
    child: Column(children: [...]),
  ),
)
```

✅ Keep component hierarchy clean:
```dart
Scaffold(
  appBar: THeader(title: 'Page'),
  body: ListView(children: [...]),
)
```

## Common Patterns

### Loading State UI

```dart
class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TTextField(
          controller: emailController,
          hintText: "Email",
          enabled: !isLoading,
        ),
        SizedBox(height: 16),
        TButtonPrimary(
          text: "Submit",
          loading: isLoading,
          onPressed: isLoading ? null : handleSubmit,
        ),
      ],
    );
  }

  Future<void> handleSubmit() async {
    setState(() => isLoading = true);
    try {
      await submitForm();
    } finally {
      setState(() => isLoading = false);
    }
  }
}
```

### Responsive Layout

```dart
class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: THeader(title: 'Responsive'),
      body: Padding(
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        child: Column(
          children: [
            TTextField(hintText: "Name"),
            SizedBox(height: isMobile ? 16 : 24),
            TButtonPrimary(text: "Submit"),
          ],
        ),
      ),
    );
  }
}
```

### Theme-Aware Styling

```dart
class ThemeAwareWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TThemeManager, TTheme>(
      builder: (context, theme) {
        return Container(
          color: theme.background,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [TShadow.shadowM(color: theme.primary.withOpacity(0.2))],
                ),
                child: Text(
                  'Primary Section',
                  style: TFontBold.headline(context).copyWith(
                    color: theme.primaryForeground,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
```

## Performance Tips

1. **Memoize Heavy Widgets**: Use `const` constructors
2. **Avoid Unnecessary Rebuilds**: Use `context.watch()` only on widgets that need theme changes
3. **Lazy Load Images**: Use `CachedNetworkImage` or similar for Avatar images
4. **Reuse TextEditingControllers**: Don't recreate controllers on rebuild

## Accessibility

### Color Contrast

All text meets WCAG AA standards:
- Normal text: 4.5:1 contrast ratio minimum
- Large text: 3:1 contrast ratio minimum

### Semantic Structure

- Use `Semantics` widgets for screen reader support
- Label form fields clearly
- Provide `onPressed` callbacks with meaningful labels

### Touch Targets

Minimum touch target size: 48x48 dp (Material Design recommendation)

### Dark Mode

All components automatically adapt to dark mode through theme system.
