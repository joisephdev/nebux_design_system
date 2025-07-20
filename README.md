<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

Nebux Design System - A comprehensive Flutter design system package that provides consistent theming, typography, spacing, and UI components for Nebux applications.

## Features

- **Theme System**: Complete light and dark theme support with customizable colors
- **Typography**: Consistent text styles and font sizes across the application
- **Spacing Utilities**: Standardized spacing system for consistent layouts
- **UI Components**: Reusable components like app bars, buttons, and cards
- **Color Management**: Advanced color system with primary, secondary, and neutral colors
- **Responsive Design**: Built-in support for different screen sizes and orientations

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  nebux_design_system:
    path: ../nebux_core
```

Then import the package in your Dart files:

```dart
import 'package:nebux_design_system/nebux_design_system.dart';
```

## Usage

Here's a basic example of how to use the Nebux Design System:

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
      title: 'Nebux App',
      theme: NebuxTheme.lightTheme,
      darkTheme: NebuxTheme.darkTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NebuxAppBar(title: 'My App'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Hello World', style: NebuxTypography.bodyLarge),
            SizedBox(height: 16),
            Text('Welcome to Nebux', style: NebuxTypography.headlineMedium),
          ],
        ),
      ),
    );
  }
}
```

## Additional information

For more detailed examples and demonstrations, check out the `/example` folder which contains a complete demo application showcasing all the features of the Nebux Design System.

## Architecture

The design system follows a modular architecture with clear separation of concerns:

- **Theme**: Centralized theme management with light and dark mode support
- **Typography**: Consistent text styling system
- **Spacing**: Standardized spacing utilities
- **Components**: Reusable UI components
- **Colors**: Comprehensive color system with semantic naming

## Contributing

To contribute to this design system:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## Issues

If you encounter any issues or have suggestions for improvements, please file an issue on the repository.
