# Nebux Design System — Public API Surface (v1.0.0)

This document catalogs the public API surface for v1.0.0. All symbols listed below are considered stable and will follow semantic versioning.

## Core Layer (`Nebux` prefix)

### Theme

| Symbol | Type | Description |
|--------|------|-------------|
| `NebuxTheme` | class | Core theme container with `NebuxColors`, `NebuxTypography`, `NebuxFontSize` |
| `NebuxTheme.createThemeData()` | static method | Creates a `ThemeData` from Nebux tokens |
| `NebuxTheme.custom()` | factory | Creates theme with custom colors, optional fontSize/typography |
| `NebuxTheme.fromJson()` | static method | Creates theme from a JSON map |
| `NebuxTheme.fromColorThemes()` | static method | Creates theme from `NebuxColorThemes` and brightness |
| `NebuxColors` | @freezed class | Color palette with semantic tokens (primary, secondary, background, surface, error, success, warning, info, divider, overlay, focus, etc.) |
| `NebuxColors.standardLight()` | factory | Default light color palette |
| `NebuxColors.standardDark()` | factory | Default dark color palette |
| `NebuxColors.fromJson()` | factory | Creates colors from a JSON map |
| `NebuxColorThemes` | @freezed class | Container for light and dark color themes |
| `NebuxColorThemes.standard()` | factory | Standard Material 3 light + dark themes |
| `NebuxColorsLerp` | extension | Interpolation support for color transitions |
| `NebuxTypography` | @freezed class | Typography scale (heading, section, content, paragraph, caption, label, primaryAction, secondaryAction, formInput, placeholder). Each `TextStyle` includes explicit `height` and `letterSpacing` values. |
| `NebuxTypography.standard()` | factory | Standard Montserrat typography |
| `NebuxTypography.custom()` | factory | Custom font family typography |
| `NebuxTypography.fromThemeData()` | factory | Creates typography from Material `ThemeData` |
| `NebuxTypography.withOverrides()` | factory | Selective text style overrides |
| `NebuxFontSize` | @freezed class | Font size scale (extraSmall through display1) |
| `NebuxFontSize.standard()` | factory | Standard font size scale |
| `NebuxFontSize.custom()` | factory | Custom font size overrides |

### Theme Extensions

| Symbol | Type | Description |
|--------|------|-------------|
| `BuildContext.nebuxTheme` | extension getter | Access `NebuxTheme` from context |
| `BuildContext.nebuxColors` | extension getter | Access `NebuxColors` from context |
| `BuildContext.nebuxTypography` | extension getter | Access `NebuxTypography` from context |

### Widget Extensions

| Symbol | Type | Description |
|--------|------|-------------|
| `PaddingExtensions` | extension on Widget | Convenience methods for padding (`nbxPaddingAll`, `nbxPaddingOnly`, etc.) |
| `MarginExtensions` | extension on Widget | Convenience methods for margin |
| `IterableExtensions` | extension on Iterable | Convenience methods for iterables |

### Converters

| Symbol | Type | Description |
|--------|------|-------------|
| `ColorConverter` | class | JSON converter for `Color` |
| `LinearGradientConverter` | class | JSON converter for `LinearGradient` |

### Utilities

| Symbol | Type | Description |
|--------|------|-------------|
| `NebuxUtils` | class | Utility methods (isWeb, isMobile, capitalize, truncateText, etc.) |
| `NebuxDebouncer` | class | Debounce utility with configurable delay |
| `NebuxDynamicPair` | class | Generic pair container for two values of different types |
| `NebuxBottomSheet` | mixin | Convenience method for modal bottom sheets |

### Spacing

| Symbol | Type | Description |
|--------|------|-------------|
| `heightSpace2` .. `heightSpace200` | constants | Pre-built vertical `SizedBox` spacing widgets |
| `widthSpace2` .. `widthSpace48` | constants | Pre-built horizontal `SizedBox` spacing widgets |
| `defaultPaddingSize` | constant | Default padding value (16) |

