# Nebux Design System

[![pub package](https://img.shields.io/pub/v/nebux_design_system.svg)](https://pub.dev/packages/nebux_design_system)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.8.1+-blue.svg)](https://dart.dev)

> A comprehensive, production-ready Flutter design system package that provides consistent theming, typography, spacing, and UI components for modern Flutter applications.

## 🚀 Features

- **Complete Theme System** - Light and dark mode support with customizable color schemes
- **Advanced Typography** - Google Fonts integration with consistent text styles and scales
- **Smart Components** - 15+ production-ready UI components with multiple variants
- **Spacing System** - Standardized spacing utilities and responsive design support
- **Color Management** - Comprehensive color system with gradients and semantic naming
- **Developer Experience** - Type-safe APIs, extensive documentation, and Flutter extensions
- **Accessibility** - WCAG compliant components with proper semantic structure
- **Enhanced Customization** - Custom background colors, flexible typography overrides, and improved input styling

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  nebux_design_system: ^0.0.8
```

Then run:

```bash
flutter pub get
```

## ⚠️ Breaking Changes in v0.0.8

### Button Variant Changes

The button variants have been renamed for better clarity:

| Old Variant               | New Variant            | Description             |
| ------------------------- | ---------------------- | ----------------------- |
| `ButtonVariant.primary`   | `ButtonVariant.filled` | Solid background button |
| `ButtonVariant.secondary` | `ButtonVariant.text`   | Text-only button        |

### Migration Guide

Update your existing code:

```dart
// Before (v0.0.7 and earlier)
NbxButton(
  text: 'Save',
  onPressed: () {},
  variant: ButtonVariant.primary,  // ❌ Old
)

// After (v0.0.8+)
NbxButton(
  text: 'Save',
  onPressed: () {},
  variant: ButtonVariant.filled,   // ✅ New
)
```

## 🏃‍♂️ Quick Start

### 1. Basic Setup

```dart
import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
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
      home: MyHomePage(),
    );
  }
}
```

### 2. Using Components

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NbxScaffold(
      widgetName: 'MyHomePage',
      appBarConfig: AppBarConfig(
        title: 'Welcome',
        showDivider: true,
      ),
      body: Column(
        children: [
          Text(
            'Hello World',
            style: context.nebuxTypography.heading,
          ),
          heightSpace16,
          NbxButton(
            text: 'Get Started',
            onPressed: () => print('Button pressed'),
            variant: ButtonVariant.filled,
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
  }
}
```

## 🎨 Theme System

### Color System

The Nebux Design System provides a comprehensive color system with semantic naming:

```dart
// Access colors through context
final colors = context.nebuxColors;

// Primary colors
colors.primary        // Main brand color
colors.secondary      // Secondary actions
colors.secondaryVariant // Secondary variant for enhanced theming
colors.accent         // Highlights and emphasis

// Semantic colors
colors.success        // Positive actions
colors.warning        // Caution states
colors.error          // Error states
colors.info           // Informational states

// Surface colors
colors.background     // App background
colors.surface        // Card and surface backgrounds
colors.cardColor      // Card backgrounds

// Text colors
colors.textPrimary    // Primary text
colors.textSecondary  // Secondary text

// Gradients
colors.primaryGradient   // Primary gradient
colors.secondaryGradient // Secondary gradient
```

### Typography System

Consistent typography with Google Fonts integration:

```dart
// Access typography through context
final typography = context.nebuxTypography;

// Text styles
typography.heading        // Main headings
typography.section        // Section headers
typography.content        // Main content
typography.paragraph      // Regular paragraphs
typography.caption        // Small supporting text
typography.label          // Labels and metadata

// Action styles
typography.primaryAction   // Primary buttons
typography.secondaryAction // Secondary buttons

// Form styles
typography.formInput      // Form inputs
typography.placeholder    // Placeholder text
```

### Custom Themes

Create custom themes with your own colors and typography:

```dart
// Custom color scheme
final customColors = NebuxColors(
  primary: Color(0xFF6200EE),
  secondary: Color(0xFF03DAC6),
  // ... other colors
);

// Custom typography with factory method
final customTypography = NebuxTypography.custom(
  heading: GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
  // ... other styles
);

// Enhanced typography with custom factory method for flexible overrides
final enhancedTypography = NebuxTypography.customFactory(
  baseTypography: NebuxTypography.standard(),
  overrides: {
    'heading': GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.5,
    ),
    'content': GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  },
);

// Apply custom theme
final theme = NebuxTheme.custom(
  colors: customColors,
  typography: customTypography,
);
```

## 🧩 Components

### Buttons

#### NbxButton

A versatile button component with multiple variants and states:

