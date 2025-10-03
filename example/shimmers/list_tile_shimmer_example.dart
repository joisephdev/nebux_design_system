import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/shimmers/nbx_shimmers.dart';

/// Example demonstrating list tile shimmer components.
///
/// This example shows how to create shimmer effects for list tiles
/// with various configurations and layouts.
class ListTileShimmerExample extends StatelessWidget {
  /// Creates a new list tile shimmer example.
  ///
  /// @returns: ListTileShimmerExample instance [ListTileShimmerExample].
  const ListTileShimmerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Tile Shimmer Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'List Tile Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildExample(
              'Simple List Tile',
              const NbxShimmerListTile(
                titleStyle: ShimmerSkeletonStyle(width: 200, height: 20),
                subtitleStyle: ShimmerSkeletonStyle(width: 150, height: 16),
              ),
            ),

            _buildExample(
              'List Tile with Leading',
              const NbxShimmerListTile(
                leadingStyle: ShimmerSkeletonStyle(
                  width: 50,
                  height: 50,
                  boxShape: BoxShape.circle,
                ),
                titleStyle: ShimmerSkeletonStyle(width: 180, height: 18),
                subtitleStyle: ShimmerSkeletonStyle(width: 120, height: 14),
                trailingStyle: ShimmerSkeletonStyle(width: 30, height: 30),
                contentSpacing: 12,
                verticalSpacing: 8,
              ),
            ),

            _buildExample(
              'List Tile with Container',
              const NbxShimmerListTile(
                leadingStyle: ShimmerSkeletonStyle(
                  width: 40,
                  height: 40,
                  boxShape: BoxShape.circle,
                ),
                titleStyle: ShimmerSkeletonStyle(width: 160, height: 18),
                subtitleStyle: ShimmerSkeletonStyle(width: 100, height: 14),
                paragraphStyle: ShimmerSkeletonStyle(width: 200, height: 12),
                trailingStyle: ShimmerSkeletonStyle(width: 25, height: 25),
                hasContainer: true,
                contentSpacing: 10,
                verticalSpacing: 6,
              ),
            ),

            _buildExample(
              'List of Tiles',
              const SizedBox(
                height: 300,
                child: NbxShimmerListTileListView(
                  itemCount: 5,
                  titleStyle: ShimmerSkeletonStyle(width: 180, height: 18),
                  subtitleStyle: ShimmerSkeletonStyle(width: 120, height: 14),
                  leadingStyle: ShimmerSkeletonStyle(
                    width: 40,
                    height: 40,
                    boxShape: BoxShape.circle,
                  ),
                  trailingStyle: ShimmerSkeletonStyle(width: 30, height: 30),
                  hasContainer: false,
                  contentSpacing: 12,
                  verticalSpacing: 8,
                ),
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
