## 0.2.0-dev.1 (2026-02-19)

- **BREAKING**: Validation architecture consolidated
  - `singleLineFormatter` now only applies when `maxLines == 1` (or null)
  - Multi-line inputs no longer have `FilteringTextInputFormatter.singleLineFormatter` applied

- **NEW**: All `*ValidationRules` classes now exported
  - `TextValidationRules`, `EmailValidationRules`, `PasswordValidationRules`, `NumberValidationRules`, `PhoneValidationRules` accessible from public API

- **NEW**: Added `base` parameter to `NebuxTypography.withOverrides()` for test customization

- **NEW**: Added optional `typography` parameter to `NebuxTheme.fromJson()` to avoid google_fonts network calls

- **DOCS**: Comprehensive dartdoc for `NbxTextFieldWidget` and `NbxTextFormFieldWidget`
  - Clear guidance: use `NbxTextFieldWidget` for standalone inputs, `NbxTextFormFieldWidget` for Form integration

- **TESTS**: Added widget tests for `NbxTextFieldWidget` and `NbxTextFormFieldWidget`

- **FIX**: Resolved google_fonts async errors in tests by using `NebuxTypography.custom('Roboto', null)` consistently

## 0.1.20 (2026-02-19)

- **DEAD CODE CLEANUP**: Removed ~203 lines of commented-out code from `NebuxTheme.createThemeData()`
- **SEMVER GOVERNANCE**: Established formal versioning policy in `CONTRIBUTING.md`
  - Versioning policy: patch = bug fixes; minor = new features + deprecations; major = removals
  - Deprecation runway: symbols must be `@Deprecated` for ≥ 1 minor version before removal
  - API stability tiers: `stable`, `experimental`, `internal`

- **MIGRATION GUIDE**: Documented 0.1.17 → 0.1.18 breaking change in CHANGELOG
  - `customValidator` → `validator` + `onValidationResult`
  - `showEyeIcon` → `suffixIconType: NbxSuffixIconType.eye`
  - `showCancelIcon` → `suffixIconType: NbxSuffixIconType.cancel`
  - `showSuffixIcon` / `forceShowSuffixIcon` → `suffixIconType`

- **API LEAK FIX**: Removed direct `app_shimmer` re-export
  - Created `lib/src/components/shimmers/export.dart` barrel file
  - Created `NbxShimmer` wrapper widget with Nebux theming
  - Existing shimmer components now properly exported through new barrel
  - Fixed shimmer documentation: "BB Center" → "Nebux Design System"

- **RESIDUAL FIXES**:
  - `NebuxUtils.isWeb` now uses `kIsWeb` from `flutter/foundation.dart`
  - Deleted unused `NebuxAppBar` widget (zero references in codebase)
  - Fixed `NbxButton` loading spinner color to be theme-aware

## 0.1.19 (2026-02-19)

- **TEST FOUNDATION**: Established test infrastructure with ≥42% coverage on non-vendored code
  - Created `test/helpers/nebux_test_helpers.dart` with theme wrapper utilities for widget tests
  - Added comprehensive test directory structure mirroring `lib/src/`
  - Replaced placeholder `country_picker_pro_test.dart` with real test suite

- **CORE TESTS**:
  - `ColorConverter`: parsing (hex, int, Color), toJson, error handling
  - `NebuxColors`: constructor, fromJson/toJson roundtrip, lerp edge cases
  - `NebuxFontSize`: standard, custom, merge, copyWith
  - `NebuxTypography`: custom factory, withOverrides, fromThemeData, merge
  - `NebuxTheme`: custom, fromJson, copyWith, lerp, createThemeData

- **VALIDATION TESTS**:
  - `ValidationRule`: validate, condition-based skipping, CustomValidationRules
  - `TextValidationRules`: minLength, maxLength, onlyLetters, noNumbers
  - `EmailValidationRules`: validFormat, minLength, yahooOnly, domainOnly
  - `PasswordValidationRules`: minLength, hasNumbers, hasLetters, hasUppercase, hasLowercase, hasSpecialChars, hasNumbersAndLetters
  - `NbxInputValidator`: validate for all NbxInputType values, validateWithRules, validateWithRulesAndCustomError, static validators

