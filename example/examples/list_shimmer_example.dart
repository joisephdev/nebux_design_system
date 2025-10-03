import 'package:flutter/material.dart';
import '../../lib/src/components/shimmers/nbx_shimmers.dart';

/// Example demonstrating list shimmer components.
///
/// This example shows how to create shimmer effects for lists,
/// both horizontal and vertical layouts.
class ListShimmerExample extends StatelessWidget {
  /// Creates a new list shimmer example.
  ///
  /// @returns: ListShimmerExample instance [ListShimmerExample].
  const ListShimmerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Shimmer Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Container List Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildExample(
              'Horizontal List',
              const NbxShimmerContainerList(
                style: ShimmerSkeletonStyle(
                  width: 120,
                  height: 80,
                  borderRadiusDouble: 12,
                ),
                itemCount: 5,
                isColumn: false,
              ),
            ),

            _buildExample(
              'Vertical List',
              const SizedBox(
                height: 200,
                child: NbxShimmerContainerList(
                  style: ShimmerSkeletonStyle(
                    width: double.infinity,
                    height: 40,
                    borderRadiusDouble: 8,
                  ),
                  itemCount: 4,
                  isColumn: true,
                ),
              ),
            ),

            _buildExample(
              'Mixed Layout (Two Lists)',
              const NbxShimmerTwiceContainerList(
                heightFull: 180,
                axis: Axis.vertical,
                skeletonListOneStyle: ShimmerSkeletonStyle(
                  width: double.infinity,
                  height: 35,
                  borderRadiusDouble: 6,
                ),
                itemCountListOne: 3,
                isColumnListOne: true,
                skeletonListTwoStyle: ShimmerSkeletonStyle(
                  width: 100,
                  height: 60,
                  borderRadiusDouble: 10,
                ),
                itemCountListTwo: 4,
                isColumnListTwo: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds an example section with title and widget.
  ///
  /// @param title: Title for the example [String].
  /// @param widget: Widget to display [Widget].
  /// @returns: Widget containing the example section [Widget].
  Widget _buildExample(String title, Widget widget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        widget,
        const SizedBox(height: 20),
      ],
    );
  }
}
