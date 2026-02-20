# Nebux Design System — Public API Surface (v0.3.0)

This document catalogs the public API surface for v0.3.0. All symbols listed below are considered stable and will follow semantic versioning.

## Core Layer (`Nebux` prefix)

### Theme

| Symbol | Type | Description |
|--------|------|-------------|
| `NebuxTheme` | class | Core theme container with `NebuxColors`, `NebuxTypography`, `NebuxFontSize` |
| `NebuxTheme.createThemeData()` | factory | Creates a `ThemeData` from Nebux tokens |
| `NebuxColors` | @freezed class | Color palette with semantic tokens (primary, secondary, background, error, etc.) |
| `NebuxColors.standardLight()` | factory | Default light color palette |
| `NebuxColors.standardDark()` | factory | Default dark color palette |
| `NebuxTypography` | @freezed class | Typography scale (heading, label, content, caption, formInput) |
| `NebuxFontSize` | @freezed class | Font size scale |
| `NebuxColorThemes` | class | Predefined color theme constants |

### Theme Extensions

| Symbol | Type | Description |
|--------|------|-------------|
| `BuildContext.nebuxTheme` | extension getter | Access theme from context |
| `BuildContext.nebuxColors` | extension getter | Access colors from context |
| `BuildContext.nebuxTypography` | extension getter | Access typography from context |

### Converters

| Symbol | Type | Description |
|--------|------|-------------|
| `ColorConverter` | class | JSON converter for `Color` |
| `LinearGradientConverter` | class | JSON converter for `LinearGradient` |

### Utilities

| Symbol | Type | Description |
|--------|------|-------------|
| `NebuxUtils` | class | Utility methods (isWeb, etc.) |

## Component Layer (`Nbx` prefix)

### Buttons

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxButton` | widget | Primary button component |
| `ButtonStyleConfig` | class | Button style configuration |
| `ButtonLayoutConfig` | class | Button layout configuration |
| `ButtonStateConfig` | class | Button state configuration (includes `loadingColor`) |
| `ButtonIconConfig` | class | Button icon configuration |

### Inputs

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxTextFieldWidget` | widget | Standalone text input (no Form) |
| `NbxTextFormFieldWidget` | widget | Form-integrated text input |
| `NbxTextFieldWithStateWidget` | widget | Stateful text input wrapper |
| `NbxPhoneFieldWidget` | widget | Phone number input with country picker (includes `noCountryHelperText`) |
| `NbxCountryPickerInput` | widget | Country picker input |
| `NbxInputParameters` | @freezed class | Input configuration DTO |
| `NbxCountryPickerParameters` | @freezed class | Country picker configuration DTO |
| `NbxCountryPickerModalParameters` | class | Country picker modal configuration |
| `NbxInputType` | enum | Input type variants (text, email, password, phone, etc.) |
| `NbxInputDecorationStyle` | enum | Decoration style variants (outlined, filled, underline) |
| `NbxSuffixIconType` | enum | Suffix icon variants (none, cancel, eye) |
| `NbxInputState` | enum | Input visual state (neutral, success, error) |
| `NbxInputValidator` | class | Validation helper methods |

### Validation Rules

| Symbol | Type | Description |
|--------|------|-------------|
| `ValidationRule` | class | Single validation rule |
| `CustomValidationRules` | class | Custom validation rule builders |
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
| `AppBarConfig` | class | App bar configuration |
| `BodyConfig` | class | Body configuration (includes `extendBodyBehindAppBar`) |
| `SafeAreaConfig` | class | Safe area configuration |

### Shared Widgets

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxDividerWidget` | widget | Divider widget |
| `heightSpace4`, `heightSpace8`, etc. | constants | Spacing widgets |

### Shimmers

| Symbol | Type | Description |
|--------|------|-------------|
| `NbxShimmer` | widget | Shimmer loading effect |
| `NbxShimmerCircle` | widget | Circular shimmer placeholder |
| `NbxShimmerRectangle` | widget | Rectangular shimmer placeholder |

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