- **WIDGET TESTS**:
  - `NbxButton`: 4 variants (filled, outline, text, danger), loading state, disabled state, expanded layout, leading/trailing icons

- **CI**: Added `--coverage` flag to test step for coverage reporting

## 0.1.18 (2026-02-18)

- **BREAKING CHANGE**: Refactored `NbxInputParameters` validation API for a clean separation of concerns

  - **Removed** `customValidator` — replaced by `validator` + `onValidationResult`
  - **Removed** `showEyeIcon`, `showCancelIcon`, `showSuffixIcon`, `forceShowSuffixIcon` — replaced by `suffixIconType`
  - **Added** `validator: String? Function(String? value)?` — pure validator following the native Flutter `FormField.validator` contract (returns error string or null)
  - **Added** `onValidationResult: void Function(String? errorMessage)?` — notification callback invoked synchronously with the final validation result after every validation cycle (null = valid). Eliminates the need for `Future.delayed` workarounds in consumers
  - **Added** `suffixIconType: NbxSuffixIconType` — enum (`none`, `eye`, `cancel`) to declare the automatic suffix icon; ignored when a custom `suffixIcon` widget is provided
  - **Added** `NbxSuffixIconType` enum to `nbx_inputs_enum.dart`
  - Updated `NbxCountryPickerInput` to expose `validator` and `onValidationResult` (replacing `customValidator`)
  - Updated `NbxPhoneFieldWidget` internal validator to use the new contract (removed `Future.delayed`)
  - Fixed `buildSuffixIcon` to always respect a custom `suffixIcon` widget before applying the read-only guard

### Migration Guide (0.1.17 → 0.1.18)

| Old API | New API | Notes |
|---------|---------|-------|
| `customValidator: (value) => ...` | `validator: (value) => ...` | Returns error string or null |
| `showEyeIcon: true` | `suffixIconType: NbxSuffixIconType.eye` | For password fields |
| `showCancelIcon: true` | `suffixIconType: NbxSuffixIconType.cancel` | Clear button |
| `showSuffixIcon: true` | `suffixIconType: NbxSuffixIconType.eye` or `.cancel` | Choose specific type |
| `forceShowSuffixIcon: true` | N/A | Suffix icon now always visible when type is set |

**Example migration:**

```dart
// Before (0.1.17)
NbxTextFieldWidget(
  parameters: NbxInputParameters(
    customValidator: (value) => value?.isEmpty == true ? 'Required' : null,
    showEyeIcon: true,
  ),
);

// After (0.1.18)
NbxTextFieldWidget(
  parameters: NbxInputParameters(
    validator: (value) => value?.isEmpty == true ? 'Required' : null,
    onValidationResult: (error) => print(error ?? 'Valid'),
    suffixIconType: NbxSuffixIconType.eye,
  ),
);
```

## 0.1.17 (2026-02-16)

- **FIX**: Forward `requiredErrorMessage` to `customValidator` when field is empty and required
  - Previously, `inputValidator` returned `requiredErrorMessage` early without calling `customValidator`, preventing external error notifiers from capturing required-field errors
  - Now calls `customValidator(requiredErrorMessage)` before returning, allowing consumers to handle the required error externally (e.g., shadow-style inputs with `InputExternalErrorWidget`)

- **CI**: Removed `develop` branch from CI trigger
  - CI now only runs on PRs targeting `main` to avoid noise during frequent develop updates

## 0.1.16 (2026-02-16)

- **NEW FEATURE**: Added `showErrorText`, `customValidator`, and border customization options to `NbxCountryPickerInput`
  - Introduced `showErrorText` parameter to control error message visibility in country picker input
  - Added `customValidator` callback for custom validation logic
  - Added border customization support for greater styling flexibility

