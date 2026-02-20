# ADR-002: Config Class Policy

## Status

Accepted

## Context

The Nebux Design System uses config classes to group related parameters and improve API ergonomics. Two patterns have emerged:

1. **Freezed classes** — immutable, generated code, JSON serialization support, `copyWith()`, `lerp()` (e.g., theme types like `NebuxColors`, `NebuxTypography`)
2. **Plain classes** — simple `const` constructors, no code generation (e.g., `AppBarConfig`, `BodyConfig`)

The decision of which pattern to use has been inconsistent. `NbxInputParameters` uses Freezed, while `ButtonStyleConfig` uses plain classes. This ADR clarifies when to use each pattern.

## Decision

We adopt the following policy for config classes:

### Use `@freezed` When

1. **JSON serialization is required** — the class needs `fromJson`/`toJson` for persistence or API communication
2. **`lerp()` is required** — the class participates in theme interpolation (primarily theme types)
3. **Complex validation** — `@Assert` annotations provide cleaner validation than constructor assertions

### Use Plain `const` Class When

1. **Component configuration only** — the class groups parameters for a single widget
2. **No serialization needed** — the class is never serialized/deserialized
3. **Simple defaults** — default values can be expressed with constructor parameters

### Current Classification

| Class | Pattern | Justification |
|-------|---------|---------------|
| `NebuxColors` | Freezed | Theme type, needs `lerp()` and JSON |
| `NebuxTypography` | Freezed | Theme type, needs `lerp()` and JSON |
| `NbxInputParameters` | Freezed | Uses `@Assert` for validation, extensive `copyWith()` usage |
| `AppBarConfig` | Plain | Component config, no serialization |
| `BodyConfig` | Plain | Component config, no serialization |
| `SafeAreaConfig` | Plain | Component config, no serialization |
| `ButtonStyleConfig` | Plain | Component config, no serialization |
| `ButtonLayoutConfig` | Plain | Component config, no serialization |
| `ButtonStateConfig` | Plain | Component config, no serialization |
| `ButtonIconConfig` | Plain | Component config, no serialization |
| `NbxImageCacheConfig` | Plain | Component config, no serialization |
| `NbxImageAnimationConfig` | Plain | Component config, no serialization |
| `NbxImageProgressConfig` | Plain | Component config, no serialization |
| `NbxImageStyleConfig` | Plain | Component config, no serialization |

### Template for Plain Config Class

```dart
class ExampleConfig {
  final String? field1;
  final int field2;

  const ExampleConfig({
    this.field1,
    this.field2 = defaultValue,
  });
}
```

## Consequences

### Positive

- Clear guidance for new config classes
- Reduced code generation overhead for simple configs
- Freezed reserved for types that benefit from it most
- Consistent API patterns for consumers

### Negative

- `NbxInputParameters` remains Freezed (but this is justified by its validation needs)
- Two patterns exist in the codebase (but now with clear rules)

### Neutral

- Future config classes require upfront decision
- Theme types should always use Freezed for `lerp()` support

## References

- Sprint 3: `TextValidationRules` export issue (would not have needed Freezed)
- Sprint 5: `NbxImageCacheConfig` et al. — plain classes per this policy
