# NebuX Design System Storybook - Architecture

## 🏗️ Overall Architecture

```mermaid
graph TB
    A[WidgetbookApp] --> B[Design System Showcase]
    B --> C[App Bars Stories]
    B --> D[Theme Stories]
    B --> E[Utils Stories]

    C --> F[NebuxAppBar Component]
    D --> G[Color Palette]
    D --> H[Typography Examples]
    D --> I[Spacing Examples]
    E --> J[Bottom Sheet]
    E --> K[Spacing Utilities]
    E --> L[Color Converter]

    M[NebuX Design System] --> A
    M --> F
    M --> G
    M --> H
    M --> I
    M --> J
    M --> K
    M --> L

    N[Widgetbook Framework] --> A
    N --> O[Story Generation]
    N --> P[Interactive Controls]
    N --> Q[Theme Switching]

    style A fill:#e1f5fe
    style M fill:#f3e5f5
    style N fill:#fff3e0
    style B fill:#f1f8e9
    style C fill:#fff3e0
    style D fill:#fff3e0
    style E fill:#fff3e0
```

## 📱 App Structure

```mermaid
graph LR
    A[main.dart] --> B[WidgetbookApp]
    B --> C[AppBarsStories]
    B --> D[ThemeStories]
    B --> E[UtilsStories]

    C --> F[NebuxAppBar Story]
    C --> G[Usage Examples]

    D --> H[Color Palette Story]
    D --> I[Typography Story]
    D --> J[Spacing Story]

    E --> K[Bottom Sheet Story]
    E --> L[Spacing Story]
    E --> M[Color Converter]

    style A fill:#2196f3,color:#fff
    style B fill:#4caf50,color:#fff
    style C fill:#ff9800,color:#fff
    style D fill:#ff9800,color:#fff
    style E fill:#ff9800,color:#fff
```

## 🎨 Component Showcase Flow

```mermaid
flowchart TD
    A[User Opens Widgetbook] --> B[Main Navigation]
    B --> C{Select Category}
    C -->|App Bars| D[App Bars Stories]
    C -->|Theme & Colors| E[Theme Stories]
    C -->|Utilities| F[Utils Stories]

    D --> G[View NebuxAppBar]
    D --> H[See Code Examples]

    E --> I[Color Palette]
    E --> J[Typography Examples]
    E --> K[Spacing Examples]

    F --> L[Bottom Sheet Demo]
    F --> M[Spacing Utilities]
    F --> N[Color Converter]

    G --> O[Interactive Demo]
    I --> P[Color Cards]
    J --> Q[Text Style Cards]
    L --> R[Show Bottom Sheet]

    style A fill:#2196f3,color:#fff
    style B fill:#4caf50,color:#fff
    style C fill:#ff9800,color:#fff
```

## 🔧 Technical Implementation

### File Structure

```
nebux_core/example/
├── lib/
│   ├── main.dart                    # App entry point with WidgetbookApp
│   └── stories/                     # Component showcases
│       ├── app_bars_stories.dart    # App bar components
│       ├── theme_stories.dart       # Theme & colors
│       └── utils_stories.dart       # Utility components
├── pubspec.yaml                     # Dependencies
├── analysis_options.yaml            # Linting rules
├── README.md                        # Documentation
└── ARCHITECTURE.md                  # This file
```

### Dependencies

```mermaid
graph TD
    A[Widgetbook App] --> B[nebux_design_system]
    A --> C[widgetbook]
    A --> D[widgetbook_annotation]
    A --> E[flutter]
    A --> F[google_fonts]

    B --> G[Core Components]
    B --> H[Theme System]
    B --> I[Utility Functions]

    G --> J[NebuxAppBar]
    H --> K[Colors]
    H --> L[Typography]
    H --> M[Spacing]
    I --> N[Bottom Sheet]
    I --> O[Helpers]

    C --> P[Story Generation]
    C --> Q[Interactive Controls]
    C --> R[Theme Switching]

    style A fill:#2196f3,color:#fff
    style B fill:#4caf50,color:#fff
    style C fill:#ff9800,color:#fff
```

