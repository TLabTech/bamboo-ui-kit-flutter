# Bamboo Design System

A comprehensive design system and component library for Flutter applications, built on foundational design principles with a focus on consistency, accessibility, and developer experience.

**Version:** 1.0  
**Status:** Production  
**Last Updated:** May 2026

---

## Table of Contents

1. [Design Philosophy](#design-philosophy)
2. [Design System Architecture](#design-system-architecture)
3. [Typography System](#typography-system)
4. [Color Palette](#color-palette)
5. [Spacing & Layout](#spacing--layout)
6. [Shadow System](#shadow-system)
7. [Reusable Tokens](#reusable-tokens)
8. [Component Hierarchy](#component-hierarchy)
9. [Most Used Components](#most-used-components)
10. [Interaction Patterns](#interaction-patterns)
11. [Theme Management](#theme-management)
12. [Implementation Guidelines](#implementation-guidelines)

---

## Design Philosophy

### Core Principles

1. **Consistency First**: All components follow unified visual and behavioral patterns across the entire design system.
2. **Centralized Control**: Theme colors, typography, and spacing are managed through a single source of truth (`TTheme`).
3. **Accessibility & Clarity**: Components are designed with clear visual hierarchy and meaningful interactions.
4. **Developer Friendly**: Intuitive API and composition patterns reduce learning curve and implementation time.
5. **Dark & Light Mode Support**: Built-in theme switching enables seamless dark mode implementation.
6. **Scalability**: Token-based system allows easy customization and brand adaptation.

### Design Goals

- **Visual Consistency**: Ensure uniform appearance across all screens and interactions.
- **Semantic Clarity**: Components convey meaning through color, size, and behavior.
- **Performance First**: Optimized widget structure for smooth animations and fast interactions.
- **Reusability**: Components are composable and can be combined to build complex UIs.

---

## Design System Architecture

### Layer Structure

```
┌─────────────────────────────────────┐
│   Screens & Compositions             │  (App-level UI)
├─────────────────────────────────────┤
│   Components                         │  (TButton, TTextField, THeader, etc.)
├─────────────────────────────────────┤
│   Themed Components                  │  (TButtonPrimary, TButtonSecondary, etc.)
├─────────────────────────────────────┤
│   Foundation Layer                   │  (TTheme, TFont, Colors, Spacing)
├─────────────────────────────────────┤
│   Core Tokens                        │  (HexColor, TShadow, FontFamily)
└─────────────────────────────────────┘
```

### Core Classes

| Class | Purpose | Location |
|-------|---------|----------|
| `TTheme` | Centralized theme data with colors, typography, and styling tokens | `src/fondation/theme/theme.dart` |
| `TThemeManager` | BLoC-based state management for theme switching | `src/fondation/theme/theme_manager.dart` |
| `TThemeProvider` | Widget wrapper providing theme context to all children | `src/fondation/theme/theme_provider.dart` |
| `TFont` | Typography system with predefined text styles | `src/fondation/tfont.dart` |
| `HexColor` | Color palette with 50-950 variants for each color family | `src/fondation/hex_color.dart` |
| `TShadow` | Elevation system with 3 predefined shadow sizes | `src/fondation/utils/tshadow.dart` |
| `Container` | Reusable layout container with optional borders and styling | `src/fondation/container/container.dart` |

---

## Typography System

### Font Families

| Family | Usage | Weight Variants |
|--------|-------|-----------------|
| **Inter** | Primary font for all text content | Regular, Bold |
| **Monserrat** | Alternative font (theme-configurable) | Regular, Bold |

### Text Styles

Typography is managed through the `TFont` class with two weight categories:

#### Regular Weight (14-20 min)

```dart
TFontRegular.body(context)           // 17pt - Main body text
TFontRegular.titleLarge(context)     // 20pt - Large titles
TFontRegular.title1(context)         // 18pt - Primary section heading
TFontRegular.title2(context)         // 16pt - Secondary section heading
TFontRegular.footNote(context)       // 13pt - Small captions
TFontRegular.caption2(context)       // 11pt - Smallest text, labels
```

#### Bold Weight

```dart
TFontBold.headline(context)          // 22pt - Main headline/hero title
TFontBold.title2(context)            // 22pt - Bold section header
TFontBold.body(context)              // 17pt - Bold body text
TFontBold.footNote(context)          // 13pt - Bold captions
TFontBold.caption2(context)          // 11pt - Bold labels
```

### Usage Guidelines

- **Headlines**: Use `TFontBold.headline()` for page titles
- **Section Headers**: Use `TFontBold.title2()` for subsection headings
- **Body Text**: Use `TFontRegular.body()` for primary content
- **Labels & Captions**: Use `TFontRegular.caption2()` or `TFontBold.caption2()` for secondary information

### Customization Example

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

---

## Color Palette

### Semantic Color Tokens

The `TTheme` class defines semantic color roles that adapt based on light/dark mode:

| Token | Purpose | Light Value | Dark Value |
|-------|---------|-------------|-----------|
| **primary** | Main brand color, primary actions | `#00D89C` (Teal) | `#00D89C` (Teal) |
| **primaryForeground** | Text/content on primary background | `#EAFFF6` | `#005541` |
| **primaryPressed** | Primary button pressed state | `#00A474` | `#00A474` |
| **secondary** | Secondary brand color, complementary actions | `#049CFB` (Blue) | `#049CFB` (Blue) |
| **secondaryForeground** | Text/content on secondary background | `#EFF8FF` | `#052B4C` |
| **secondaryPressed** | Secondary button pressed state | `#0078D0` | `#0078D0` |
| **destructive** | Error/danger actions | `#E8463B` (Red) | `#E8463B` (Red) |
| **destructiveForeground** | Text/content on destructive background | `#FEF3F2` | `#95271F` |
| **destructivePressed** | Destructive button pressed state | `#D6372C` | `#D6372C` |
| **warning** | Warning/caution states | `#F5D741` (Yellow) | `#F5D741` (Yellow) |
| **warningForeground** | Text/content on warning background | `#FFFBEB` | `#654A1D` |
| **success** | Success/completion states | `#10B981` (Green) | `#10B981` (Green) |
| **successForeground** | Text/content on success background | `#ECFDF5` | `#064E3B` |
| **info** | Informational states | `#3B82F6` (Blue) | `#3B82F6` (Blue) |
| **infoForeground** | Text/content on info background | `#EFF6FF` | `#1E3A8A` |
| **background** | Page/screen background | `#FFFFFF` | `#121212` |
| **foreground** | Primary text color | `#353A45` | `#F6F7F9` |
| **muted** | Secondary/disabled states | `#F6F7F9` | `#23272E` |
| **mutedForeground** | Text/content on muted background | `#677489` | `#8995A7` |
| **card** | Card/surface background | `#FFFFFF` | `#23272E` |
| **border** | Borders, dividers | `#D6DAE1` | `#454E5F` |
| **input** | Input field background | `#FFFFFF` | `#3C4350` |
| **accent** | Accent/highlight color | `#EDEFF1` | `#3C4350` |

### Color Families (Scale 50-950)

Each primary color has 10 tones for flexible theming:

```dart
// Primary Color Family (Teal)
primary050 = '#EAFFF6'    // Lightest
primary100 = '#CDFEE7'
primary200 = '#A0FAD4'
primary300 = '#63F2BE'
primary400 = '#25E2A3'
primary500 = '#00D89C'    // Base
primary600 = '#00A474'    // Hover
primary700 = '#008360'    // Pressed
primary800 = '#00674E'
primary900 = '#005541'
primary950 = '#003026'    // Darkest

// Secondary Color Family (Blue)
secondary050 through secondary950 (similar structure)

// Gray Family (Neutral)
gray050 through gray950 (neutral scale)

// Red Family (Error/Destructive)
red050 through red950

// Yellow Family (Warning)
yellow050 through yellow950

// Green Family (Success)
green050 through green950

// Blue Family (Info)
blue050 through blue950
```

### Usage Patterns

```dart
// Direct color access via HexColor
Container(
  color: HexColor(primary500),  // Main teal
  child: Text('Content', style: TextStyle(color: HexColor(primary050))),
)

// Theme-based colors (responsive to light/dark mode)
Container(
  color: theme.primary,
  child: Text('Content', style: TextStyle(color: theme.primaryForeground)),
)

// Semantic usage in components
TAlert.destructive(title: 'Error occurred')  // Uses red palette
TBadge.success(label: 'Completed')           // Uses green palette
```

---

## Spacing & Layout

### Spacing Scale

The design system uses a consistent 8px base unit for spacing:

| Token | Size | Usage |
|-------|------|-------|
| xs | 4px | Micro spacing between tightly related elements |
| sm | 8px | Small gaps between components |
| md | 16px | Standard padding/margin for components |
| lg | 24px | Large gaps between sections |
| xl | 32px | Extra large spacing for major sections |
| 2xl | 48px | Page-level spacing |

### Implementation

```dart
// Using EdgeInsets
Padding(
  padding: EdgeInsets.all(16),      // md
  child: TButton(),
)

Padding(
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  child: THeader(),
)

// In Container
Container(
  padding: const EdgeInsets.all(24),  // lg
  margin: const EdgeInsets.only(bottom: 16),  // md
  child: Text('Content'),
)
```

### Layout Grid

- **Column-based layout**: Most screens use vertical scrolling with 24px horizontal padding
- **Safe areas**: Built-in padding on cards and sections to prevent overlap with notches
- **Responsive breakpoints**: Adapts to different screen sizes through MediaQuery

---

## Shadow System

### Elevation Levels

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

### Usage

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

---

## Reusable Tokens

### Token Categories

#### 1. **Color Tokens**

- **Semantic**: `theme.primary`, `theme.destructive`, `theme.warning`
- **Functional**: `theme.background`, `theme.foreground`, `theme.border`
- **Palette**: `HexColor(primary500)`, `HexColor(gray300)`, etc.

#### 2. **Typography Tokens**

- **Font Family**: `FontFamily.inter`, `FontFamily.monserrat`
- **Font Size**: 11pt - 22pt
- **Font Weight**: Regular (400), Bold (700)
- **Line Height**: Automatic (context-aware)

#### 3. **Spacing Tokens**

- **Base Unit**: 8px
- **Common Sizes**: 4, 8, 16, 24, 32, 48px

#### 4. **Shadow Tokens**

- **Levels**: Small, Medium, Large
- **Default Color**: `#F1F5F9` (light shadow)
- **Customizable**: Can override color per instance

#### 5. **Border Radius**

| Size | Radius | Usage |
|------|--------|-------|
| sm | 4px | Small buttons, badges |
| md | 8px | Default (buttons, cards) |
| lg | 12px | Large containers |
| xl | 16px | Modals, bottom sheets |
| full | 9999px | Circular/pills |

### Token Access Patterns

```dart
// 1. Via Theme Context (Theme-aware)
final theme = context.watch<TThemeManager>().state;
color = theme.primary;

// 2. Via HexColor (Fixed values)
color = HexColor(primary500);

// 3. Via Font Classes (Text-specific)
style = TFontBold.headline(context);

// 4. Via Constants (Spacing, shadows)
shadow = TShadow.shadowM();
padding = EdgeInsets.all(16);
```

---

## Component Hierarchy

### Component Tiers

#### Tier 1: Foundational Components (Core)

Basic building blocks that form the basis of all other components:

- **Avatar** - User profile images and initials
- **Badge** - Labels, tags, status indicators
- **Icon** - SVG and font-based icons

#### Tier 2: Form Components (Input)

User input and data collection:

- **Button** (5 variants: Primary, Secondary, Destructive, Outline, Ghost)
- **TextField** (3 variants: Email, Password, Multiline)
- **Checkbox** - Boolean selection
- **Radio** - Single selection from multiple options
- **Switch/Toggle** - Binary state control
- **Dropdown** - Single/multi-select with search
- **Slider** - Range input with custom thumb

#### Tier 3: Navigation Components

User navigation and wayfinding:

- **Header/AppBar** - Top navigation with title, actions
- **Bottom Navigation** - Tab-based navigation with persistent state
- **Breadcrumb** - Navigation hierarchy display
- **Tab** - Horizontal tabbed content

#### Tier 4: Data Presentation Components

Information display and visualization:

- **Progress/Loading** - Progress bars, spinners
- **Alert** - Message notifications (Primary, Destructive, Info)
- **Dialog** - Modal confirmations and content
- **Tile/List** - Structured data rows
- **Card** - Container for grouped content
- **Chart** - Data visualization (Line, Bar, Area)
- **Accordion** - Expandable content sections

#### Tier 5: Composite Components

Complex combinations of lower-tier components:

- **Header** (Homepage variant) - Profile with greeting
- **Bottom Navigation** - Multiple navigation styles
- **Calendar** - Date picker with navigation
- **Stepper** - Multi-step forms/wizards

---

## Most Used Components

### Based on Graph Analysis & Community Detection

#### 🔥 **Tier 1: Mission Critical**

These components are foundational and used across the entire system:

1. **Typography System (TFont)**
   - References: 50+ components
   - Purpose: All text styling
   - Priority: ⭐⭐⭐⭐⭐

2. **Theme System (TTheme, TThemeManager)**
   - References: 30+ components
   - Purpose: Centralized color & styling
   - Priority: ⭐⭐⭐⭐⭐

3. **Button Variants**
   - `TButtonPrimary` - Default CTA
   - `TButtonSecondary` - Alternative action
   - `TButtonDestructive` - Destructive actions
   - References: 25+ screens
   - Priority: ⭐⭐⭐⭐⭐

#### ⭐ **Tier 2: Highly Used**

4. **TextField**
   - Variants: Email, Password, Multiline
   - References: 15+ screens
   - Priority: ⭐⭐⭐⭐

5. **Header/AppBar**
   - Variants: Default, Nested, Homepage, Search
   - References: 12+ screens
   - Priority: ⭐⭐⭐⭐

6. **Bottom Navigation**
   - Purpose: Primary navigation pattern
   - References: 8+ screens
   - Priority: ⭐⭐⭐⭐

7. **Avatar**
   - Variants: Text, Image, Rounded, Circle
   - References: 10+ components
   - Priority: ⭐⭐⭐

#### 📊 **Tier 3: Regular Use**

8. **Accordion** - Collapsible sections
9. **Alert** - Notifications (Primary, Destructive, Info)
10. **Badge** - Tags, status indicators
11. **Checkbox/CheckboxGroup** - Multi-selection
12. **Radio/RadioGroup** - Single selection
13. **Dropdown** - Searchable dropdowns
14. **Slider** - Range input
15. **Stepper** - Multi-step forms
16. **Switch** - Toggle states
17. **Progress** - Loading indicators
18. **Dialog** - Modal content
19. **Breadcrumb** - Navigation paths
20. **Chart** - Data visualization
21. **Tab** - Tabbed content
22. **Tile** - List items

---

## Interaction Patterns

### 1. Button Interactions

```dart
// Primary CTA
TButtonPrimary(
  text: "Save",
  onPressed: () { /* Handle action */ },
  loading: false,  // Shows spinner when true
  longPressDuration: Duration(seconds: 3),
)

// Loading State
TButtonPrimary(
  text: "Submitting",
  loading: true,
  loadingColor: Colors.white,
  onPressed: () {},  // Disabled during loading
)
```

**Pattern**: Immediate feedback with disabled state during async operations.

### 2. Form Input Interactions

```dart
TTextField(
  hintText: "Enter email",
  controller: controller,
  onChange: (value) { /* Handle change */ },
  focusedBorderColor: theme.primary,  // Color feedback
  leading: Icon(...),  // Left icon
  actionWidget: Icon(...),  // Right icon
)
```

**Pattern**: Visual feedback on focus, optional leading/trailing icons.

### 3. Selection Interactions

```dart
// Single Selection
TRadioGroup<String>(
  options: ['Option 1', 'Option 2'],
  value: selected,
  onChanged: (value) { setState(() => selected = value); },
)

// Multi-Selection
TCheckboxGroup(
  items: checkboxItems,
  onChanged: (items) { /* Handle selection */ },
)

// Dropdown Search
TDropdownSearch<T>(
  list: items,
  value: selected,
  onChanged: (item) { /* Handle change */ },
  displayText: (item) => item.name,
)
```

**Pattern**: Clear visual indication of selection state.

### 4. Navigation Interactions

```dart
// Tab Navigation
TBottomNavigation(
  tabs: [
    TBottomNavigationItem(
      screen: HomeScreen(),
      activeIcon: Icon(Icons.home),
      title: 'Home',
    ),
  ],
  onTabChanged: (index) { /* Handle tab change */ },
)

// Breadcrumb Navigation
TBreadcrumb(
  items: [
    TBreadcrumbItem(label: 'Home', onTap: () {}),
    TBreadcrumbItem(label: 'Category', onTap: () {}),
  ],
)
```

**Pattern**: Persistent state and visual hierarchy for navigation.

### 5. Modal/Overlay Interactions

```dart
// Dialog
TDialog(
  title: 'Confirm Action',
  content: 'Are you sure?',
  primaryButton: TButtonPrimary(
    text: 'Confirm',
    onPressed: () => Navigator.pop(context),
  ),
  secondaryButton: TButtonSecondary(
    text: 'Cancel',
    onPressed: () => Navigator.pop(context),
  ),
)

// Alert Notification
TAlert.destructive(
  title: 'Error occurred',
  subtitle: 'Something went wrong',
)
```

**Pattern**: Clear action hierarchy, dismissible or confirming.

### 6. Loading States

```dart
// Progress Bar
TProgress(
  value: 0.75,  // 0.0 - 1.0
  backgroundColor: theme.border,
  foregroundColor: theme.primary,
)

// Stepper (Multi-step)
TStepper(
  currentStep: 1,
  steps: [
    StepItem(title: 'Step 1'),
    StepItem(title: 'Step 2'),
    StepItem(title: 'Step 3'),
  ],
)
```

**Pattern**: Clear progress indication for long operations.

### General Principles

| Principle | Implementation |
|-----------|-----------------|
| **Feedback** | Visual change on interaction (color, scale, shadow) |
| **Disabled State** | Reduced opacity or muted colors |
| **Loading State** | Spinner, disabled actions, clear messaging |
| **Error State** | Red/destructive color, error message |
| **Success State** | Green color, checkmark or confirmation |
| **Hover/Focus** | Highlight, shadow, or scale change |

---

## Theme Management

### Architecture

```
TThemeManager (BLoC)
    ↓
TTheme (immutable data)
    ↓
TThemeProvider (InheritedWidget wrapper)
    ↓
Child Widgets (context.watch<TThemeManager>())
```

### Setup at App Level

```dart
void main() {
  runApp(
    BlocProvider(
      create: (context) => TThemeManager(
        lightTheme: TTheme.light(),  // Custom or default
        darkTheme: TTheme.dark(),    // Custom or default
      ),
      child: const TThemeProvider(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TThemeManager, TTheme>(
      builder: (context, theme) {
        return MaterialApp(
          title: 'Bamboo Design System',
          debugShowCheckedModeBanner: false,
          theme: theme.themeData,  // ← Connect to MaterialApp
          home: const MyHomePage(),
        );
      },
    );
  }
}
```

### Theme Switching

```dart
// Toggle between light and dark
GestureDetector(
  onTap: () {
    final themeManager = context.read<TThemeManager>();
    final isDarkMode = themeManager.state == themeManager.darkTheme;
    themeManager.toggleTheme(!isDarkMode);
  },
  child: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
)
```

### Accessing Theme Colors

```dart
// In any widget
final theme = context.watch<TThemeManager>().state;

// Use semantic colors
Container(
  color: theme.primary,
  child: Text(
    'Content',
    style: TextStyle(color: theme.primaryForeground),
  ),
)

// Responsive to theme changes automatically
```

### Custom Theme Implementation

```dart
class CustomTheme {
  static TTheme createLightTheme() {
    return TTheme(
      primary: HexColor(primary500),
      primaryForeground: HexColor(primary050),
      // ... other tokens
      fontFamily: FontFamily.custom,
    );
  }

  static TTheme createDarkTheme() {
    return TTheme(
      primary: HexColor(primary500),
      primaryForeground: HexColor(primary900),
      // ... other tokens
    );
  }
}

// Use in main()
BlocProvider(
  create: (context) => TThemeManager(
    lightTheme: CustomTheme.createLightTheme(),
    darkTheme: CustomTheme.createDarkTheme(),
  ),
  child: TThemeProvider(child: MyApp()),
)
```

---

## Implementation Guidelines

### Best Practices

#### 1. **Always Use Theme Colors**

❌ Avoid hardcoding colors:
```dart
Container(color: Color(0xFF00D89C))
```

✅ Use theme-aware colors:
```dart
Container(color: theme.primary)
// or
Container(color: HexColor(primary500))
```

#### 2. **Semantic Component Usage**

❌ Don't override component variants:
```dart
TButtonPrimary(
  text: "Delete",
  backgroundColor: Colors.red,  // Wrong pattern
)
```

✅ Use appropriate variant:
```dart
TButtonDestructive(text: "Delete")
```

#### 3. **Consistent Spacing**

❌ Arbitrary padding:
```dart
Padding(padding: EdgeInsets.all(13), child: Child())
```

✅ Use consistent spacing scale:
```dart
Padding(padding: EdgeInsets.all(16), child: Child())  // md
Padding(padding: EdgeInsets.all(24), child: Child())  // lg
```

#### 4. **Font Styling**

❌ Manual text style creation:
```dart
Text('Headline', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
```

✅ Use TFont system:
```dart
Text('Headline', style: TFontBold.headline(context))
```

#### 5. **Component Composition**

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
  body: ListView(children: [...]),  // ListView for scrolling
)
```

### Common Patterns

#### Pattern 1: Loading State UI

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
          enabled: !isLoading,  // Disable during loading
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
      // API call
      await submitForm();
    } finally {
      setState(() => isLoading = false);
    }
  }
}
```

#### Pattern 2: Responsive Layout

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
            // Components adapt to screen size
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

#### Pattern 3: Theme-Aware Styling

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

### Performance Tips

1. **Memoize Heavy Widgets**: Use `const` constructors
2. **Avoid Unnecessary Rebuilds**: Use `context.watch()` only on widgets that need theme changes
3. **Lazy Load Images**: Use `CachedNetworkImage` or similar for Avatar images
4. **Reuse TextEditingControllers**: Don't recreate controllers on rebuild

---

## Component Reference

### Quick Import

```dart
import 'package:flutter_bamboo_ui_kit/core.dart';
```

### Available Components

| Component | Import | Variants |
|-----------|--------|----------|
| Button | Included | Primary, Secondary, Destructive, Outline, Ghost, Icon |
| TextField | Included | Default, Email, Password, Multiline |
| Checkbox | Included | Single, Group |
| Radio | Included | Single, Group |
| Switch | Included | Toggle |
| Dropdown | Included | Searchable |
| Accordion | Included | Default |
| Avatar | Included | Text, Image, Circle, Rounded |
| Badge | Included | Primary, Secondary, Destructive, Outline, General |
| Tile | Included | Single, Group |
| Header | Included | Default, Nested, Homepage, Search, Brand |
| Tab | Included | Default |
| Stepper | Included | Default |
| Alert | Included | Primary, Destructive, Info |
| Progress | Included | Bar |
| Dialog | Included | Default |
| Slider | Included | Default |
| Bottom Navigation | Included | Multiple styles (fixed, floating) |
| Calendar | Included | Date picker with navigation |
| Charts | Included | Line, Bar, Area |
| Breadcrumb | Included | Default |
| Title Section | Included | Default |

---

## Accessibility Considerations

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

---

## Versioning & Changelog

### Current Version: 1.0

**Stable Release**: Production ready with comprehensive component library, theme management, and design tokens.

For changelog details, see [CHANGELOG.md](../CHANGELOG.md)

---

## Contributing to Design System

When adding new components:

1. Follow established naming convention: `T<ComponentName>`
2. Support both light and dark themes
3. Use semantic color tokens, not hardcoded colors
4. Include multiple variants if applicable
5. Add comprehensive documentation with examples
6. Ensure accessibility standards compliance

For details, see [CONTRIBUTING.md](../CONTRIBUTING.md)

---

## Resources

- **GitHub Repository**: https://github.com/TLabTech/bamboo-ui-kit-flutter
- **Documentation Structure**: [Component Docs](./components/)
- **Architecture Graph**: [Graph Report](./architecture/GRAPH_REPORT.md)
- **Example App**: [Example Implementation](../example/)

---

**Last Updated**: May 2026  
**Maintained By**: TLab Team  
**License**: See LICENSE file
