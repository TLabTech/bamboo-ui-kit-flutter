# Colors

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
  color: HexColor(primary500),
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
