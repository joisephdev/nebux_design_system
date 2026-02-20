# Migration Guide

This guide covers all breaking changes across nebux_design_system versions. For the full changelog, see [CHANGELOG.md](../CHANGELOG.md).

---

## v0.3.1 to v1.0.0

### Typography height and letterSpacing

All `NebuxTypography` TextStyles now include `height` and `letterSpacing` values. If you were manually adding these in a `withOverrides()` call, the defaults may now stack or conflict.

| Role | height | letterSpacing |
|------|--------|---------------|
| heading | 1.2 | -0.5 |
| section | 1.25 | -0.25 |
| content | 1.4 | 0.0 |
| paragraph | 1.5 | 0.15 |
| caption | 1.3 | 0.1 |
| label | 1.3 | 0.1 |
| primaryAction | 1.2 | 0.5 |
| secondaryAction | 1.2 | 0.5 |
| formInput | 1.4 | 0.15 |
| placeholder | 1.4 | 0.15 |

**Action needed**: If you used `withOverrides()` to set custom height/letterSpacing, verify your overrides still produce the desired result. The new defaults follow Material Design 3 type scale recommendations.

### `fromThemeData()` mapping corrected

`NebuxTypography.fromThemeData()` now maps typography roles to different Material TextTheme slots:

| Role | Old mapping (v0.3.1) | New mapping (v1.0.0) |
|------|---------------------|---------------------|
| heading | `labelLarge` | `headlineMedium` |
| section | `labelMedium` | `titleLarge` |
| label | `labelSmall` | `labelLarge` |
| secondaryAction | `labelMedium` | `labelLarge` |

**Action needed**: If you relied on `fromThemeData()` to convert a Material `ThemeData` into `NebuxTypography`, the resulting font sizes and weights will change to match the correct semantic mapping. Verify your UI after upgrading.

---

## v0.2.x to v0.3.0

### Translation loading is now async

`CountryLocalizations.load()` now calls `TranslationLoader.instance.load()` internally, loading translations from JSON assets instead of compiled Dart maps. However, the public API is unchanged -- no code changes are needed if you use the standard `LocalizationsDelegate` pattern.

```dart
// Before (v0.2.x) and After (v0.3.0) -- identical usage
MaterialApp(
  localizationsDelegates: [
    CountryLocalizations.delegate,
    // ...other delegates
  ],
)
```

### CountryProvider removed

`CountryProvider` has been removed. Use `CountryDecoder` instead, which was already available in v0.2.x.

```dart
// Before (v0.2.x)
final countries = CountryProvider.getCountriesByCodes(['US', 'MX']);
final country = CountryProvider.findByPhoneCode('1');

// After (v0.3.0)
// Use CountryDecoder for country lookups.
// CountryProvider was a duplicate of CountryDecoder and has been removed.
```

### Dead code removed

The following were removed because they had zero imports in the codebase. No consumer action is needed unless you were importing internal files directly (not through the public barrel export):

- `countries.dart` (7,575 LOC)
- `AlphaScroller` widget (258 LOC)
- 33 Dart translation files (~8,248 LOC) -- replaced by 33 JSON assets

---

## v0.1.x to v0.2.0

### 1. `NbxInputParameters` no longer accepts `BuildContext`

The `context` parameter has been removed from `NbxInputParameters`. Context is now passed internally by the widget.

```dart
// Before (v0.1.x)
NbxTextFieldWidget(
  NbxInputParameters(
    context: context,  // remove this
    isRequired: false,
    inputType: NbxInputType.text,
    labelText: 'Search',
  ),
)

// After (v0.2.0)
NbxTextFieldWidget(
  NbxInputParameters(
    isRequired: false,
    inputType: NbxInputType.text,
    labelText: 'Search',
  ),
)
```

### 2. `NbxNetworkImage` constructor restructured

The widget now uses config classes instead of individual parameters.

```dart
// Before (v0.1.x)
NbxNetworkImage(
  imageUrl: 'https://example.com/image.png',
  memCacheWidth: 100,
  memCacheHeight: 100,
  fadeInDuration: Duration(milliseconds: 500),
  borderRadius: BorderRadius.circular(8),
)

// After (v0.2.0)
NbxNetworkImage(
  imageUrl: 'https://example.com/image.png',
  cacheConfig: NbxImageCacheConfig(
    memCacheWidth: 100,
    memCacheHeight: 100,
  ),
  animationConfig: NbxImageAnimationConfig(
    fadeInDuration: Duration(milliseconds: 500),
  ),
  styleConfig: NbxImageStyleConfig(
    borderRadius: BorderRadius.circular(8),
  ),
)
```

### 3. `NbxNetworkImage.cacheManager` type changed

`cacheManager` moved from `dynamic` to `BaseCacheManager?` inside `NbxImageCacheConfig`. If you were passing a `CacheManager` instance, wrap it in the config class:

```dart
// Before (v0.1.x)
NbxNetworkImage(
  imageUrl: url,
  cacheManager: myCustomCacheManager,
)

// After (v0.2.0)
NbxNetworkImage(
  imageUrl: url,
  cacheConfig: NbxImageCacheConfig(
    cacheManager: myCustomCacheManager,
  ),
)
```

### 4. Validation architecture consolidated (v0.2.0-dev.1)

