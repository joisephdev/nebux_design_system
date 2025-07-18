# NebuX Core Example App

This example demonstrates how to use the NebuX Core design system in a Flutter application.

## Features Demonstrated

### 🎨 Theme System

- **Color Palette**: Custom color schemes with primary, secondary, error, and neutral colors
- **Light/Dark Themes**: Automatic theme switching with proper contrast ratios
- **Theme Persistence**: Theme preferences are saved and restored on app restart
- **Theme Settings Screen**: Advanced theme configuration and management
- **Component Theming**: Buttons, cards, input fields, and other Material components
- **Custom Themes**: Creating and applying custom color schemes

### 📝 Typography System

- **Text Styles**: Display, headline, title, body, and label text styles
- **Font Sizes**: Standardized font size scale (2px to 48px)
- **Google Fonts**: Montserrat font family integration
- **Custom Typography**: Creating custom text styles and typography schemes

### 📏 Spacing Utilities

- **Height Spacers**: `heightSpace2` to `heightSpace200` for vertical spacing
- **Width Spacers**: `widthSpace2` to `widthSpace25` for horizontal spacing
- **Consistent Layout**: Maintaining consistent spacing throughout the app
- **Usage Examples**: Practical examples of spacing in layouts

### 🔧 State Management

- **Provider Pattern**: Clean state management with Provider package
- **Theme Provider**: Centralized theme state management
- **Persistence**: Theme preferences saved using SharedPreferences
- **Loading States**: Proper loading screens during theme initialization

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)

### Installation

1. **Navigate to the example directory**:

   ```bash
   cd example
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the example app**:
   ```bash
   flutter run
   ```

## Usage Examples

### Theme Management with Provider

```dart
import 'package:provider/provider.dart';
import 'package:nebux_core/nebux_core.dart';

// Wrap your app with ChangeNotifierProvider
ChangeNotifierProvider(
  create: (_) => ThemeProvider(),
  child: Consumer<ThemeProvider>(
    builder: (context, themeProvider, child) {
      return MaterialApp(
        theme: themeProvider.currentTheme,
        home: HomeScreen(),
      );
    },
  ),
);

// Use theme provider in widgets
final themeProvider = Provider.of<ThemeProvider>(context);
themeProvider.toggleTheme(); // Switch themes
themeProvider.setThemeMode(true); // Set dark mode
```

### Theme Persistence

```dart
// Theme preferences are automatically saved
await ThemePreferences.setThemeMode(true);
bool isDark = await ThemePreferences.getThemeMode();
```

### Creating a Custom Theme

```dart
import 'package:nebux_core/nebux_core.dart';

// Define custom colors
final colors = NebuxColors(
  primary: const Color(0xFF2196F3),    // Blue
  secondary: const Color(0xFF4CAF50),  // Green
  scaffold: const Color(0xFFF5F5F5),   // Light gray
  black: const Color(0xFF212121),      // Dark gray
  white: const Color(0xFFFFFFFF),      // White
  error: const Color(0xFFE53935),      // Red
  disabled: const Color(0xFFBDBDBD),   // Gray
);

// Create theme data
final themeData = NebuxTheme.createThemeData(
  false, // isDark
  colors,
  NebuxFontSize.standard(),
  NebuxTypography.standard(),
);

// Apply to MaterialApp
MaterialApp(
  theme: themeData,
  // ... other properties
);
```

### Using Spacing Utilities

```dart
import 'package:nebux_core/nebux_core.dart';

Column(
  children: [
    Text('First widget'),
    heightSpace16,  // 16px vertical spacing
    Text('Second widget'),
    heightSpace24,  // 24px vertical spacing
    Text('Third widget'),
  ],
)

Row(
  children: [
    Widget1(),
    widthSpace16,   // 16px horizontal spacing
    Widget2(),
    widthSpace16,   // 16px horizontal spacing
    Widget3(),
  ],
)
```

### Custom Typography

```dart
import 'package:nebux_core/nebux_core.dart';
import 'package:google_fonts/google_fonts.dart';

// Create custom typography
final typography = NebuxTypography.custom(
  bodyLarge: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  labelLarge: GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
);

// Use in theme
final themeData = NebuxTheme.createThemeData(
  false,
  colors,
  NebuxFontSize.standard(),
  typography,
);
```

## Project Structure

```
example/
├── main.dart                 # Main app entry point
├── providers/
│   └── theme_provider.dart   # Theme state management
├── screens/
│   ├── home_screen.dart      # Navigation hub
│   ├── theme_demo_screen.dart    # Theme system demo
│   ├── typography_demo_screen.dart # Typography demo
│   ├── spacing_demo_screen.dart   # Spacing utilities demo
│   └── theme_settings_screen.dart # Advanced theme settings
├── utils/
│   └── theme_preferences.dart # Theme persistence utilities
├── pubspec.yaml              # Dependencies
└── README.md                 # This file
```

## Key Features

### 🎯 Design System Principles

- **Consistency**: Standardized colors, typography, and spacing
- **Accessibility**: Proper contrast ratios and readable fonts
- **Flexibility**: Easy customization and theme switching
- **Maintainability**: Centralized design tokens and utilities

### 🔧 Technical Features

- **Freezed Integration**: Immutable data classes with JSON serialization
- **Google Fonts**: High-quality typography with Montserrat font
- **Material 3**: Modern Material Design implementation
- **Theme Extensions**: Flutter's theme extension system integration
- **State Management**: Provider pattern for clean state management
- **Persistence**: SharedPreferences for theme preference storage

### 📱 UI Components

- **Buttons**: Elevated, outlined, text, and filled button styles
- **Cards**: Consistent card styling with proper elevation
- **Input Fields**: Themed text fields with proper focus states
- **Navigation**: App bars and bottom navigation with theme integration
- **Theme Settings**: Advanced theme configuration interface

### 🎨 Theme Features

- **Light/Dark Mode**: Automatic theme switching with persistence
- **Theme Settings Screen**: Comprehensive theme configuration
- **Theme Information**: Real-time theme property display
- **Theme Actions**: Toggle, reset, and customize themes
- **Loading States**: Proper initialization with loading screens

## Theme Functionality

### Quick Theme Toggle

- Tap the theme icon in the app bar to switch between light and dark modes
- Theme preference is automatically saved and restored

### Advanced Theme Settings

- Access the theme settings screen via the settings icon
- View current theme status and information
- Select theme mode with visual feedback
- Reset theme to default settings
- View detailed theme properties

### Theme Persistence

- Theme preferences are saved using SharedPreferences
- App remembers your theme choice across sessions
- Smooth theme transitions with proper loading states

## Contributing

To contribute to the example app:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This example is part of the NebuX Core project and follows the same license terms.

## Support

For questions or issues with the example app, please refer to the main NebuX Core documentation or create an issue in the repository.
