# Nebux Design System - Architecture Diagrams

## 🏗️ System Architecture

```mermaid
graph TB
    subgraph "Nebux Design System"
        subgraph "Core Layer"
            A[Theme System] --> B[Color System]
            A --> C[Typography System]
            A --> D[Spacing System]
            A --> E[Extensions]
            A --> F[Utilities]
        end
        
        subgraph "Component Layer"
            G[Buttons] --> H[NbxButton]
            G --> I[NbxSocialLoginButton]
            J[Inputs] --> K[NbxTextFieldWidget]
            J --> L[NbxInputParameters]
            M[Layout] --> N[NbxScaffold]
            M --> O[NbxAppBar]
            P[Images] --> Q[NbxNetworkImage]
        end
        
        subgraph "Application Layer"
            R[MaterialApp] --> S[Theme Integration]
            T[Widgets] --> U[Component Usage]
            V[State Management] --> W[Theme Updates]
        end
    end
    
    B --> G
    C --> G
    D --> G
    E --> G
    F --> G
    
    B --> J
    C --> J
    D --> J
    E --> J
    F --> J
    
    B --> M
    C --> M
    D --> M
    E --> M
    F --> M
    
    B --> P
    C --> P
    D --> P
    E --> P
    F --> P
    
    A --> R
    G --> T
    J --> T
    M --> T
    P --> T
```

## 🎨 Theme System Flow

```mermaid
flowchart TD
    A[Theme Configuration] --> B{Theme Type}
    B -->|Custom| C[NebuxTheme.custom]
    B -->|JSON| D[NebuxTheme.fromJson]
    B -->|Color Themes| E[NebuxTheme.fromColorThemes]
    
    C --> F[Theme Creation]
    D --> F
    E --> F
    
    F --> G[Color System]
    F --> H[Typography System]
    F --> I[Font Size System]
    
    G --> J[Primary Colors]
    G --> K[Secondary Colors]
    G --> L[Semantic Colors]
    G --> M[Gradients]
    
    H --> N[Text Styles]
    H --> O[Font Weights]
    H --> P[Line Heights]
    
    I --> Q[Font Sizes]
    I --> R[Scale System]
    
    J --> S[ThemeData Creation]
    K --> S
    L --> S
    M --> S
    N --> S
    O --> S
    P --> S
    Q --> S
    R --> S
    
    S --> T[MaterialApp Integration]
    T --> U[Widget Rendering]
```

## 🧩 Component Hierarchy

```mermaid
graph TD
    subgraph "Button Components"
        A[NbxButton] --> B[ButtonVariant.primary]
        A --> C[ButtonVariant.secondary]
        A --> D[ButtonVariant.outline]
        A --> E[ButtonVariant.danger]
        
        F[NbxSocialLoginButton] --> G[Google Login]
        F --> H[Apple Login]
        F --> I[Facebook Login]
    end
    
    subgraph "Input Components"
        J[NbxTextFieldWidget] --> K[NbxInputParameters]
        K --> L[NbxInputType.text]
        K --> M[NbxInputType.email]
        K --> N[NbxInputType.password]
        K --> O[NbxInputType.phone]
        K --> P[NbxInputType.number]
        
        Q[NbxFormType.outlined]
        Q --> R[NbxFormType.filled]
        Q --> S[NbxFormType.underlined]
    end
    
    subgraph "Layout Components"
        T[NbxScaffold] --> U[AppBarConfig]
        T --> V[SafeAreaConfig]
        T --> W[BodyConfig]
        
        X[NbxAppBar] --> Y[Navigation]
        X --> Z[Drag Handle]
    end
    
    subgraph "Image Components"
        AA[NbxNetworkImage] --> BB[Loading State]
        AA --> CC[Error State]
        AA --> DD[Success State]
    end
```

## 🔧 Extension System

```mermaid
graph LR
    subgraph "BuildContext Extensions"
        A[nebuxTheme] --> B[Theme Access]
        C[nebuxColors] --> D[Color Access]
        E[nebuxTypography] --> F[Typography Access]
    end
    
    subgraph "Widget Extensions"
        G[Padding Extensions] --> H[paddingAll]
        G --> I[paddingHorizontal]
        G --> J[paddingVertical]
        G --> K[paddingSymmetric]
        
        L[Margin Extensions] --> M[marginAll]
        L --> N[marginHorizontal]
        L --> O[marginVertical]
        L --> P[marginSymmetric]
    end
    
    subgraph "Color Extensions"
        Q[getColorsByBrightness] --> R[Light Theme]
        Q --> S[Dark Theme]
    end
```

