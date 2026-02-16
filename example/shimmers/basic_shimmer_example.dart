import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/shimmers/nbx_shimmers.dart';

/// Example demonstrating basic shimmer container usage.
///
/// This example shows how to create simple shimmer containers
/// with different sizes and shapes.
class BasicShimmerExample extends StatelessWidget {
  /// Creates a new basic shimmer example.
  ///
  /// @returns: BasicShimmerExample instance [BasicShimmerExample].
  const BasicShimmerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Shimmer Examples')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Container Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildExample(
              'Small Rectangle',
              const NbxShimmerContainer(
                style: ShimmerSkeletonStyle(
                  width: 100,
                  height: 50,
                  borderRadiusDouble: 8,
                ),
              ),
            ),

            _buildExample(
              'Large Rectangle',
              const NbxShimmerContainer(
                style: ShimmerSkeletonStyle(
                  width: 200,
                  height: 100,
                  borderRadiusDouble: 12,
                ),
              ),
            ),

            _buildExample(
              'Circle Shape',
              const NbxShimmerContainer(
                style: ShimmerSkeletonStyle(
                  width: 80,
                  height: 80,
                  boxShape: BoxShape.circle,
                ),
              ),
            ),

            _buildExample(
              'Custom Color',
              const NbxShimmerContainer(
                style: ShimmerSkeletonStyle(
                  width: 150,
                  height: 60,
                  borderRadiusDouble: 16,
                  customColor: Colors.blue,
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
        const SizedBox(height: 16),
      ],
    );
  }
}
