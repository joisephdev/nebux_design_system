# Nebux Design System

[![pub package](https://img.shields.io/pub/v/nebux_design_system.svg)](https://pub.dev/packages/nebux_design_system)
[![CI](https://github.com/joisephdev/nebux_design_system/actions/workflows/ci.yml/badge.svg)](https://github.com/joisephdev/nebux_design_system/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-blue.svg)](https://flutter.dev)

A production-ready Flutter design system that provides consistent theming, typography, spacing, and UI components for modern applications.

## Installation

```yaml
dependencies:
  nebux_design_system: ^1.0.3
```

```bash
flutter pub get
```

## Quick Start

### 1. Configure the theme

```dart
import 'package:nebux_design_system/nebux_design_system.dart';

MaterialApp(
  theme: NebuxTheme.createThemeData(
    isDark: false,
    colors: NebuxColors.standardLight(),
    fontSize: NebuxFontSize.standard(),
    typography: NebuxTypography.standard(),
  ),
  darkTheme: NebuxTheme.createThemeData(
    isDark: true,
    colors: NebuxColors.standardDark(),
    fontSize: NebuxFontSize.standard(),
    typography: NebuxTypography.standard(),
  ),
);
```

### 2. Build with components

```dart
NbxScaffold(
  widgetName: 'MyScreen',
  appBarConfig: AppBarConfig(title: 'Welcome', showDivider: true),
  body: Column(
    children: [
      Text('Hello', style: context.nebuxTypography.heading),
      heightSpace16,
      NbxButton(
        text: 'Get Started',
        onPressed: () {},
        styleConfig: ButtonStyleConfig(variant: ButtonVariant.filled),
      ),
      heightSpace12,
      NbxTextFieldWidget(
        NbxInputParameters(
          hintText: 'Enter your email',
          labelText: 'Email',
          inputType: NbxInputType.email,
          isRequired: true,
          context: context,
        ),
      ),
    ],
  ),
);
```

## Components

### NbxButton

Configurable button with 4 variants: `filled`, `outline`, `text`, `danger`.

```dart
// Basic
NbxButton(
  text: 'Save',
  onPressed: () {},
  styleConfig: ButtonStyleConfig(variant: ButtonVariant.filled),
)

// With icon and custom style
NbxButton(
  text: 'Continue',
  onPressed: () {},
  iconConfig: ButtonIconConfig(
    icon: Icons.arrow_forward,
    iconColor: Colors.white,
  ),
  styleConfig: ButtonStyleConfig(
    variant: ButtonVariant.filled,
    customBackgroundColor: Colors.blue,
    borderRadius: 12.0,
  ),
  stateConfig: ButtonStateConfig(isLoading: false, enabled: true),
  layoutConfig: ButtonLayoutConfig(isExpanded: true),
)
```

### NbxTextFieldWidget

Text input with built-in validation for multiple input types.

```dart
// Email with validation
NbxTextFieldWidget(
  NbxInputParameters(
    hintText: 'Enter your email',
    labelText: 'Email',
    inputType: NbxInputType.email,
    isRequired: true,
    requiredErrorMessage: 'Email is required',
    context: context,
  ),
)

// Password with visibility toggle
NbxTextFieldWidget(
  NbxInputParameters(
    hintText: 'Enter your password',
    labelText: 'Password',
    inputType: NbxInputType.password,
    showEyeIcon: true,
    isRequired: true,
    context: context,
  ),
)
```

**Available input types:** `text`, `email`, `password`, `number`, `phone`, `decimalNumber`, `onlyText`, `textAndNumbers`, `alphabet`, `free`, `dropdownMenu`

**Decoration styles:** `floating` (default), `outlined`, `filled`

### NbxPhoneFieldWidget

Combined country picker + phone number input with automatic length validation per country.

```dart
NbxPhoneFieldWidget(
  inputParameters: NbxInputParameters(
    hintText: 'Phone number',
    labelText: 'Phone',
    inputType: NbxInputType.phone,
    context: context,
  ),
  countryPickerParameters: NbxCountryPickerParameters(),
)
```

### NbxCountryPickerInput

Standalone country selector with search, i18n (25+ languages), and customizable modal.

```dart
NbxCountryPickerInput(
  countryPickerParameters: NbxCountryPickerParameters(
    showPhoneCode: true,
  ),
  inputParameters: NbxInputParameters(
    hintText: 'Select country',
    labelText: 'Country',
    context: context,
  ),
)
```

### NbxScaffold

Enhanced scaffold with configurable app bar, safe area, body wrapping, and double-back-to-exit.

```dart
NbxScaffold(
  widgetName: 'ProfileScreen',
  appBarConfig: AppBarConfig(
    title: 'Profile',
    showDivider: true,
    actions: [
      IconButton(icon: Icon(Icons.settings), onPressed: () {}),
    ],
  ),
  safeAreaConfig: SafeAreaConfig(bottom: false),
  body: YourContent(),
)
```

### NbxNetworkImage

Cached network image with loading and error states.

```dart
NbxNetworkImage(
  imageUrl: 'https://example.com/avatar.jpg',
  width: 80,
  height: 80,
  fit: BoxFit.cover,
)
```

### Shimmers

Skeleton loading widgets for building placeholder UIs while content loads.

```dart
// Single container
NbxShimmerContainer(style: ShimmerSkeletonStyle(width: 200, height: 20))

// List of skeleton lines
NbxShimmerContainerList(
  direction: Axis.vertical,
  itemCount: 3,
  style: ShimmerSkeletonStyle(height: 16),
)

// List tile skeleton (avatar + text lines)
NbxShimmerListTile(
  hasLeading: true,
  hasSubtitle: true,
  hasParagraph: true,
)

// Grid of skeleton icons
NbxShimmerGrid(crossAxisCount: 4, itemCount: 8)

// Full list view of skeleton tiles
NbxShimmerListTileListView(itemCount: 5)
```

## Theme System

### Colors

Access semantic colors via context extensions:

```dart
final colors = context.nebuxColors;

colors.primary           // Main brand color
colors.secondary         // Secondary actions
colors.accent            // Highlights

colors.success           // Positive states
colors.warning           // Caution states
colors.error             // Error states
colors.info              // Informational

colors.background        // App background
colors.surface           // Card/surface backgrounds
colors.textPrimary       // Primary text
colors.textSecondary     // Secondary text

colors.primaryGradient   // Brand gradient
colors.secondaryGradient // Secondary gradient
```

### Typography

Consistent text styles powered by Google Fonts (Montserrat):

```dart
final typography = context.nebuxTypography;

typography.heading          // 18px, semibold
typography.section          // 14px, medium
typography.content          // 12px, regular
typography.paragraph        // 14px, regular
typography.caption          // 10px, regular
typography.label            // 10px, medium
typography.primaryAction    // 14px, bold
typography.secondaryAction  // 14px, semibold
typography.formInput        // 14px, regular
typography.placeholder      // 14px, regular, italic
```

### Custom Theme

```dart
final customColors = NebuxColors(
  primary: Color(0xFF6200EE),
  secondary: Color(0xFF03DAC6),
  // ... all color properties
);

final customTypography = NebuxTypography.custom(
  heading: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
  // ... all text styles
);

NebuxTheme.createThemeData(
  isDark: false,
  colors: customColors,
  fontSize: NebuxFontSize.standard(),
  typography: customTypography,
);
```

## Extensions

### Context

```dart
final colors = context.nebuxColors;
final typography = context.nebuxTypography;
final theme = context.nebuxTheme;
```

### Padding & Margin

```dart
Widget().nbxPaddingHorizontal(16)
Widget().nbxPaddingVertical(12)
Widget().nbxPaddingSymmetric(horizontal: 16, vertical: 8)

Widget().marginAll(8)
Widget().marginLeft(16)
Widget().marginSymmetric(horizontal: 12, vertical: 4)
```

### Spacing Constants

Pre-built `SizedBox` constants for consistent layouts:

```dart
Column(
  children: [
    Text('Title'),
    heightSpace16,    // SizedBox(height: 16)
    Text('Subtitle'),
    heightSpace8,     // SizedBox(height: 8)
    Text('Body'),
  ],
)

// Available: heightSpace2, 4, 6, 8, 10, 12, 15, 16, 20, 24, 25, 30, 32, 40, 48, 50, 60, 64, 80, 100, 200
// Available: widthSpace2, 4, 6, 8, 10, 12, 14, 15, 16, 18, 20, 24, 25, 48
```

## Utilities

```dart
// Debouncer
final debouncer = NebuxDebouncer(milliseconds: 500);
debouncer.run(() => performSearch(query));

// String helpers
NebuxUtils.capitalize('hello world');       // 'Hello world'
NebuxUtils.truncateText('Long text', 10);   // 'Long text...'
NebuxUtils.isValidString('');               // false

// Platform detection
NebuxUtils.isWeb;
NebuxUtils.isMobile;
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes
4. Push and open a Pull Request

CI runs `flutter analyze` and `flutter test` on every PR.

## License

MIT License - see [LICENSE](LICENSE) for details.

---

**Made with ❤️ by [Nebux Labs](https://github.com/joisephdev)**
