# Contributing to Nebux Design System

## Versioning Policy

This package follows [Semantic Versioning](https://semver.org/) with the following conventions:

### Version Types

| Type | Format | When to Use |
|------|--------|-------------|
| **Patch** | `0.1.x` | Bug fixes, internal refactors, documentation updates |
| **Minor** | `0.x.0` | New features, new components, deprecations |
| **Major** | `x.0.0` | Breaking changes, symbol removals |

### Version Bump Rules

- **Patch**: No API changes, only fixes
- **Minor**: Additive changes only (new symbols, new parameters with defaults)
- **Major**: Removals, renamed symbols, changed signatures

## Deprecation Policy

All symbol removals **MUST** go through a deprecation runway:

1. **Mark as deprecated**: Add `@Deprecated('Use X instead')` annotation
2. **Wait**: Keep deprecated for at least **1 minor version**
3. **Document**: Update CHANGELOG with migration path
4. **Remove**: Delete in next major version

Example:

```dart
// Step 1: Deprecate in v0.2.0
@Deprecated('Use suffixIconType instead')
final bool? showEyeIcon;

// Step 2: Keep through v0.3.x

// Step 3: Remove in v1.0.0
```

**Retroactive deprecation is not possible.** If symbols were removed without a deprecation runway, document the migration path in CHANGELOG only.

## API Stability Tiers

| Tier | Description | Stability Guarantee |
|------|-------------|---------------------|
| `stable` | Production-ready, widely used | Breaking changes require major version |
| `experimental` | New features under evaluation | May change in minor versions |
| `internal` | Implementation details | No stability guarantee |

Symbols without explicit tier annotation are considered `stable`.

## Changelog Requirements

Every release must include a CHANGELOG entry with:

- Version number and date
- Category headers (BREAKING CHANGE, NEW FEATURE, FIX, etc.)
- Migration guide for breaking changes
- List of changed files/areas

## Development Workflow

```bash
# Install dependencies
flutter pub get

# Run static analysis (strict)
flutter analyze --fatal-infos

# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Generate code (after modifying @freezed or @JsonSerializable)
dart run build_runner build
```

## Code Style

- Follow `analysis_options.yaml` rules (strict mode)
- Use `prefer_const_constructors`, `prefer_final_locals`, `always_declare_return_types`
- Use single quotes for strings
- All public symbols must have documentation comments

## Pull Request Checklist

- [ ] `flutter analyze --fatal-infos` passes
- [ ] `flutter test` passes
- [ ] Coverage maintained or improved
- [ ] CHANGELOG updated (if applicable)
- [ ] Breaking changes documented with migration guide
