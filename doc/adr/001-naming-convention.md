# ADR-001: Naming Convention

## Status

Accepted

## Context

The Nebux Design System has evolved organically, resulting in inconsistent naming conventions across the codebase. Currently:

- Core/theme layer uses `Nebux` prefix (e.g., `NebuxTheme`, `NebuxColors`, `NebuxTypography`) — 8 classes
- UI components use `Nbx` prefix (e.g., `NbxButton`, `NbxTextField`, `NbxNetworkImage`) — 20+ classes
- Config classes have no prefix (e.g., `AppBarConfig`, `BodyConfig`, `ButtonStyleConfig`)
- Enums, DTOs, and validators follow no consistent pattern

Sprint 2 deleted `NebuxAppBar`, which was a violator of the emerging pattern. This ADR formalizes the convention to prevent future confusion.

## Decision

We adopt the following naming convention:

### Prefix Rules

| Layer | Prefix | Examples |
|-------|--------|----------|
| Core/Theme | `Nebux` | `NebuxTheme`, `NebuxColors`, `NebuxTypography`, `NebuxFontSize` |
| UI Components | `Nbx` | `NbxButton`, `NbxTextField`, `NbxNetworkImage`, `NbxScaffold` |
| Component-specific types | `Nbx` | `NbxInputType`, `NbxInputParameters`, `NbxValidationRule` |
| Config classes | None | `AppBarConfig`, `ButtonStyleConfig`, `NbxImageCacheConfig` |

### Rationale

- **`Nebux` for core/theme**: These are the foundational types that define the design system's identity. The longer prefix signals stability and importance.
- **`Nbx` for components**: Shorter prefix for frequently-typed component names improves DX. Components are the most commonly used part of the API.
- **No prefix for configs**: Config classes are always imported with context (e.g., `ButtonStyleConfig` is clearly a button-related config). They're also often passed as parameters, where brevity matters.

### Type-Specific Rules

- **Enums**: Follow the layer they belong to (`NbxInputType` for component layer, `NebuxColorTheme` for core layer)
- **DTOs**: Follow the component they serve (`NbxInputParameters` for input components)
- **Validators**: Follow the component they serve (`NbxInputValidator`, `TextValidationRules`)
- **Extensions**: No prefix needed for extension names, but the type being extended should follow its layer's convention

## Consequences

### Positive

- Clear visual distinction between core types and components
- Shorter names for frequently-used components (`Nbx` vs `Nebux`)
- Config classes remain concise when passed as parameters
- Future contributors have explicit guidance

### Negative

- Existing code doesn't need migration (both prefixes already exist)
- Config classes may need context from import to understand purpose

### Neutral

- New types must consciously choose the correct prefix
- Code reviewers should verify naming follows this ADR

## References

- Sprint 2 retro: deleted `NebuxAppBar` as a violator
- Finding 07: API DX Issues — identified naming inconsistency as a concern