## 🎯 Design Patterns

### Widgetbook Story Pattern

Each story follows a consistent pattern:

```dart
@WidgetbookStory(name: 'Story Name')
class ComponentStory extends StatelessWidget {
  const ComponentStory({super.key});

  @override
  Widget build(BuildContext context) {
    return YourComponent();
  }
}
```

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

## 🔄 State Management

The Widgetbook app uses a simple state management approach:

```mermaid
graph LR
    A[Widget] --> B[Theme Context]
    B --> C[Colors]
    B --> D[Typography]
    B --> E[Spacing]

    F[User Interaction] --> G[Component Demo]
    G --> H[Live Preview]

    I[Widgetbook Controls] --> J[Property Changes]
    J --> K[Component Updates]

    style A fill:#2196f3,color:#fff
    style B fill:#4caf50,color:#fff
    style F fill:#ff9800,color:#fff
    style I fill:#9c27b0,color:#fff
```

## 📱 Responsive Design

The app is designed to work across different screen sizes:

```mermaid
graph TB
    A[Responsive Layout] --> B[Mobile]
    A --> C[Tablet]
    A --> D[Desktop]

    B --> E[Single Column]
    C --> F[Two Column]
    D --> G[Multi Column]

    E --> H[Stacked Cards]
    F --> I[Side by Side]
    G --> J[Grid Layout]

    style A fill:#2196f3,color:#fff
    style B fill:#4caf50,color:#fff
    style C fill:#4caf50,color:#fff
    style D fill:#4caf50,color:#fff
```

## 🧪 Testing Strategy

```mermaid
graph LR
    A[Component Testing] --> B[Visual Testing]
    A --> C[Interaction Testing]
    A --> D[Theme Testing]
    A --> E[Widgetbook Testing]

    B --> F[Component Rendering]
    B --> G[Layout Verification]

    C --> H[User Interactions]
    C --> I[Navigation Testing]

    D --> J[Light Theme]
    D --> K[Dark Theme]

    E --> L[Story Generation]
    E --> M[Interactive Controls]
    E --> N[Property Changes]

    style A fill:#2196f3,color:#fff
    style B fill:#4caf50,color:#fff
    style C fill:#ff9800,color:#fff
    style D fill:#9c27b0,color:#fff
    style E fill:#e91e63,color:#fff
```

## 🚀 Performance Considerations

- **Lazy Loading**: Components are loaded on demand
- **Theme Caching**: Theme data is cached for performance
- **Minimal Dependencies**: Only essential packages included
- **Efficient Rendering**: Optimized widget tree structure
- **Widgetbook Optimization**: Efficient story generation and navigation

## 🔒 Security & Best Practices

- **No Sensitive Data**: Storybook contains no real user data
- **Code Quality**: Follows Flutter best practices
- **Accessibility**: Components support accessibility features
- **Documentation**: Comprehensive inline documentation
- **Widgetbook Standards**: Follows Widgetbook best practices

## 🔄 Widgetbook Integration

### Story Organization

```mermaid
graph TD
    A[WidgetbookApp] --> B[Categories]
    B --> C[App Bars]
    B --> D[Theme & Colors]
    B --> E[Utilities]

    C --> F[NebuxAppBar Story]
    D --> G[Color Palette Story]
    D --> H[Typography Story]
    D --> I[Spacing Story]
    E --> J[Bottom Sheet Story]
    E --> K[Spacing Story]

    style A fill:#2196f3,color:#fff
    style B fill:#4caf50,color:#fff
    style C fill:#ff9800,color:#fff
    style D fill:#ff9800,color:#fff
    style E fill:#ff9800,color:#fff
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

---

This architecture ensures the Widgetbook app serves as both a showcase and a testing environment for the NebuX Design System components, with full integration of the Widgetbook framework for interactive component exploration.