```dart
// Filled button (formerly primary)
NbxButton(
  text: 'Filled Action',
  onPressed: () => print('Pressed'),
  variant: ButtonVariant.filled,
)

// Text button (formerly secondary)
NbxButton(
  text: 'Text Action',
  onPressed: () => print('Pressed'),
  variant: ButtonVariant.text,
)

// Outline button
NbxButton(
  text: 'Outline Action',
  onPressed: () => print('Pressed'),
  variant: ButtonVariant.outline,
)

// Danger button
NbxButton(
  text: 'Delete',
  onPressed: () => print('Pressed'),
  variant: ButtonVariant.danger,
)

// Button with icon
NbxButton(
  text: 'Save',
  icon: Icons.save,
  onPressed: () => print('Pressed'),
  variant: ButtonVariant.filled,
)

// Loading state
NbxButton(
  text: 'Loading...',
  onPressed: () => print('Pressed'),
  isLoading: true,
  variant: ButtonVariant.filled,
)

// Button with custom background color
NbxButton(
  text: 'Custom Color',
  onPressed: () => print('Pressed'),
  variant: ButtonVariant.filled,
  customBackgroundColor: Colors.purple,
)

// Button with custom background color and text variant
NbxButton(
  text: 'Custom Text Color',
  onPressed: () => print('Pressed'),
  variant: ButtonVariant.text,
  customBackgroundColor: Colors.blue.withOpacity(0.1),
)
```

#### NbxSocialLoginButton

Social login buttons with customizable styling:

```dart
// Google login
NbxSocialLoginButton(
  text: 'Continue with Google',
  icon: FontAwesomeIcons.google,
  onPressed: () => _handleGoogleLogin(),
)

// Apple login
NbxSocialLoginButton(
  text: 'Continue with Apple',
  icon: FontAwesomeIcons.apple,
  onPressed: () => _handleAppleLogin(),
  isOutlined: true,
)
```

### Input Fields

#### NbxTextFieldWidget

Advanced text field with validation and customization:

```dart
// Basic text field
NbxTextFieldWidget(
  NbxInputParameters(
    hintText: 'Enter your name',
    labelText: 'Full Name',
    inputType: NbxInputType.text,
    isRequired: true,
    context: context,
  ),
)

// Email field with validation
NbxTextFieldWidget(
  NbxInputParameters(
    hintText: 'Enter your email',
    labelText: 'Email Address',
    inputType: NbxInputType.email,
    isRequired: true,
    requiredErrorMessage: 'Email is required',
    context: context,
  ),
)

// Password field with visibility toggle
NbxTextFieldWidget(
  NbxInputParameters(
    hintText: 'Enter your password',
    labelText: 'Password',
    inputType: NbxInputType.password,
    isRequired: true,
    showEyeIcon: true,
    context: context,
  ),
)

// Multiline text field
NbxTextFieldWidget(
  NbxInputParameters(
    hintText: 'Enter your message',
    labelText: 'Message',
    inputType: NbxInputType.text,
    minLines: 3,
    maxLines: 5,
    context: context,
  ),
)

// Enhanced input field with improved styling
NbxTextFieldWidget(
  NbxInputParameters(
    hintText: 'Enter your name',
    labelText: 'Full Name',
    inputType: NbxInputType.text,
    isRequired: true,
    requiredErrorMessage: 'Name is required',
    context: context,
    // Enhanced styling with improved label and hint colors
    decoration: InputDecoration(
      floatingLabelStyle: TextStyle(
        color: context.nebuxColors.primary,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
)
```

### Layout Components

#### NbxScaffold

Enhanced scaffold with built-in functionality:

```dart
NbxScaffold(
  widgetName: 'MyScreen',
  appBarConfig: AppBarConfig(
    title: 'My Screen',
    showDivider: true,
    // Enhanced AppBar with customizable leading button
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () => print('Menu pressed'),
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () => print('Settings'),
      ),
    ],
  ),
  body: Column(
    children: [
      // Your content here
    ],
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () => print('FAB pressed'),
    child: Icon(Icons.add),
  ),
)
```

### Images

#### NbxNetworkImage

Network image with loading states and error handling:

```dart
NbxNetworkImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  placeholder: CircularProgressIndicator(),
  errorWidget: Icon(Icons.error),
)
```

## 🔧 Extensions

### Widget Extensions

Convenient extensions for common layout operations:

```dart
// Padding extensions
Container()
  .paddingAll(16)
  .paddingHorizontal(24)
  .paddingVertical(12)
  .paddingSymmetric(horizontal: 16, vertical: 8)

// Margin extensions
Text('Hello')
  .marginAll(8)
  .marginLeft(16)
  .marginRight(16)
  .marginSymmetric(horizontal: 12, vertical: 4)

// Spacing constants
Column(
  children: [
    Text('First'),
    heightSpace16,  // SizedBox(height: 16)
    Text('Second'),
    widthSpace8,    // SizedBox(width: 8)
  ],
)
```

### Context Extensions

Easy access to theme properties:

```dart
// Access theme properties
final theme = context.nebuxTheme;
final colors = context.nebuxColors;
final typography = context.nebuxTypography;

// Use in your widgets
Text(
  'Hello World',
  style: context.nebuxTypography.heading.copyWith(
    color: context.nebuxColors.primary,
  ),
)
```

