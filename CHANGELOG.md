## 0.0.12

- **BREAKING CHANGE**: Refactored `NbxButton` component architecture for improved modularity and maintainability
  - Introduced configuration-based architecture with specialized config classes:
    - `ButtonIconConfig`: Manages icon properties (leading/trailing icons and colors)
    - `ButtonStyleConfig`: Handles visual styling (variant, colors, border radius, text style)
    - `ButtonStateConfig`: Controls state management (loading, enabled, selected)
    - `ButtonLayoutConfig`: Manages layout properties (expansion behavior)
  - Added new constructor with configuration objects for better organization
  - Maintained backward compatibility with `NbxButton.legacy()` constructor
  - Improved code organization by reducing main widget from 275 lines to ~100 lines
  - Enhanced testability with isolated configuration classes
  - Increased component reusability through modular configuration system
  - Better separation of concerns with dedicated config files
  - Added comprehensive documentation following custom doc format
  - Improved maintainability with isolated change impact

## 0.0.11

- **REFACTOR**: Enhanced `NbxButton` rendering logic with improved clarity and modularity
  - Introduced dedicated `_buildTextWidget` method to handle text rendering based on button variant
  - Simplified button child widget construction by consolidating text and icon handling
  - Enhanced readability and maintainability of the `NbxButton` component
  - Added proper text overflow handling with `TextOverflow.fade` and `maxLines: 2`
  - Improved text alignment and spacing with `CrossAxisAlignment.center` and `TextAlign.center`
  - Added `Flexible` wrapper for better text layout flexibility

## 0.0.10

- **ENHANCEMENT**: Added `isSelected` property to `NbxButton` to indicate selection state with corresponding background/foreground style updates
- **REFACTOR**: Simplified `NbxButton` variant rendering by replacing if-else with switch-case and consolidating text style application
- **CHORE**: Commented out `repository` and `issue_tracker` fields in `pubspec.yaml` for cleaner configuration

## Country Picker Integration

The Nebux Design System includes a custom implementation of country picker functionality based on the [country_picker_pro](https://pub.dev/packages/country_picker_pro) package. This integration provides:

- **Custom Implementation**: Fork of the original `country_picker_pro` package with enhanced Nebux theming
- **Internationalization**: Full support for 25+ languages
- **Theme Integration**: Seamless integration with Nebux color and typography systems
- **Enhanced Customization**: Improved accessibility and styling options
- **Consistent UX**: Matches the design patterns of other Nebux components

The country picker functionality is available through the `NbxCountryPickerInput` component and can be used for country selection in forms, user registration, and profile management.

## 0.0.9

- **NEW FEATURE**: Added comprehensive country picker functionality with `NbxCountryPickerInput` component
- **NEW FEATURE**: Integrated custom country picker implementation based on [country_picker_pro](https://pub.dev/packages/country_picker_pro) package
- **NEW FEATURE**: Full internationalization support (25+ languages) for country selection
- **ENHANCEMENT**: Added customizable phone code display option in country picker input
- **ENHANCEMENT**: Improved button component with renamed `isDisabled` to `enabled` for better clarity
- **ENHANCEMENT**: Enhanced input styling with improved hint text consistency
- **ENHANCEMENT**: Added flexible appBar support in NbxScaffold (now supports null appBar)
- **ENHANCEMENT**: Added default SizedBox constants for standardized spacing
- **IMPROVEMENT**: Refactored country selection logic with context-based theming
- **IMPROVEMENT**: Updated export structure to include new country picker components
- **DEPENDENCY**: Replaced external country_picker_pro dependency with custom implementation for better integration

## 0.0.8

- **BREAKING CHANGE**: Refactored button variants for better clarity - renamed 'primary' to 'filled' and 'secondary' to 'text'
- Enhanced typography system with custom factory method for flexible text style overrides
- Improved text validation rules with named parameters for better clarity and maintainability
- Enhanced input field styling with improved label and hint styles using textSecondary color with reduced opacity
- Added floatingLabelStyle to input decoration for consistent theming across input fields
- Introduced customBackgroundColor property to NbxButton for flexible background color customization
- Enhanced NbxAppBar with customizable leading button for improved component flexibility
- Added secondaryVariant color to NebuxColors for better theming support
- Refined typography styles with updated font sizes for improved consistency
- Generated new model files for enhanced component structure and theming consistency
- Updated .gitignore configuration for better generated file management

## 0.0.5

- **BREAKING CHANGE**: Removed `font_awesome_flutter` dependency for better performance and smaller bundle size
- Enhanced `NebuxAppBar` with customizable icon support, removing dependency on FontAwesome icons
- Refactored `NbxSocialLoginButton` to support custom icons instead of FontAwesome icons
- Improved input field styling with enhanced `enabledBorder` configuration in `NbxInputDecorationExtension`
- Better visual consistency across input components

## 0.0.4

- Enhanced README.md with improved documentation
- Improved package documentation and usage examples

## 0.0.3

- Updated version to reflect latest changes in the Nebux Design System

## 0.0.2

- Enhanced README.md with improved feature descriptions
- Added detailed installation instructions
- Included comprehensive usage examples for components and theming
- Updated support contact information

## 0.0.1

- Initial release of NebuX Design System
- Complete theme system with light and dark mode support
- Typography system with consistent text styles and font sizes
- Spacing utilities for standardized layouts
- UI Components including:
  - App bars with customizable styling
  - Button components with multiple variants
  - Text field widgets with validation
  - Network image component with caching
  - Scaffold components for consistent page structure
- Color management system with primary, secondary, and neutral colors
- Responsive design utilities
- Comprehensive documentation and examples