## 0.1.15 (2026-02-15)

- **NEW FEATURE**: Added `showErrorText` parameter to `NbxInputParameters` to control error message visibility
  - Introduced `showErrorText` boolean parameter (defaults to `true`) in `NbxInputParameters`
  - When set to `false`, hides the error text below input fields while preserving validation behavior
  - Updated `NbxInputDecorationExtension` to conditionally apply error text style based on the parameter

- **ENHANCEMENT**: Enhanced letter validation to include accented characters
  - Updated `TextValidationRules.onlyLetters` regex to support accented characters (ñ, á, é, í, ó, ú, ü and their uppercase variants)
  - Improved input validation for Spanish and other Latin-based language inputs

- **CI/CD**: Added GitHub Actions for automated CI, release and publishing
  - `ci.yml`: runs `flutter analyze` and `flutter test` on PRs to main/develop
  - `release.yml`: creates git tag and GitHub Release on PR merge to main
  - `publish.yml`: publishes to pub.dev via OIDC (workflow_dispatch)
  - Excluded `country_picker_pro2` and `example` from static analysis

- **DOCS**: Rewrote README with concise documentation and all current components

- **CHORE**: Improved pub.dev score (130 → 160)
  - Added `example/example.dart` with a complete usage sample
  - Updated `google_fonts` from `^6.2.1` to `^8.0.1`
  - Updated `toml` from `^0.16.0` to `^0.18.0`
  - Bumped minimum Dart SDK to `^3.9.0` and Flutter to `>=3.29.0`
  - Removed orphan file `country_json copy.dart` with invalid naming

## 0.1.13 (2025-12-03)

- **NEW FEATURE**: Added `onBeforeOpen` callback to `NbxCountryPickerInput`
  - Introduced `onBeforeOpen` async callback to validation before opening the country picker
  - Updated `_openCountryPicker` to await the callback result

## 0.1.12 (2025-12-01)

- **NEW FEATURE**: Enhanced country selection functionality with custom country list support

  - Added `getCountriesByCodes` method in `CountryProvider` to retrieve countries based on a list of country codes
  - Updated `countrySelector`, `CountryListView`, and `showCountryListView` to accept a custom list of countries for improved flexibility
  - Modified `NbxCountryPickerModalParameters` to include a `countries` parameter, allowing for custom country lists in the picker
  - Adjusted validation logic to ensure compatibility between custom countries and other parameters
  - Enhanced country picker functionality with better customization options

- **REFACTOR**: Removed `countryPreferred` parameter and updated documentation for country selection

  - Removed the `countryPreferred` parameter from `countrySelector`, `CountryListView`, and related components to streamline the country selection process
  - Updated documentation to reflect the new `countries` parameter, allowing for custom country lists instead of preferred countries
  - Adjusted related code to ensure compatibility with the updated country selection logic
  - Improved API consistency by consolidating country selection parameters

## 0.1.11 (2025-11-29)

- **NEW FEATURE**: Added `maxLines` parameter to `NbxCountryPickerInput` and `NbxCountryPickerParameters`

  - Introduced optional `maxLines` parameter in `NbxCountryPickerParameters` to control the maximum number of lines for the input field
  - Updated `NbxCountryPickerInput` to utilize the `maxLines` parameter, enhancing input flexibility
  - Adjusted `NbxTextFormFieldWidget` to reflect the new `maxLines` property in its text display
  - Improved country picker input customization options

## 0.1.9 (2025-11-24)

- **NEW FEATURE**: Added `findByPhoneCode` method to `CountryProvider` for enhanced country selection

  - Implemented method to retrieve a country based on its phone code
  - Returns `null` if no matching country is found, improving error handling
  - Enhanced country picker functionality with better phone code lookup capabilities

- **REFACTOR**: Enhanced `NbxButton` widget structure and documentation

  - Improved widget properties and methods organization for better clarity and maintainability
  - Updated documentation comments following custom doc template for clearer parameter descriptions
  - Introduced helper methods to streamline button style and content building
  - Removed legacy constructor to simplify API and encourage use of configuration classes
  - Enhanced code readability and maintainability

