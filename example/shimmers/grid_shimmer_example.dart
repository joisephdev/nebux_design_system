import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/shimmers/nbx_shimmers.dart';

/// Example demonstrating grid shimmer components.
///
/// This example shows how to create shimmer effects for grid layouts
/// with icon placeholders and various configurations.
class GridShimmerExample extends StatelessWidget {
  /// Creates a new grid shimmer example.
  ///
  /// @returns: GridShimmerExample instance [GridShimmerExample].
  const GridShimmerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grid Shimmer Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Grid Layout Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildExample(
              'Small Grid (6 items)',
              const SizedBox(height: 200, child: NbxShimmerGrid(itemCount: 6)),
            ),

            _buildExample(
              'Medium Grid (9 items)',
              const SizedBox(height: 300, child: NbxShimmerGrid(itemCount: 9)),
            ),

            _buildExample(
              'Large Grid (12 items)',
              const SizedBox(height: 400, child: NbxShimmerGrid(itemCount: 12)),
            ),

            const SizedBox(height: 20),
            const Text(
              'Custom Grid Layouts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildExample(
              'Custom Grid with Different Item Count',
              const SizedBox(height: 250, child: NbxShimmerGrid(itemCount: 8)),
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