`singleLineFormatter` now only applies when `maxLines == 1` (or null). If you relied on it for multi-line inputs, remove it and handle formatting separately.

---

## v0.1.17 to v0.1.18

### Validation API refactored

The `customValidator` parameter was replaced by `validator` + `onValidationResult` for a clean separation of concerns.

| Old API (v0.1.17) | New API (v0.1.18) | Notes |
|---|---|---|
| `customValidator: (value) => ...` | `validator: (value) => ...` | Returns error string or null |
| `showEyeIcon: true` | `suffixIconType: NbxSuffixIconType.eye` | For password fields |
| `showCancelIcon: true` | `suffixIconType: NbxSuffixIconType.cancel` | Clear button |
| `showSuffixIcon: true` | `suffixIconType: NbxSuffixIconType.eye` or `.cancel` | Choose specific type |
| `forceShowSuffixIcon: true` | N/A | Suffix icon now always visible when type is set |

```dart
// Before (v0.1.17)
NbxTextFieldWidget(
  parameters: NbxInputParameters(
    customValidator: (value) => value?.isEmpty == true ? 'Required' : null,
    showEyeIcon: true,
  ),
);

// After (v0.1.18)
NbxTextFieldWidget(
  parameters: NbxInputParameters(
    validator: (value) => value?.isEmpty == true ? 'Required' : null,
    onValidationResult: (error) {
      // React to validation results (null means valid)
    },
    suffixIconType: NbxSuffixIconType.eye,
  ),
);
```

---

## v0.0.11 to v0.0.12

### `NbxButton` configuration-based architecture

`NbxButton` was refactored to use config classes. The legacy constructor was preserved as `NbxButton.legacy()` for backward compatibility but was later removed in v0.1.9.

```dart
// Before (v0.0.11)
NbxButton(
  text: 'Submit',
  variant: NbxButtonVariant.filled,
  isLoading: true,
  leadingIcon: Icons.send,
)

// After (v0.0.12+)
NbxButton(
  text: 'Submit',
  styleConfig: ButtonStyleConfig(variant: NbxButtonVariant.filled),
  stateConfig: ButtonStateConfig(isLoading: true),
  iconConfig: ButtonIconConfig(leadingIcon: Icons.send),
)
```

---

## v0.0.7 to v0.0.8

### Button variant names changed

`NbxButtonVariant.primary` was renamed to `NbxButtonVariant.filled` and `NbxButtonVariant.secondary` to `NbxButtonVariant.text`.

```dart
// Before
NbxButton(variant: NbxButtonVariant.primary)
NbxButton(variant: NbxButtonVariant.secondary)

// After
NbxButton(styleConfig: ButtonStyleConfig(variant: NbxButtonVariant.filled))
NbxButton(styleConfig: ButtonStyleConfig(variant: NbxButtonVariant.text))
```

---

## v0.0.4 to v0.0.5

### `font_awesome_flutter` dependency removed

All FontAwesome icon references were replaced with standard Material icons. If you were passing FontAwesome icons to `NbxAppBar` or `NbxSocialLoginButton`, switch to Material `Icons.*` or provide your own icon widget.

```dart
// Before
NbxAppBar(leadingIcon: FontAwesomeIcons.arrowLeft)

// After
NbxAppBar(leadingIcon: Icons.arrow_back)
```

---

## Deprecation Roadmap

The following deprecations are planned for post-v1.0.0 releases. Consumers should start using the replacement APIs now for new code.

### Country picker styling parameters

The individual styling parameters on `countrySelector()` and `showCountryListView()` will be deprecated in favor of dedicated config classes:

| Deprecated parameter | Replacement config class |
|---|---|
| `appBarBackgroundColour` | `CountryPickerAppBarConfig.backgroundColor` |
| `appBarFontSize` | `CountryPickerAppBarConfig.fontSize` |
| `appBarFontStyle` | `CountryPickerAppBarConfig.fontStyle` |
| `appBarTextColor` | `CountryPickerAppBarConfig.textColor` |
| `searchBarTextColor` | `CountryPickerSearchConfig.textColor` |
| `searchBarBackgroundColor` | `CountryPickerSearchConfig.backgroundColor` |
| `searchBarOutlineColor` | `CountryPickerSearchConfig.outlineColor` |
| `searchBarHintText` | `CountryPickerSearchConfig.hintText` |
| `flagSize` | `CountryPickerStyleConfig.flagSize` |
| `countryFontStyle` | `CountryPickerStyleConfig.countryFontStyle` |
| `countryTitleSize` | `CountryPickerStyleConfig.countryTitleSize` |

**Timeline:**
- **Now**: Config classes are available and recommended for new code
- **Post-v1.0.0**: `@Deprecated` annotations will be added to individual parameters
- **v2.0.0 (earliest)**: Deprecated parameters will be removed

**Recommended usage today:**

```dart
// Instead of individual parameters:
countrySelector(
  context: context,
  appBarBackgroundColour: Colors.blue,
  searchBarHintText: 'Find your country',
  flagSize: 32,
);

// Use config classes:
countrySelector(
  context: context,
  appBarConfig: CountryPickerAppBarConfig(
    backgroundColor: Colors.blue,
  ),
  searchConfig: CountryPickerSearchConfig(
    hintText: 'Find your country',
  ),
  styleConfig: CountryPickerStyleConfig(
    flagSize: 32,
  ),
);
```
