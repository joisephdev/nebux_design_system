# Nebux Design System - Technical Documentation

## 📋 Table of Contents

1. [Architecture Overview](#architecture-overview)
2. [Core Modules](#core-modules)
3. [Component System](#component-system)
4. [API Reference](#api-reference)
5. [Advanced Usage](#advanced-usage)
6. [Performance Considerations](#performance-considerations)
7. [Migration Guide](#migration-guide)
8. [Troubleshooting](#troubleshooting)

## 🏗️ Architecture Overview

The Nebux Design System follows a modular architecture with clear separation of concerns:

```
lib/
├── src/
│   ├── core/                    # Core functionality
│   │   ├── theme/              # Theme system
│   │   │   ├── colors/         # Color management
│   │   │   ├── typography/     # Typography system
│   │   │   └── extensions/     # Theme extensions
│   │   ├── extensions/         # Flutter extensions
│   │   └── utils/              # Utility functions
│   └── components/             # UI components
│       ├── app_bars/          # App bar components
│       ├── buttons/           # Button components
│       ├── inputs/            # Input components
│       ├── images/            # Image components
│       └── scaffold/          # Layout components
```

### Design Principles

1. **Modularity**: Each component is self-contained and reusable
2. **Consistency**: Unified design language across all components
3. **Accessibility**: WCAG 2.1 AA compliance
4. **Performance**: Optimized for Flutter's rendering pipeline
5. **Type Safety**: Full Dart null safety support
6. **Extensibility**: Easy to customize and extend

## 🎨 Core Modules

### Theme System

#### NebuxTheme

The central theme class that orchestrates all design system elements.

```dart
class NebuxTheme extends ThemeExtension<NebuxTheme> {
  final NebuxColors colors;
  final NebuxFontSize fontSize;
  final NebuxTypography typography;
  
  // Factory constructors
  factory NebuxTheme.custom({...});
  static NebuxTheme fromJson(Map<String, dynamic> json);
  static NebuxTheme fromColorThemes({...});
  
  // Theme data creation
  static ThemeData createThemeData({...});
}
```

**Key Features:**
- Light and dark mode support
- JSON/TOML configuration
- Color interpolation
- Custom theme creation
- Material 3 integration

#### Color System

```dart
@freezed
abstract class NebuxColors with _$NebuxColors {
  const factory NebuxColors({
    @ColorConverter() required Color primary,
    @ColorConverter() required Color primaryVariant,
    @ColorConverter() required Color secondary,
    @ColorConverter() required Color accent,
    @ColorConverter() required Color background,
    @ColorConverter() required Color surface,
    @ColorConverter() required Color textPrimary,
    @ColorConverter() required Color textSecondary,
    @ColorConverter() required Color cardColor,
    @ColorConverter() required Color success,
    @ColorConverter() required Color warning,
    @ColorConverter() required Color error,
    @ColorConverter() required Color info,
    @ColorConverter() required Color white,
    @ColorConverter() required Color black,
    @LinearGradientConverter() required LinearGradient primaryGradient,
    @LinearGradientConverter() required LinearGradient secondaryGradient,
  }) = _NebuxColors;
}
```

**Color Categories:**
- **Primary**: Brand colors and main actions
- **Secondary**: Supporting actions and accents
- **Semantic**: Success, warning, error, info states
- **Surface**: Backgrounds and containers
- **Text**: Primary and secondary text colors
- **Gradients**: Linear gradients for visual appeal

#### Typography System

```dart
@Freezed(fromJson: false, toJson: false)
abstract class NebuxTypography with _$NebuxTypography {
  const factory NebuxTypography({
    required TextStyle content,        // Main content text
    required TextStyle paragraph,      // Regular paragraphs
    required TextStyle caption,        // Small supporting text
    required TextStyle heading,        // Main headings
    required TextStyle section,        // Section headers
    required TextStyle label,          // Labels and metadata
    required TextStyle primaryAction,  // Primary buttons
    required TextStyle secondaryAction, // Secondary buttons
    required TextStyle formInput,      // Form inputs
    required TextStyle placeholder,    // Placeholder text
  }) = _NebuxTypography;
}
```

**Typography Scale:**
- **Display**: 36px, 32px, 28px
- **Heading**: 24px, 22px, 20px, 18px
- **Body**: 16px, 14px, 12px, 10px, 8px

### Extensions

#### BuildContext Extensions

```dart
extension NebuxBuildContextExtension on BuildContext {
  NebuxTheme get nebuxTheme => Theme.of(this).extension<NebuxTheme>()!;
  NebuxColors get nebuxColors => nebuxTheme.colors;
  NebuxTypography get nebuxTypography => nebuxTheme.typography;
}
```

#### Widget Extensions

```dart
// Padding extensions
Widget.paddingAll(double padding)
Widget.paddingHorizontal(double padding)
Widget.paddingVertical(double padding)
Widget.paddingSymmetric({double horizontal, double vertical})
Widget.paddingOnly({double left, double top, double right, double bottom})

// Margin extensions
Widget.marginAll(double margin)
Widget.marginHorizontal(double margin)
Widget.marginVertical(double margin)
Widget.marginSymmetric({double horizontal, double vertical})
Widget.marginOnly({double left, double top, double right, double bottom})
```

### Utilities

#### Spacing System

```dart
// Height spacing constants
const SizedBox heightSpace2 = SizedBox(height: 2);
const SizedBox heightSpace4 = SizedBox(height: 4);
const SizedBox heightSpace8 = SizedBox(height: 8);
const SizedBox heightSpace16 = SizedBox(height: 16);
const SizedBox heightSpace24 = SizedBox(height: 24);
const SizedBox heightSpace32 = SizedBox(height: 32);
const SizedBox heightSpace48 = SizedBox(height: 48);

// Width spacing constants
const SizedBox widthSpace2 = SizedBox(width: 2);
const SizedBox widthSpace4 = SizedBox(width: 4);
const SizedBox widthSpace8 = SizedBox(width: 8);
const SizedBox widthSpace16 = SizedBox(width: 16);
const SizedBox widthSpace24 = SizedBox(width: 24);
const SizedBox widthSpace32 = SizedBox(width: 32);
const SizedBox widthSpace48 = SizedBox(width: 48);

// Default padding
const double defaultPaddingSize = 16;
```

#### Helper Utilities

```dart
class NebuxUtils {
  // String utilities
  static String generateRandomTag([String? value]);
  static bool isValidString(String? value);
  static String capitalize(String text);
  static String truncateText(String text, int maxLength);
  
  // Duration utilities
  static String formatDuration(Duration duration);
  
  // Platform detection
  static bool get isWeb;
  static bool get isMobile;
}
```

#### Debouncer

```dart
class NebuxDebouncer {
  final int milliseconds;
  Timer? _timer;
  VoidCallback? _onDebounce;
  
  void run(VoidCallback action);
  void cancel();
  void dispose();
  bool get isActive;
}
```

## 🧩 Component System

### Button Components

#### NbxButton

A versatile button component with multiple variants and states.

```dart
enum ButtonVariant {
  primary,   // Filled button with primary color
  secondary, // Text button with primary color
  outline,   // Outlined button
  danger,    // Filled button with error color
}

class NbxButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final ButtonVariant variant;
  final bool isExpanded;
  final double? borderRadius;
  final TextStyle? textStyle;
  final IconData? icon;
  final Color? iconColor;
  final IconData? trailingIcon;
  final Color? trailingIconColor;
}
```

**Features:**
- Multiple variants (primary, secondary, outline, danger)
- Loading states with spinner
- Disabled states
- Icon support (leading and trailing)
- Customizable styling
- Accessibility support

#### NbxSocialLoginButton

Social login buttons with customizable styling.

```dart
class NbxSocialLoginButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
}
```

**Features:**
- FontAwesome icon support
- Outlined and filled variants
- Custom color support
- Consistent sizing (56px height)

### Input Components

#### NbxTextFieldWidget

Advanced text field with validation and customization.

```dart
class NbxTextFieldWidget extends StatelessWidget {
  final NbxInputParameters inputParameters;
}
```

#### NbxInputParameters

Comprehensive input configuration model.

```dart
@Freezed()
abstract class NbxInputParameters with _$NbxInputParameters {
  factory NbxInputParameters({
    String? hintText,
    String? labelText,
    required bool isRequired,
    required NbxInputType inputType,
    required BuildContext context,
    FloatingLabelBehavior? floatingLabelBehavior,
    @Default(true) bool showSuffixIcon,
    @Default(false) bool obscureText,
    @Default(false) bool isReadOnly,
    @Default(true) bool isEnabled,
    @Default(false) bool showEyeIcon,
    @Default(false) bool showCancelIcon,
    @Default(true) bool autoDisposeController,
    @Default(false) bool forceShowSuffixIcon,
    @Default(AutovalidateMode.onUserInteraction) AutovalidateMode autovalidateMode,
    String? requiredErrorMessage,
    String? Function(String?)? validator,
    String? Function(String? value, NbxInputType type)? customValidator,
    int? minLines,
    int? maxLines,
    int? maxLength,
    Widget? suffixIcon,
    Widget? prefixIcon,
    TextInputAction? textInputAction,
    TextEditingController? controller,
    VoidCallback? suffixOnPressed,
    InputDecoration? decoration,
    ValueChanged<String>? onSubmitted,
    ValueChanged<String>? onChanged,
    List<TextInputFormatter>? inputFormatters,
    @Default(NbxFormType.outlined) NbxFormType formType,
    void Function()? onTap,
  }) = _NbxInputParameters;
}
```

**Input Types:**
- `NbxInputType.text` - General text input
- `NbxInputType.email` - Email validation
- `NbxInputType.password` - Password with visibility toggle
- `NbxInputType.phone` - Phone number input
- `NbxInputType.number` - Numeric input

**Form Types:**
- `NbxFormType.outlined` - Outlined border style
- `NbxFormType.filled` - Filled background style
- `NbxFormType.underlined` - Underlined style

### Layout Components

#### NbxScaffold

Enhanced scaffold with built-in functionality.

```dart
class NbxScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final AppBarConfig? appBarConfig;
  final SafeAreaConfig? safeAreaConfig;
  final BodyConfig? bodyConfig;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;
  final String widgetName;
}
```

**Configuration Classes:**

```dart
class AppBarConfig {
  final String? title;
  final List<Widget>? actions;
  final Widget? leadingButton;
  final bool showDivider;
}

class SafeAreaConfig {
  final bool top;
  final bool bottom;
  final EdgeInsets? minimum;
}

class BodyConfig {
  final bool wrapInContainer;
  final BoxDecoration? decoration;
  final bool resizeToAvoidBottomInset;
  final String? exitMessage;
}
```

**Features:**
- Custom app bar configuration
- Safe area management
- Double back to exit functionality
- Container wrapping options
- Floating action button support

### Image Components

#### NbxNetworkImage

Network image with loading states and error handling.

```dart
class NbxNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
}
```

**Features:**
- Cached network image support
- Loading placeholder
- Error state handling
- Customizable styling
- Memory optimization

## 📚 API Reference

### Core Classes

#### NebuxTheme

| Method | Description | Parameters | Returns |
|--------|-------------|------------|---------|
| `custom()` | Create custom theme | `colors`, `fontSize?`, `typography?` | `NebuxTheme` |
| `fromJson()` | Create from JSON | `Map<String, dynamic>` | `NebuxTheme` |
| `fromColorThemes()` | Create from color themes | `colorThemes`, `brightness`, `typography?` | `NebuxTheme` |
| `createThemeData()` | Create Material ThemeData | `isDark`, `colors`, `fontSize`, `typography` | `ThemeData` |
| `copyWith()` | Create copy with changes | `colors?`, `fontSize?`, `typography?` | `NebuxTheme` |
| `lerp()` | Interpolate between themes | `other`, `t` | `NebuxTheme` |

#### NebuxColors

| Property | Type | Description |
|----------|------|-------------|
| `primary` | `Color` | Main brand color |
| `secondary` | `Color` | Secondary actions |
| `accent` | `Color` | Highlights and emphasis |
| `background` | `Color` | App background |
| `surface` | `Color` | Card and surface backgrounds |
| `textPrimary` | `Color` | Primary text color |
| `textSecondary` | `Color` | Secondary text color |
| `success` | `Color` | Success state color |
| `warning` | `Color` | Warning state color |
| `error` | `Color` | Error state color |
| `info` | `Color` | Info state color |
| `primaryGradient` | `LinearGradient` | Primary gradient |
| `secondaryGradient` | `LinearGradient` | Secondary gradient |

#### NebuxTypography

| Property | Type | Description |
|----------|------|-------------|
| `content` | `TextStyle` | Main content text |
| `paragraph` | `TextStyle` | Regular paragraphs |
| `caption` | `TextStyle` | Small supporting text |
| `heading` | `TextStyle` | Main headings |
| `section` | `TextStyle` | Section headers |
| `label` | `TextStyle` | Labels and metadata |
| `primaryAction` | `TextStyle` | Primary buttons |
| `secondaryAction` | `TextStyle` | Secondary buttons |
| `formInput` | `TextStyle` | Form inputs |
| `placeholder` | `TextStyle` | Placeholder text |

### Component APIs

#### NbxButton

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `text` | `String` | - | Button text |
| `onPressed` | `VoidCallback?` | - | Press callback |
| `isLoading` | `bool` | `false` | Loading state |
| `isDisabled` | `bool` | `false` | Disabled state |
| `variant` | `ButtonVariant` | `ButtonVariant.primary` | Button variant |
| `isExpanded` | `bool` | `true` | Expand to fill width |
| `borderRadius` | `double?` | `8` | Custom border radius |
| `textStyle` | `TextStyle?` | - | Custom text style |
| `icon` | `IconData?` | - | Leading icon |
| `trailingIcon` | `IconData?` | - | Trailing icon |

#### NbxTextFieldWidget

| Property | Type | Description |
|----------|------|-------------|
| `inputParameters` | `NbxInputParameters` | Input configuration |

#### NbxInputParameters

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `hintText` | `String?` | - | Hint text |
| `labelText` | `String?` | - | Label text |
| `isRequired` | `bool` | - | Required field |
| `inputType` | `NbxInputType` | - | Input type |
| `context` | `BuildContext` | - | Build context |
| `obscureText` | `bool` | `false` | Hide text |
| `isReadOnly` | `bool` | `false` | Read-only field |
| `isEnabled` | `bool` | `true` | Enabled state |
| `showEyeIcon` | `bool` | `false` | Show visibility toggle |
| `showCancelIcon` | `bool` | `false` | Show cancel icon |
| `minLines` | `int?` | - | Minimum lines |
| `maxLines` | `int?` | - | Maximum lines |
| `maxLength` | `int?` | - | Maximum length |
| `validator` | `String? Function(String?)?` | - | Custom validator |
| `onChanged` | `ValueChanged<String>?` | - | Change callback |
| `onSubmitted` | `ValueChanged<String>?` | - | Submit callback |

## 🚀 Advanced Usage

### Custom Theme Creation

```dart
// Create custom color scheme
final customColors = NebuxColors(
  primary: Color(0xFF6200EE),
  primaryVariant: Color(0xFF3700B3),
  secondary: Color(0xFF03DAC6),
  accent: Color(0xFF018786),
  background: Color(0xFFFAFAFA),
  surface: Color(0xFFFFFFFF),
  textPrimary: Color(0xFF212121),
  textSecondary: Color(0xFF757575),
  cardColor: Color(0xFFFFFFFF),
  success: Color(0xFF4CAF50),
  warning: Color(0xFFFF9800),
  error: Color(0xFFF44336),
  info: Color(0xFF2196F3),
  white: Color(0xFFFFFFFF),
  black: Color(0xFF000000),
  primaryGradient: LinearGradient(
    colors: [Color(0xFF6200EE), Color(0xFF03DAC6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  secondaryGradient: LinearGradient(
    colors: [Color(0xFF03DAC6), Color(0xFF018786)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

// Create custom typography
final customTypography = NebuxTypography.custom(
  heading: GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  ),
  content: GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  ),
  // ... other styles
);

// Create custom theme
final customTheme = NebuxTheme.custom(
  colors: customColors,
  typography: customTypography,
);

// Apply to MaterialApp
MaterialApp(
  theme: NebuxTheme.createThemeData(
    isDark: false,
    colors: customColors,
    fontSize: NebuxFontSize.standard(),
    typography: customTypography,
  ),
  // ...
)
```

### JSON Theme Configuration

```dart
// Load theme from JSON
final themeJson = {
  "light": {
    "primary": "#6200EE",
    "secondary": "#03DAC6",
    "background": "#FAFAFA",
    // ... other colors
  },
  "dark": {
    "primary": "#BB86FC",
    "secondary": "#03DAC6",
    "background": "#121212",
    // ... other colors
  }
};

final colorThemes = NebuxColorThemes.fromJson(themeJson);
final theme = NebuxTheme.fromColorThemes(
  colorThemes: colorThemes,
  brightness: Brightness.light,
);
```

### Custom Component Creation

```dart
// Create custom button variant
class NbxCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsets? padding;

  const NbxCustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.nebuxColors;
    final typography = context.nebuxTypography;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? colors.primary,
        foregroundColor: textColor ?? colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(
        text,
        style: typography.primaryAction.copyWith(
          color: textColor ?? colors.white,
        ),
      ),
    );
  }
}
```

### Advanced Input Validation

```dart
// Custom input with advanced validation
NbxTextFieldWidget(
  NbxInputParameters(
    hintText: 'Enter your email',
    labelText: 'Email Address',
    inputType: NbxInputType.email,
    isRequired: true,
    requiredErrorMessage: 'Email is required',
    context: context,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      return null;
    },
    customValidator: (value, type) {
      if (type == NbxInputType.email) {
        if (value.contains('+')) {
          return 'Email aliases are not allowed';
        }
      }
      return null;
    },
  ),
)
```

## ⚡ Performance Considerations

### Theme Performance

1. **Theme Caching**: Themes are cached and reused across widgets
2. **Color Interpolation**: Use `lerp()` for smooth theme transitions
3. **Extension Access**: Context extensions are optimized for performance

### Component Performance

1. **Widget Reuse**: Components are designed for maximum reuse
2. **State Management**: Minimal state updates and rebuilds
3. **Memory Management**: Proper disposal of controllers and timers

### Best Practices

```dart
// ✅ Good: Use const constructors where possible
const NbxButton(
  text: 'Save',
  onPressed: _save,
  variant: ButtonVariant.primary,
)

// ✅ Good: Cache theme access
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.nebuxColors;
    final typography = context.nebuxTypography;
    
    return Container(
      color: colors.primary,
      child: Text('Hello', style: typography.heading),
    );
  }
}

// ❌ Avoid: Accessing theme multiple times
Widget build(BuildContext context) {
  return Container(
    color: context.nebuxColors.primary,
    child: Text('Hello', style: context.nebuxTypography.heading),
  );
}
```

## 🔄 Migration Guide

### From Custom Components

```dart
// Before: Custom button
ElevatedButton(
  onPressed: () {},
  child: Text('Save'),
)

// After: NbxButton
NbxButton(
  text: 'Save',
  onPressed: () {},
  variant: ButtonVariant.primary,
)
```

### From Custom Theme

```dart
// Before: Custom theme
ThemeData(
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 24),
  ),
)

// After: NebuxTheme
NebuxTheme.createThemeData(
  isDark: false,
  colors: NebuxColors.standardLight(),
  fontSize: NebuxFontSize.standard(),
  typography: NebuxTypography.standard(),
)
```

### From Custom Spacing

```dart
// Before: Custom spacing
SizedBox(height: 16)
SizedBox(width: 8)

// After: Spacing constants
heightSpace16
widthSpace8
```

## 🔧 Troubleshooting

### Common Issues

#### Theme Not Applied

**Problem**: Theme changes not reflected in UI

**Solution**: Ensure theme is properly applied to MaterialApp

```dart
MaterialApp(
  theme: NebuxTheme.createThemeData(
    isDark: false,
    colors: NebuxColors.standardLight(),
    fontSize: NebuxFontSize.standard(),
    typography: NebuxTypography.standard(),
  ),
  // ...
)
```

#### Context Extension Not Found

**Problem**: `context.nebuxColors` throws error

**Solution**: Ensure theme is properly registered

```dart
// Make sure theme is in extensions
extensions: <ThemeExtension<NebuxTheme>>[
  NebuxTheme.custom(colors: colors, typography: typography),
],
```

#### Button Not Responding

**Problem**: Button onPressed not working

**Solution**: Check if button is disabled or loading

```dart
NbxButton(
  text: 'Save',
  onPressed: isLoading ? null : _save, // Handle loading state
  isLoading: isLoading,
)
```

#### Input Validation Not Working

**Problem**: Input validation not triggering

**Solution**: Check autovalidateMode and validator

```dart
NbxTextFieldWidget(
  NbxInputParameters(
    // ...
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) => value?.isEmpty == true ? 'Required' : null,
  ),
)
```

### Debug Mode

Enable debug mode for additional logging:

```dart
void main() {
  // Enable debug mode
  debugPrint('Nebux Design System Debug Mode Enabled');
  runApp(MyApp());
}
```

### Performance Issues

1. **Check for unnecessary rebuilds**
2. **Use const constructors where possible**
3. **Cache expensive operations**
4. **Profile with Flutter Inspector**

## 📞 Support

For technical support and questions:

- 📧 Email: support@nebux.com
- 💬 Discord: [Join our community](https://discord.gg/nebux)
- 📖 Documentation: [Full documentation](https://docs.nebux.com)
- 🐛 Issues: [GitHub Issues](https://github.com/nebux-labs/nebux_design_system/issues)

---

**Last Updated**: December 2024  
**Version**: 0.0.1  
**Flutter Version**: 3.8.1+
