import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/shimmers/constants/shimmer_constants.dart';
import 'package:nebux_design_system/src/components/shimmers/models/shimmer_skeleton_style.dart';
import 'package:nebux_design_system/src/components/shimmers/widgets/nbx_shimmer_animation.dart';
import 'package:nebux_design_system/src/components/shimmers/widgets/nbx_shimmer_container_list.dart';

/// A shimmer widget that displays two lists of skeleton containers.
///
/// This widget creates a layout with two separate lists of shimmer containers,
/// useful for complex loading states with multiple content sections.
class NbxShimmerTwiceContainerList extends StatelessWidget {
  /// Total height of the widget.
  final double heightFull;

  /// Axis direction for the main layout.
  final Axis axis;

  /// Style configuration for the first list of containers.
  final ShimmerSkeletonStyle skeletonListOneStyle;

  /// Number of containers in the first list.
  final int itemCountListOne;

  /// Whether the first list uses vertical layout.
  final bool isColumnListOne;

  /// Style configuration for the second list of containers.
  final ShimmerSkeletonStyle skeletonListTwoStyle;

  /// Number of containers in the second list.
  final int itemCountListTwo;

  /// Whether the second list uses vertical layout.
  final bool isColumnListTwo;

  /// Creates a new shimmer twice container list widget.
  ///
  /// @param heightFull: Total height of the widget [double].
  /// @param axis: Layout axis direction [Axis].
  /// @param skeletonListOneStyle: Style for first list containers [ShimmerSkeletonStyle].
  /// @param itemCountListOne: Number of containers in first list [int].
  /// @param isColumnListOne: Whether first list is vertical [bool].
  /// @param skeletonListTwoStyle: Style for second list containers [ShimmerSkeletonStyle].
  /// @param itemCountListTwo: Number of containers in second list [int].
  /// @param isColumnListTwo: Whether second list is vertical [bool].
  const NbxShimmerTwiceContainerList({
    super.key,
    required this.heightFull,
    required this.axis,
    required this.skeletonListOneStyle,
    required this.itemCountListOne,
    required this.isColumnListOne,
    required this.skeletonListTwoStyle,
    required this.itemCountListTwo,
    required this.isColumnListTwo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightFull,
      child: NbxShimmerAnimation(
        child: ListView(
          padding: ShimmerConstants.defaultHorizontalPadding,
          shrinkWrap: true,
          scrollDirection: axis,
          children: [
            Center(
              child: NbxShimmerContainerList(
                style: skeletonListOneStyle,
                isColumn: isColumnListOne,
                itemCount: itemCountListOne,
              ),
            ),
            const SizedBox(
              width: ShimmerConstants.defaultSpacing,
              height: ShimmerConstants.defaultSpacing,
            ),
            Center(
              child: NbxShimmerContainerList(
                style: skeletonListTwoStyle,
                itemCount: itemCountListTwo,
                isColumn: isColumnListTwo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
