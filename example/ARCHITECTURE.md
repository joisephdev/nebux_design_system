# NebuX Core Example Architecture

## App Structure Overview

```mermaid
graph TB
    A[main.dart] --> B[HomeScreen]
    B --> C[ThemeDemoScreen]
    B --> D[TypographyDemoScreen]
    B --> E[SpacingDemoScreen]

    A --> F[NebuxCoreExampleApp]
    F --> G[Light Theme]
    F --> H[Dark Theme]

    G --> I[NebuxColors]
    G --> J[NebuxTypography]
    G --> K[NebuxFontSize]

    H --> L[NebuxColors Dark]
    H --> M[NebuxTypography]
    H --> N[NebuxFontSize]

    style A fill:#e1f5fe
    style F fill:#f3e5f5
    style G fill:#e8f5e8
    style H fill:#fff3e0
```

## Component Flow

```mermaid
flowchart LR
    A[User Opens App] --> B[HomeScreen]
    B --> C{User Selects Demo}
    C -->|Theme| D[ThemeDemoScreen]
    C -->|Typography| E[TypographyDemoScreen]
    C -->|Spacing| F[SpacingDemoScreen]
    C -->|Components| G[Components Dialog]

    D --> H[Color Palette Demo]
    D --> I[Theme Components Demo]
    D --> J[Custom Theme Example]

    E --> K[Text Styles Demo]
    E --> L[Font Sizes Demo]
    E --> M[Custom Typography Example]

    F --> N[Height Spacing Demo]
    F --> O[Width Spacing Demo]
    F --> P[Usage Examples]

    style A fill:#e3f2fd
    style B fill:#f1f8e9
    style D fill:#fff3e0
    style E fill:#fce4ec
    style F fill:#f3e5f5
```

## Theme System Architecture

```mermaid
graph TD
    A[NebuxTheme] --> B[NebuxColors]
    A --> C[NebuxTypography]
    A --> D[NebuxFontSize]

    B --> E[Primary Color]
    B --> F[Secondary Color]
    B --> G[Scaffold Color]
    B --> H[Error Color]
    B --> I[Neutral Colors]

    C --> J[Body Styles]
    C --> K[Label Styles]
    C --> L[Display Styles]
    C --> M[Custom Styles]

    D --> N[Small: 12px]
    D --> O[Medium: 14px]
    D --> P[Large: 16px]
    D --> Q[Extra Large: 18px]
    D --> R[Heading Sizes]

    A --> S[ThemeData]
    S --> T[MaterialApp]

    style A fill:#e8f5e8
    style B fill:#fff3e0
    style C fill:#fce4ec
    style D fill:#f3e5f5
    style S fill:#e1f5fe
```

## Spacing System

```mermaid
graph LR
    A[Spacing Utilities] --> B[Height Spacers]
    A --> C[Width Spacers]

    B --> D[heightSpace2]
    B --> E[heightSpace8]
    B --> F[heightSpace16]
    B --> G[heightSpace24]
    B --> H[heightSpace32]
    B --> I[heightSpace200]

    C --> J[widthSpace2]
    C --> K[widthSpace8]
    C --> L[widthSpace16]
    C --> M[widthSpace24]
    C --> N[widthSpace25]

    style A fill:#e8f5e8
    style B fill:#fff3e0
    style C fill:#fce4ec
```

## Key Design Principles

### 🎨 **Consistency**

- All UI components follow the same design language
- Consistent spacing, typography, and color usage
- Standardized component behavior and styling

### 🔧 **Modularity**

- Each screen demonstrates a specific aspect of the design system
- Reusable components and utilities
- Clear separation of concerns

### 📱 **User Experience**

- Intuitive navigation between different demos
- Clear visual hierarchy and information architecture
- Responsive design that works on different screen sizes

### 🎯 **Educational Value**

- Code examples with explanations
- Visual demonstrations of design system features
- Best practices and usage patterns

## File Organization

```
example/
├── 📁 screens/                    # Demo screens
│   ├── 🏠 home_screen.dart        # Main navigation hub
│   ├── 🎨 theme_demo_screen.dart  # Theme system showcase
│   ├── 📝 typography_demo_screen.dart # Typography examples
│   └── 📏 spacing_demo_screen.dart   # Spacing utilities
├── 🚀 main.dart                   # App entry point
├── ⚙️ pubspec.yaml               # Dependencies
├── 📖 README.md                   # Documentation
└── 🏗️ ARCHITECTURE.md            # This file
```

## Dependencies

```mermaid
graph TD
    A[nebux_core_example] --> B[nebux_core]
    A --> C[flutter]
    A --> D[google_fonts]
    A --> E[freezed_annotation]
    A --> F[json_annotation]

    B --> G[flutter]
    B --> H[google_fonts]
    B --> I[freezed_annotation]
    B --> J[json_annotation]

    style A fill:#e8f5e8
    style B fill:#fff3e0
    style C fill:#fce4ec
    style D fill:#f3e5f5
```

## Development Workflow

1. **Setup**: Navigate to example directory and run `flutter pub get`
2. **Development**: Make changes to demo screens or add new features
3. **Testing**: Run the app with `flutter run` to see changes
4. **Documentation**: Update README.md and ARCHITECTURE.md as needed
5. **Contribution**: Submit pull requests for improvements

## Best Practices Demonstrated

- **Separation of Concerns**: Each screen focuses on one aspect of the design system
- **Code Reusability**: Common utilities and components are shared
- **Documentation**: Comprehensive comments and explanations
- **Accessibility**: Proper contrast ratios and readable fonts
- **Performance**: Efficient widget structure and minimal rebuilds