- **REFACTOR**: Simplified `NbxAppBar` layout and improved title rendering

  - Removed leading button logic from app bar for cleaner architecture
  - Adjusted title spacing based on presence of leading button in `appBarConfig`
  - Updated title widget to conditionally include leading button within a Row for better layout management
  - Improved component structure and predictability

- **FIX**: Updated font sizes and weights in `NebuxTypography` for consistency

  - Adjusted font sizes for content, caption, heading, and section styles to align with design specifications
  - Updated documentation comments to reflect new font sizes and weights
  - Improved typography consistency across the design system

- **ENHANCEMENT**: Improved `NbxPhoneFieldWidget` layout

  - Adjusted `crossAxisAlignment` from `start` to `end` for improved visual alignment
  - Enhanced layout consistency in phone input fields

- **CHORE**: Updated repository links in `pubspec.yaml` to reflect new ownership

  - Changed homepage, repository, and issue tracker URLs to point to new GitHub account
  - Updated package metadata for better maintainability

- **CHORE**: Updated package dependencies
  - Added `app_shimmer` package as transitive dependency in `pubspec.lock`
  - Updated local package version references

## 0.1.7 (2025-01-27)

- **FIX**: Updated package dependencies and version constraints
  - Fixed `app_shimmer` dependency to use proper version constraint (^1.0.0)
  - Bumped package version to 0.1.7 for proper publishing sequence
  - Improved package stability and dependency management

## 0.1.6 (2025-01-27)

- **FIX**: Updated package dependencies and version constraints
  - Fixed `app_shimmer` dependency to use proper version constraint (^1.0.0)
  - Bumped package version to 0.1.6 for proper publishing sequence
  - Improved package stability and dependency management

## 0.1.4 (2025-10-06)

- REFACTOR: Chip configuration and list tile integration
  - Added `ChipConfig` utility to centralize chip parameters (label, labelStyle, colors, density, onTap)
  - Updated internal components to consume `ChipConfig` for improved reusability and maintainability
  - Refactored `AppListTileWithChip` to remove chip-specific parameters and accept a `ChipConfig`
  - Improved documentation consistency using the custom doc template
  - No breaking API changes; backwards-compatible migration path provided via config object

## 0.1.3 (2025-01-27)

- **FIX**: Updated `NbxAppBar` to automatically imply leading button for better Material Design compliance
  - Fixed `automaticallyImplyLeading` behavior to properly handle leading button display
  - Refactored `NbxScaffold` decoration property for improved customization options
  - Enhanced component consistency with Material Design guidelines

## 0.1.2 (2025-01-27)

- **REFACTOR**: Enhanced `NbxAppBar` component with improved leading button handling
  - Refactored leading button logic for better clarity and maintainability
  - Changed default `centerTitle` behavior from `true` to `false` in `AppBarConfig` for better alignment with Material Design guidelines
  - Improved `titleSpacing` logic to properly handle cases when no leading button is present
  - Set `automaticallyImplyLeading` to `false` for more predictable behavior
  - Enhanced code organization by extracting leading button building logic

## 0.1.0 (2025-09-30)

- **NEW FEATURE**: Enhanced Country model with `minLength` and `maxLength` properties for improved phone number validation
  - Added `minLength` property to Country model for minimum phone number length validation
  - Added `maxLength` property to Country model for maximum phone number length validation
  - Updated country JSON data to include length validation information
  - Improved country picker functionality with better phone number validation support
  - Enhanced user experience with more accurate phone number input validation

## 0.0.13

- **REFACTOR**: `NbxAppBar` improvements for clarity and predictable spacing
  - Adjusted `titleSpacing` logic to better align with Material `AppBar` expectations
  - Simplified status bar brightness handling by removing redundant branches
  - Minor cleanups for readability and consistency

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
