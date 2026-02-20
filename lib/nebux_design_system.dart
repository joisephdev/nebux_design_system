/// Nebux Design System for Flutter.
///
/// Provides theming, typography, spacing, and reusable UI components
/// for building consistent Flutter applications.
///
/// Core concepts:
/// - **Theme**: [NebuxTheme] registers as a [ThemeExtension] on MaterialApp.
/// - **Colors**: [NebuxColors] defines semantic color tokens (primary,
///   secondary, success, error, etc.) configurable via JSON.
/// - **Typography**: [NebuxTypography] provides role-based text styles
///   (heading, section, content, caption, label, actions).
/// - **Components**: Ready-to-use widgets such as [NbxButton],
///   [NbxTextFormFieldWidget], [NbxScaffold], [NbxNetworkImage], and
///   shimmer loading skeletons.
///
/// ```dart
/// import 'package:nebux_design_system/nebux_design_system.dart';
///
/// // Access theme via BuildContext extensions
/// final colors = context.nebuxColors;
/// final typography = context.nebuxTypography;
/// ```
library;

export 'src/components/export.dart';
export 'src/core/export.dart';
