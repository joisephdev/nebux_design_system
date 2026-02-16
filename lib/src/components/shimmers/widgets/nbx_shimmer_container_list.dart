import 'package:flutter/material.dart';
import '../constants/shimmer_constants.dart';
import '../models/shimmer_skeleton_style.dart';
import '../widgets/nbx_shimmer_animation.dart';
import '../widgets/shimmer_container_builder.dart';

/// A shimmer widget that displays a list of skeleton containers.
///
/// This widget creates a horizontal or vertical list of shimmer containers
/// with customizable spacing and styling.
class NbxShimmerContainerList extends StatelessWidget {
  /// Style configuration for the shimmer containers.
  final ShimmerSkeletonStyle style;

  /// Number of containers to display in the list.
  final int itemCount;

  /// Whether to display containers in a column (vertical) layout.
  final bool isColumn;

  /// Creates a new shimmer container list widget.
  ///
  /// @param style: Configuration for container appearance [ShimmerSkeletonStyle].
  /// @param itemCount: Number of containers to display [int].
  /// @param isColumn: Whether to use vertical layout [bool].
  const NbxShimmerContainerList({
    super.key,
    required this.style,
    required this.itemCount,
    required this.isColumn,
  });

  @override
  Widget build(BuildContext context) {
    return NbxShimmerAnimation(
      child: isColumn ? _buildVerticalList() : _buildHorizontalList(),
    );
  }

  /// Builds a vertical list of shimmer containers.
  ///
  /// @returns: Widget containing vertical list of containers [Widget].
  Widget _buildVerticalList() {
    return SizedBox(
      width: style.width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerContainerBuilder(style: style),
              const SizedBox(height: ShimmerConstants.defaultSpacing),
            ],
          );
        },
      ),
    );
  }

  /// Builds a horizontal list of shimmer containers.
  ///
  /// @returns: Widget containing horizontal list of containers [Widget].
  Widget _buildHorizontalList() {
    return SizedBox(
      height: (style.height ?? 0) + 20,
      width:
          style.width * itemCount + itemCount * ShimmerConstants.defaultSpacing,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ShimmerConstants.defaultSpacing,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShimmerContainerBuilder(style: style),
                const SizedBox(width: ShimmerConstants.defaultSpacing),
              ],
            );
          },
        ),
      ),
    );
  }
}
