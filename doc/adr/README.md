# Architecture Decision Records

This directory contains Architecture Decision Records (ADRs) for the Nebux Design System.

## What is an ADR?

An ADR is a document that captures an important architectural decision made along with its context and consequences. ADRs help us:

- Document the "why" behind architectural choices
- Provide context for future contributors
- Avoid repeating past mistakes
- Maintain consistency across the codebase

## ADR Index

| Number | Title | Status | Date |
|--------|-------|--------|------|
| 001 | [Naming Convention](./001-naming-convention.md) | Accepted | 2026-02-19 |
| 002 | [Config Class Policy](./002-config-class-policy.md) | Accepted | 2026-02-19 |

## PR Review — Naming Convention Check

When reviewing PRs, verify:
- [ ] New public types follow ADR-001 (`Nebux` for core/theme, `Nbx` for components)
- [ ] New config classes follow ADR-002 (plain immutable classes unless JSON/lerp needed)

## Creating a New ADR

1. Copy `template.md` to `NNN-short-title.md` (e.g., `003-state-management.md`)
2. Fill in the sections following the template
3. Update this README's index table
4. Commit the ADR with your changes

## ADR Template

See [template.md](./template.md) for the standard format.
