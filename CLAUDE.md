# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Nebux Design System is a Flutter package (pub.dev) providing theming, typography, spacing, and reusable UI components for Flutter applications.

## Common Commands

```bash
# Install dependencies
flutter pub get

# Static analysis (strict — --fatal-infos means any info-level issue fails)
flutter analyze --fatal-infos

# Run tests
flutter test

# Run a single test file
flutter test test/country_picker_pro_test.dart

# Regenerate code after modifying @freezed or @JsonSerializable models
dart run build_runner build

# Publish to pub.dev (manual)
flutter pub publish --force
```

## Architecture

### Entry Point & Exports

`lib/nebux_design_system.dart` is the single public API entry point. Each subdirectory has its own `export.dart` that re-exports all public symbols. When adding new components or core types, wire them up through the nearest `export.dart` and verify the top-level barrel still includes it.

### Directory Layout

```
lib/src/
├── core/
│   ├── theme/       # NebuxTheme (ThemeExtension), NebuxColors (@freezed), NebuxTypography (@freezed), NebuxFontSize
│   ├── extensions/  # BuildContext helpers (context.nebuxColors, context.nebuxTypography) and Widget padding/margin helpers
│   └── utils/       # Spacing constants, NebuxUtils, NebuxDebouncer, NebuxBottomSheet, NebuxColorConverter
└── components/
    ├── buttons/          # NbxButton with variant configs
    ├── inputs/           # NbxTextFieldWidget, NbxPhoneFieldWidget, NbxCountryPickerInput
    ├── scaffold/         # NbxScaffold
    ├── app_bars/
    ├── images/           # NbxNetworkImage (cached)
    ├── shimmers/         # NbxShimmer* loading skeletons
    ├── country_picker_pro2/  # Vendored; excluded from analysis
    └── shared/
```

### Key Patterns

**Configuration via @freezed classes, not builders.** Component parameters are grouped into immutable config classes (e.g., `NbxInputParameters`, `ButtonStyleConfig`, `AppBarConfig`). When adding new component options, extend the relevant config class rather than adding raw positional parameters.

**Theme access via BuildContext extensions.** Consumers use `context.nebuxColors` and `context.nebuxTypography` — no Provider or state management required. Theme is registered as a `ThemeExtension` on MaterialApp.

**Code generation.** Any file annotated with `@freezed` or `@JsonSerializable` requires running `dart run build_runner build` to update the corresponding `.freezed.dart` / `.g.dart` files. Commit generated files alongside source changes.

**Semantic color/typography naming.** Colors are semantic (primary, secondary, success, error, warning, info, surface, text variants). Typography roles are heading, section, content, paragraph, caption, label, actions. Follow existing naming when extending the system.

### Analysis Rules

`analysis_options.yaml` enforces strict rules including `prefer_const_constructors`, `prefer_final_locals`, `always_declare_return_types`, and `prefer_single_quotes`. The `country_picker_pro2/` and `example/` directories are excluded from analysis. All lints that `flutter analyze --fatal-infos` would surface must be resolved before merging.

## CI

- **ci.yml** — Runs `flutter analyze --fatal-infos` and `flutter test` on every PR to `main`.
- **publish.yml** — Manual dispatch to publish to pub.dev.
- **release.yml** — Creates a GitHub release when a PR merges to `main`.