## Component Layer (`Nbx` prefix)

### Buttons

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxButton` | widget | Primary button component with variant support |
| `NbxSocialLoginButton` | widget | Social login button (Google, Apple, etc.) with icon + label |
| `ButtonVariant` | enum | Button variants (filled, text, outline, danger) |
| `ButtonStyleConfig` | class | Button style configuration (variant, colors, borderRadius, textStyle) |
| `ButtonLayoutConfig` | class | Button layout configuration (isExpanded) |
| `ButtonStateConfig` | class | Button state configuration (isLoading, enabled, isSelected, `loadingColor`) |
| `ButtonIconConfig` | class | Button icon configuration (leading/trailing icons) |

### Inputs

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxTextFieldWidget` | widget | Standalone text input (no Form) |
| `NbxTextFormFieldWidget` | widget | Form-integrated text input |
| `NbxTextFieldWithStateWidget` | widget | Stateful text input wrapper (suffix icon toggling, validation state) |
| `NbxPhoneFieldWidget` | widget | Phone number input with country picker (includes `noCountryHelperText`) |
| `NbxCountryPickerInput` | widget | Country picker input |
| `NbxInputParameters` | @freezed class | Input configuration DTO (no `BuildContext` parameter) |
| `NbxCountryPickerParameters` | @freezed class | Country picker configuration DTO |
| `NbxCountryPickerModalParameters` | @freezed class | Country picker modal configuration |
| `NbxInputType` | enum | Input type variants (text, free, onlyText, textAndNumbers, dropdownMenu, alphabet, number, phone, password, decimalNumber, email) |
| `NbxInputDecorationStyle` | enum | Decoration style variants (floating, outlined, filled) |
| `NbxSuffixIconType` | enum | Suffix icon variants (none, eye, cancel) |
| `NbxInputState` | enum | Input visual state (neutral, success, error) |
| `NbxInputValidator` | class | Validation helper methods (validate, validateWithRules) |

### Validation Rules

| Symbol | Type | Description |
|--------|------|-------------|
| `ValidationRule` | class | Single validation rule with validator, errorMessage, optional condition |
| `CustomValidationRules` | class | Custom validation rule builders (regex, function) |
| `TextValidationRules` | class | Text validation rules (minLength, maxLength, regex, etc.) |
| `EmailValidationRules` | class | Email validation rules |
| `PasswordValidationRules` | class | Password validation rules (minLength, hasUppercase, etc.) |
| `NumberValidationRules` | class | Number validation rules (min, max, range, etc.) |
| `PhoneValidationRules` | class | Phone validation rules |

### Country Picker

| Symbol | Type | Description |
|--------|------|-------------|
| `TranslationLoader` | singleton class | Loads country name translations from JSON assets with in-memory caching |
| `TranslationLoader.load()` | method | Loads translations for a given locale |
| `TranslationLoader.translate()` | method | Returns translated country name |
| `TranslationLoader.getTranslation()` | method | Returns translation map for a locale |
| `TranslationLoader.supportedLanguageCodes` | getter | List of supported language codes |
| `TranslationLoader.supportedLocales` | getter | List of supported locales |
| `TranslationLoader.isLanguageCodeSupported()` | method | Check if a language code is supported |
| `TranslationLoader.supportedLocalesWithVariants` | getter | Complete list of supported locales including script variants |
| `CountryPickerSearchConfig` | class | Immutable config for search bar styling |
| `CountryPickerAppBarConfig` | class | Immutable config for app bar styling |
| `CountryPickerStyleConfig` | class | Immutable config for flag/text styling |

