// ignore_for_file: deprecated_member_use, directives_ordering

/// Nebux Design System Shimmer Components
///
/// This library provides a comprehensive set of shimmer/skeleton loading components
/// for creating professional loading states in Flutter applications.
///
/// ## Features
/// - Customizable shimmer animations with gradient effects
/// - Various container types (basic, expanded, lists, grids)
/// - List tile shimmer components with flexible layouts
/// - Consistent styling and theming support
/// - Professional documentation following Dart standards
///
/// ## Usage
/// ```dart
/// import 'package:nebux_design_system/nebux_design_system.dart';
///
/// // Basic shimmer container
/// NbxShimmerContainer(
///   style: ShimmerSkeletonStyle(
///     width: 200,
///     height: 100,
///   ),
/// )
///
/// // Shimmer list tile
/// NbxShimmerListTile(
///   titleStyle: ShimmerSkeletonStyle(width: 150, height: 20),
///   subtitleStyle: ShimmerSkeletonStyle(width: 100, height: 16),
/// )
/// ```
library;

// Core components
export 'widgets/nbx_shimmer_animation.dart';
export 'widgets/nbx_shimmer_container.dart';
export 'widgets/nbx_shimmer_container_expanded.dart';
export 'widgets/nbx_shimmer_container_list.dart';
export 'widgets/nbx_shimmer_twice_container_list.dart';
export 'widgets/nbx_shimmer_list_tile.dart';
export 'widgets/nbx_shimmer_list_tile_list_view.dart';
export 'widgets/nbx_shimmer_grid.dart';

// Models and constants
export 'models/shimmer_skeleton_style.dart';
export 'constants/shimmer_constants.dart';
