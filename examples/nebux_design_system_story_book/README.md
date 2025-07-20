# NebuX Design System Storybook

A comprehensive Flutter storybook showcasing all UI components, patterns, and functionalities of the NebuX Design System using [Widgetbook](https://pub.dev/packages/widgetbook). This project serves as a visual and interactive catalog for component exploration, testing, and documentation.

## 🎯 Core Goals

- **Isolate & Visualize Widgets** – Render components individually in real usage scenarios
- **Support Dynamic Properties** – Change widget parameters live using knobs or interactive controls
- **Categorize UI Elements** – Organize all elements (buttons, inputs, cards, etc.) under logical sections
- **Simulate Real App Context** – Use dummy models and themes that reflect actual app usage
- **Serve as a Testing Playground** – Allow developers and designers to test behavior, layouts, and responsiveness

## 🏗️ Project Structure

```
nebux_core/example/
├── lib/
│   ├── main.dart                    # App entry point with WidgetbookApp
│   └── stories/                     # Component showcase pages
│       ├── app_bars_stories.dart    # App bar components
│       ├── theme_stories.dart       # Theme & colors
│       └── utils_stories.dart       # Utility components
├── pubspec.yaml                     # Dependencies and configuration
├── analysis_options.yaml            # Linting rules
└── README.md                        # This file
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=1.17.0)
- Dart SDK (^3.8.1)

### Installation

1. Navigate to the example directory:

   ```bash
   cd nebux_core/example
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Generate Widgetbook files:

   ```bash
   flutter packages pub run build_runner build
   ```

4. Run the storybook:
   ```bash
   flutter run
   ```

## 📱 Features

### Component Showcase

The storybook is organized into three main sections:

#### 1. App Bars

- **NebuxAppBar**: Custom app bar with back button and centered title
- Interactive examples with real navigation
- Usage code snippets

#### 2. Theme & Colors

- **Color Palette**: Complete color system with hex values
- **Typography**: All text styles with examples
- **Spacing**: Visual representation of spacing values
- **Font Sizes**: Complete typography scale

#### 3. Utilities

- **Bottom Sheet**: Custom bottom sheet implementation
- **Spacing Utilities**: Predefined spacing values
- **Color Converter**: Color manipulation utilities
- **Helper Functions**: Various utility functions

### Widgetbook Features

- **Interactive Component Browser**: Navigate through all components
- **Live Component Preview**: See components in action
- **Code Examples**: Copy-paste ready code snippets
- **Theme Switching**: Light and dark theme support
- **Responsive Design**: Works on different screen sizes
- **Knobs and Controls**: Interactive property controls

## 🎨 Design System Components

### Colors

- Primary brand colors
- Secondary action colors
- Text colors (primary/secondary)
- Error and disabled states
- Scaffold background colors

### Typography

- Heading styles
- Content and paragraph text
- Label and caption styles
- Action button text styles
- Form input styles

### Spacing

- Consistent spacing scale
- Visual spacing examples
- Responsive spacing utilities

### Components

- **NebuxAppBar**: Navigation component
- **Bottom Sheet**: Modal presentation
- **Theme Integration**: Complete theme system

## 🔧 Development

### Adding New Components

1. Create a new story file in `lib/stories/`
2. Follow the existing pattern with showcase and usage examples
3. Add Widgetbook annotations for proper integration
4. Include interactive examples and code snippets

### Example Story Structure

```dart
@WidgetbookStory(name: 'Component Name')
class ComponentStory extends StatelessWidget {
  const ComponentStory({super.key});

  @override
  Widget build(BuildContext context) {
    return YourComponent();
  }
}
```

### Widgetbook Annotations

The project uses Widgetbook annotations for proper story organization:

```dart
@WidgetbookApp.material()  // Main app annotation
@WidgetbookStory(name: 'Story Name')  // Individual story annotation
```

### Best Practices

- **Consistent Styling**: Use theme colors and typography
- **Interactive Examples**: Provide working demonstrations
- **Code Documentation**: Include clear usage examples
- **Responsive Design**: Ensure components work on all screen sizes
- **Accessibility**: Follow accessibility guidelines

## 📚 Documentation

Each component includes:

- **Visual Preview**: Live component demonstration
- **Usage Examples**: Copy-paste ready code
- **Props Documentation**: Available parameters and options
- **Best Practices**: Recommended usage patterns

## 🧪 Testing

The storybook serves as a testing environment for:

- **Component Behavior**: Test interactions and states
- **Responsive Design**: Verify layout on different screen sizes
- **Theme Integration**: Test light and dark themes
- **Performance**: Monitor component performance
- **Accessibility**: Test with screen readers and accessibility tools

## 🔄 Widgetbook Integration

### Story Organization

Stories are organized by component category:

- **App Bars**: Navigation components
- **Theme & Colors**: Design system foundations
- **Utilities**: Helper components and functions

### Theme Integration

All components use the NebuX theme system:

```dart
final theme = context.nebuxTheme;

// Colors
theme.colors.primary
theme.colors.textPrimary

// Typography
theme.typography.heading
theme.typography.content

// Spacing
theme.fontSize.large
```

### Interactive Controls

Widgetbook provides knobs for interactive property control:

```dart
@WidgetbookStory(name: 'Interactive Component')
class InteractiveStory extends StatelessWidget {
  const InteractiveStory({super.key});

  @override
  Widget build(BuildContext context) {
    return YourComponent(
      // Properties can be controlled via Widgetbook knobs
    );
  }
}
```

## 🚀 Performance Considerations

- **Lazy Loading**: Components are loaded on demand
- **Theme Caching**: Theme data is cached for performance
- **Minimal Dependencies**: Only essential packages included
- **Efficient Rendering**: Optimized widget tree structure

## 🔒 Security & Best Practices

- **No Sensitive Data**: Storybook contains no real user data
- **Code Quality**: Follows Flutter best practices
- **Accessibility**: Components support accessibility features
- **Documentation**: Comprehensive inline documentation

## 🤝 Contributing

When adding new components to the design system:

1. **Create the Component**: Implement in the main design system
2. **Add to Storybook**: Create showcase and usage examples
3. **Update Documentation**: Include comprehensive documentation
4. **Test Thoroughly**: Ensure all examples work correctly

## 📄 License

This storybook is part of the NebuX Design System and follows the same license terms.

---

**Note**: This storybook is designed to be a living documentation and testing environment. Keep it updated as the design system evolves.

## 🔗 Resources

- [Widgetbook Documentation](https://pub.dev/packages/widgetbook)
- [Flutter Documentation](https://docs.flutter.dev/)
- [NebuX Design System](../README.md)