### Images

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxNetworkImage` | widget | Network image with caching |
| `NbxImageCacheConfig` | class | Cache configuration |
| `NbxImageAnimationConfig` | class | Animation configuration |
| `NbxImageProgressConfig` | class | Progress indicator configuration |
| `NbxImageStyleConfig` | class | Style configuration |
| `NbxNetworkImageExtensions` | extension | Factory constructors (circular, square, rounded) |

### Scaffold

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxScaffold` | widget | Custom scaffold with config classes |
| `AppBarConfig` | class | App bar configuration (includes `dividerThickness`) |
| `BodyConfig` | class | Body configuration (includes `extendBodyBehindAppBar`) |
| `SafeAreaConfig` | class | Safe area configuration |

### Shared Widgets

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxDividerWidget` | widget | Divider widget |

### Shimmers

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxShimmer` | widget | Shimmer loading effect wrapper with theme-consistent gradient |
| `NbxShimmerAnimation` | widget | Standalone shimmer animation |
| `NbxShimmerContainer` | widget | Basic shimmer container placeholder |
| `NbxShimmerContainerExpanded` | widget | Expanded shimmer container |
| `NbxShimmerContainerList` | widget | List of shimmer containers |
| `NbxShimmerTwiceContainerList` | widget | Double-row shimmer container list |
| `NbxShimmerListTile` | widget | Shimmer list tile with leading/title/subtitle/trailing |
| `NbxShimmerListTileListView` | widget | Scrollable list of shimmer list tiles |
| `NbxShimmerGrid` | widget | Grid of shimmer containers |
| `ShimmerSkeletonStyle` | class | Style configuration for shimmer elements (width, height, borderRadius) |
| `ShimmerConstants` | class | Default shimmer dimension constants |

## Experimental / Unstable

The following symbols are marked `@experimental` and may change without a major version bump:

- None at this time

## Deprecated Symbols

The following symbols are deprecated and will be removed in a future version:

- `NebuxAppBar` — removed in Sprint 2 (v0.1.20)

## Removed in v0.3.0

The following symbols were removed in v0.3.0:

- `countries.dart` — 7,575 LOC of dead code (never imported)
- `AlphaScroller` — 258 LOC orphaned widget (never imported)
- `CountryProvider` — unused duplicate of `CountryDecoder`
- 33 Dart translation files — replaced by 33 JSON assets via `TranslationLoader`

## Migration Notes

### v1.0.0 Changes

1. **Typography now includes `height` and `letterSpacing`**
   - All `TextStyle` fields in `NebuxTypography.standard()` and `NebuxTypography.custom()` now include explicit `height` (line-height multiplier) and `letterSpacing` values aligned with Material Design 3 type scale
   - This improves cross-platform consistency and accessibility

2. **`NebuxColors` expanded with three new tokens**
   - `divider` — for dividers and borders
   - `overlay` — for scrim and modal backdrop
   - `focus` — for focus rings and accessibility indicators

3. **`NebuxTheme.createThemeData()` enhanced**
   - Now generates a complete Material 3 `ThemeData` including `ColorScheme`, `AppBarTheme`, `CardTheme`, `InputDecorationTheme`, `TextTheme`, button themes, divider theme, and icon theme

### v0.2.0 Breaking Changes

1. **`NbxInputParameters` no longer accepts `BuildContext`**
   - Before: `NbxInputParameters(context: context, ...)`
   - After: `NbxInputParameters(...)` — pass context to `inputDecoration(context)` when needed

2. **`NbxNetworkImage` constructor restructured**
   - Before: 33 individual parameters
   - After: 11 top-level parameters + 4 config classes (`cacheConfig`, `animationConfig`, `progressConfig`, `styleConfig`)

3. **`NbxNetworkImage.cacheManager` is now typed**
   - Before: `dynamic cacheManager`
   - After: `BaseCacheManager? cacheManager` (in `NbxImageCacheConfig`)

## Dependencies

| Package | Version | Notes |
|---------|---------|-------|
| `flutter_cache_manager` | ^3.4.1 | Direct dependency (required by `NbxNetworkImage` caching) |