## 📱 Responsive Design Flow

```mermaid
flowchart TD
    A[Screen Size Detection] --> B{Device Type}
    B -->|Mobile| C[Mobile Layout]
    B -->|Tablet| D[Tablet Layout]
    B -->|Desktop| E[Desktop Layout]
    
    C --> F[Small Spacing]
    C --> G[Mobile Typography]
    C --> H[Touch Targets]
    
    D --> I[Medium Spacing]
    D --> J[Tablet Typography]
    D --> K[Larger Touch Targets]
    
    E --> L[Large Spacing]
    E --> M[Desktop Typography]
    E --> N[Mouse Interactions]
    
    F --> O[Component Rendering]
    G --> O
    H --> O
    I --> O
    J --> O
    K --> O
    L --> O
    M --> O
    N --> O
```

## 🎯 Usage Patterns

```mermaid
sequenceDiagram
    participant App as Flutter App
    participant Theme as NebuxTheme
    participant Component as NbxButton
    participant Context as BuildContext
    
    App->>Theme: Create Theme
    Theme->>Theme: Configure Colors
    Theme->>Theme: Configure Typography
    Theme->>Theme: Configure Spacing
    Theme->>App: Return ThemeData
    
    App->>App: Apply to MaterialApp
    
    App->>Component: Create NbxButton
    Component->>Context: Access Theme
    Context->>Theme: Get Colors
    Context->>Theme: Get Typography
    Theme->>Context: Return Values
    Context->>Component: Apply Styling
    Component->>App: Render Button
```

## 🔄 State Management Flow

```mermaid
stateDiagram-v2
    [*] --> ThemeInitialization
    ThemeInitialization --> LightTheme
    ThemeInitialization --> DarkTheme
    
    LightTheme --> ThemeUpdate
    DarkTheme --> ThemeUpdate
    
    ThemeUpdate --> ColorUpdate
    ThemeUpdate --> TypographyUpdate
    ThemeUpdate --> SpacingUpdate
    
    ColorUpdate --> ComponentRebuild
    TypographyUpdate --> ComponentRebuild
    SpacingUpdate --> ComponentRebuild
    
    ComponentRebuild --> ThemeApplied
    ThemeApplied --> [*]
    
    note right of ThemeUpdate
        User changes theme
        or system preference
    end note
    
    note right of ComponentRebuild
        All components using
        the theme are rebuilt
    end note
```

## 📊 Performance Optimization

```mermaid
graph TD
    subgraph "Performance Layers"
        A[Theme Caching] --> B[Color Caching]
        A --> C[Typography Caching]
        A --> D[Spacing Caching]
        
        E[Component Optimization] --> F[Const Constructors]
        E --> G[Widget Reuse]
        E --> H[State Management]
        
        I[Memory Management] --> J[Controller Disposal]
        I --> K[Timer Cleanup]
        I --> L[Image Caching]
    end
    
    B --> M[Fast Theme Access]
    C --> M
    D --> M
    F --> N[Reduced Rebuilds]
    G --> N
    H --> N
    J --> O[Memory Efficiency]
    K --> O
    L --> O
    
    M --> P[Optimized Rendering]
    N --> P
    O --> P
```

## 🧪 Testing Architecture

```mermaid
graph TD
    subgraph "Testing Layers"
        A[Unit Tests] --> B[Theme Tests]
        A --> C[Utility Tests]
        A --> D[Extension Tests]
        
        E[Widget Tests] --> F[Component Tests]
        E --> G[Integration Tests]
        E --> H[Theme Tests]
        
        I[Integration Tests] --> J[Full App Tests]
        I --> K[Theme Switching Tests]
        I --> L[Responsive Tests]
    end
    
    B --> M[Test Coverage]
    C --> M
    D --> M
    F --> M
    G --> M
    H --> M
    J --> M
    K --> M
    L --> M
    
    M --> N[Quality Assurance]
```

## 🚀 Deployment Flow

```mermaid
flowchart TD
    A[Development] --> B[Code Review]
    B --> C[Testing]
    C --> D{Tests Pass?}
    D -->|No| E[Fix Issues]
    E --> C
    D -->|Yes| F[Build Package]
    F --> G[Version Bump]
    G --> H[Publish to pub.dev]
    H --> I[Documentation Update]
    I --> J[Release Notes]
    J --> K[Deployment Complete]
    
    K --> L[User Adoption]
    L --> M[Feedback Collection]
    M --> N[Issue Tracking]
    N --> A
```

---

**Note**: These diagrams are created using Mermaid syntax and can be rendered in any Mermaid-compatible viewer or documentation system.