## 🛠️ Utilities

### Spacing System

Standardized spacing constants:

```dart
// Height spacing
heightSpace2, heightSpace4, heightSpace8, heightSpace16,
heightSpace24, heightSpace32, heightSpace48, heightSpace64

// Width spacing
widthSpace2, widthSpace4, widthSpace8, widthSpace16,
widthSpace24, widthSpace32, widthSpace48, widthSpace64

// Default padding
defaultPaddingSize // 16.0
```

### Helper Utilities

```dart
// String utilities
NebuxUtils.capitalize('hello world')        // 'Hello world'
NebuxUtils.truncateText('Long text', 10)    // 'Long text...'
NebuxUtils.isValidString('')                // false

// Duration formatting
NebuxUtils.formatDuration(Duration(minutes: 5, seconds: 30)) // '5m 30s'

// Platform detection
NebuxUtils.isWeb     // true if running on web
NebuxUtils.isMobile  // true if running on mobile

// Random tag generation
NebuxUtils.generateRandomTag('user') // '123456-user'
```

### Debouncer

```dart
class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late NebuxDebouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _debouncer = NebuxDebouncer(milliseconds: 500);
  }

  void _onSearchChanged(String query) {
    _debouncer.run(() {
      // Perform search after 500ms of no typing
      _performSearch(query);
    });
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}
```

## 📱 Responsive Design

The design system includes responsive utilities and components:

```dart
// Responsive spacing
Container(
  padding: EdgeInsets.all(
    MediaQuery.of(context).size.width > 600 ? 24.0 : 16.0,
  ),
  child: Text('Responsive content'),
)

// Responsive typography
Text(
  'Responsive Text',
  style: context.nebuxTypography.heading.copyWith(
    fontSize: MediaQuery.of(context).size.width > 600 ? 28.0 : 24.0,
  ),
)
```

## 🎯 Best Practices

### 1. Theme Consistency

Always use the theme system for consistent styling:

```dart
// ✅ Good
Text('Hello', style: context.nebuxTypography.heading)

// ❌ Avoid
Text('Hello', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
```

### 2. Component Usage

Use the provided components instead of building custom ones:

```dart
// ✅ Good
NbxButton(
  text: 'Save',
  onPressed: () {},
  variant: ButtonVariant.filled,
)

// ❌ Avoid
ElevatedButton(child: Text('Save'), onPressed: () {})
```

### 3. Color Usage

Use semantic color names for better maintainability:

```dart
// ✅ Good
Container(color: context.nebuxColors.primary)

// ❌ Avoid
Container(color: Color(0xFF6200EE))
```

### 4. Spacing

Use the spacing system for consistent layouts:

```dart
// ✅ Good
Column(children: [Text('First'), heightSpace16, Text('Second')])

// ❌ Avoid
Column(children: [Text('First'), SizedBox(height: 16), Text('Second')])
```

## 🔍 API Reference

### Core Classes

- **NebuxTheme** - Main theme class with light/dark mode support
- **NebuxColors** - Color system with semantic naming
- **NebuxTypography** - Typography system with Google Fonts
- **NebuxFontSize** - Font size scale system
- **NebuxSpacing** - Spacing constants and utilities

### Components

- **NbxButton** - Versatile button component with multiple variants
- **NbxSocialLoginButton** - Social login buttons
- **NbxTextFieldWidget** - Advanced text field component
- **NbxScaffold** - Enhanced scaffold with built-in functionality
- **NbxNetworkImage** - Network image with loading states

### Extensions

- **NebuxBuildContextExtension** - Context extensions for theme access
- **MarginExtensions** - Widget margin extensions
- **PaddingExtensions** - Widget padding extensions

## 🧪 Testing

The design system includes comprehensive testing utilities:

```dart
// Widget testing
testWidgets('NbxButton should display correctly', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: NbxButton(
        text: 'Test Button',
        onPressed: () {},
      ),
    ),
  );

  expect(find.text('Test Button'), findsOneWidget);
});

// Theme testing
test('NebuxTheme should create correct theme data', () {
  final theme = NebuxTheme.createThemeData(
    isDark: false,
    colors: NebuxColors.standardLight(),
    fontSize: NebuxFontSize.standard(),
    typography: NebuxTypography.standard(),
  );

  expect(theme.brightness, Brightness.light);
});
```

## 📚 Examples

Check out the `/example` folder for a complete demo application showcasing all features of the Nebux Design System.

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🐛 Issues

Found a bug or have a feature request? Please file an issue on our [GitHub repository](https://github.com/nebux-labs/nebux_design_system/issues).

## 📞 Support

- 📧 Email: roimerj63@gmail.com
- 📖 Documentation: [Full documentation](https://docs.nebux.com)

---

**Made with ❤️ by the Nebux Team**
