# ADR-003: Vendored Country Picker

## Status

Accepted

## Context

The Nebux Design System requires a country picker component for phone number inputs and country selection across consumer apps. The original `country_picker_pro` pub.dev package lacked the customization needed for Nebux applications — specifically around search behavior, app bar configuration, styling, and translation support.

Early attempts to work around these limitations through wrapper widgets proved brittle. The team forked the package and vendored it as `country_picker_pro2/` inside the design system to gain full control. This directory currently contains ~8,400 lines across ~15 files (post-Sprint 7 optimization, down from ~24,700 lines and 44+ files — a 65.8% LOC reduction).

The vendored code is excluded from `analysis_options.yaml` because it originated as third-party code with different lint conventions. A post-v1.0.0 deep refactoring is planned, with 85+ improvement findings already identified.

## Decision

We vendor the country picker as `country_picker_pro2/` inside the design system rather than:

1. **Using the original `country_picker_pro` package as-is** — insufficient customization surface for Nebux needs (search, app bar, styling, translations).
2. **Publishing a separate `nebux_country_picker` package** — premature while the component is still undergoing heavy optimization and the API is not yet stable.
3. **Contributing upstream** — the customization needs are specific to the Nebux design system and unlikely to be accepted upstream.

### Rationale

- **Full customization control**: vendoring allows deep modification of search, app bar, styling, and translation without waiting on upstream maintainers.
- **Nebux theme integration (planned)**: the vendored code can be incrementally refactored to use `NebuxColors` and `NebuxTypography` via `BuildContext` extensions, which would not be possible with an external dependency.
- **No external dependency risk**: the component is insulated from upstream breaking changes, abandonment, or license changes.
- **Aggressive optimization is possible**: Sprint 7 demonstrated this — the team achieved a 65.8% LOC reduction (24,745 to 8,453 lines) without affecting functionality, something that would be impossible with an external dependency.

## Consequences

### Positive

- The team has full control over the component's behavior, performance, and API
- No risk of upstream breaking changes or package abandonment
- Enables incremental migration toward Nebux theme system integration
- Sprint 7 proved the value of vendoring — deep optimization would not have been feasible otherwise

### Negative

- Maintenance burden falls entirely on the team (no upstream bug fixes or security patches)
- The component is excluded from static analysis, reducing code quality guarantees
- Consumers who don't need country/phone inputs still compile the vendored code
- 85+ improvement findings remain to be addressed post-v1.0.0

### Neutral

- Post-v1.0.0, the component may be extracted to a standalone `nebux_country_picker` package once the API stabilizes
- The vendored code serves as the foundation for `NbxCountryPickerInput` and `NbxPhoneFieldWidget`, which are part of the public API

## References

- Finding 05: Vendored Country Picker — identified size impact and maintenance concerns
- Sprint 7: Country Picker Optimization — 65.8% LOC reduction (24,745 to 8,453 lines)
- `analysis_options.yaml`: `country_picker_pro2/` excluded from analysis
