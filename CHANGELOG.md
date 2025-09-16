## 0.0.9

- **NEW FEATURE**: Added comprehensive country picker functionality with `NbxCountryPickerInput` component
- **NEW FEATURE**: Integrated country_picker_pro2 with full internationalization support (25+ languages)
- **ENHANCEMENT**: Added customizable phone code display option in country picker input
- **ENHANCEMENT**: Improved button component with renamed `isDisabled` to `enabled` for better clarity
- **ENHANCEMENT**: Enhanced input styling with improved hint text consistency
- **ENHANCEMENT**: Added flexible appBar support in NbxScaffold (now supports null appBar)
- **ENHANCEMENT**: Added default SizedBox constants for standardized spacing
- **IMPROVEMENT**: Refactored country selection logic with context-based theming
- **IMPROVEMENT**: Updated export structure to include new country picker components
- **DEPENDENCY**: Replaced country_picker_pro with collection dependency for better performance

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
