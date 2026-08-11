# Interaction Patterns

## Button Interactions

```dart
// Primary CTA
TButtonPrimary(
  text: "Save",
  onPressed: () { /* Handle action */ },
  loading: false,
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

## Form Input Interactions

```dart
TTextField(
  hintText: "Enter email",
  controller: controller,
  onChange: (value) { /* Handle change */ },
  focusedBorderColor: theme.primary,
  leading: Icon(...),
  actionWidget: Icon(...),
)
```

**Pattern**: Visual feedback on focus, optional leading/trailing icons.

## Selection Interactions

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

## Navigation Interactions

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

## Modal/Overlay Interactions

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

## Loading States

```dart
// Progress Bar
TProgress(
  value: 0.75,
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

## General Principles

| Principle | Implementation |
|-----------|-----------------|
| **Feedback** | Visual change on interaction (color, scale, shadow) |
| **Disabled State** | Reduced opacity or muted colors |
| **Loading State** | Spinner, disabled actions, clear messaging |
| **Error State** | Red/destructive color, error message |
| **Success State** | Green color, checkmark or confirmation |
| **Hover/Focus** | Highlight, shadow, or scale change |
