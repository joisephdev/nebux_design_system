import 'package:flutter/material.dart';
import '../../lib/src/components/shimmers/nbx_shimmers.dart';

/// Example demonstrating advanced shimmer configurations.
///
/// This example shows how to create complex shimmer layouts
/// combining multiple shimmer components for realistic loading states.
class AdvancedShimmerExample extends StatelessWidget {
  /// Creates a new advanced shimmer example.
  ///
  /// @returns: AdvancedShimmerExample instance [AdvancedShimmerExample].
  const AdvancedShimmerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Shimmer Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Complex Layout Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildExample('Profile Card Layout', _buildProfileCardShimmer()),

            _buildExample('Dashboard Layout', _buildDashboardShimmer()),

            _buildExample('Article List Layout', _buildArticleListShimmer()),

            _buildExample('Settings Page Layout', _buildSettingsPageShimmer()),
          ],
        ),
      ),
    );
  }

  /// Builds a profile card shimmer layout.
  ///
  /// @returns: Widget containing profile card shimmer [Widget].
  Widget _buildProfileCardShimmer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Profile header
          const Row(
            children: [
              NbxShimmerContainer(
                style: ShimmerSkeletonStyle(
                  width: 60,
                  height: 60,
                  boxShape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NbxShimmerContainer(
                      style: ShimmerSkeletonStyle(width: 150, height: 20),
                    ),
                    SizedBox(height: 8),
                    NbxShimmerContainer(
                      style: ShimmerSkeletonStyle(width: 100, height: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Profile stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_buildStatItem(), _buildStatItem(), _buildStatItem()],
          ),
        ],
      ),
    );
  }

  /// Builds a dashboard shimmer layout.
  ///
  /// @returns: Widget containing dashboard shimmer [Widget].
  Widget _buildDashboardShimmer() {
    return const Column(
      children: [
        // Header
        NbxShimmerContainer(
          style: ShimmerSkeletonStyle(
            width: double.infinity,
            height: 40,
            borderRadiusDouble: 8,
          ),
        ),
        SizedBox(height: 16),
        // Stats row
        Row(
          children: [
            Expanded(
              child: NbxShimmerContainer(
                style: ShimmerSkeletonStyle(
                  width: double.infinity,
                  height: 80,
                  borderRadiusDouble: 8,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: NbxShimmerContainer(
                style: ShimmerSkeletonStyle(
                  width: double.infinity,
                  height: 80,
                  borderRadiusDouble: 8,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        // Chart area
        NbxShimmerContainer(
          style: ShimmerSkeletonStyle(
            width: double.infinity,
            height: 200,
            borderRadiusDouble: 12,
          ),
        ),
      ],
    );
  }

  /// Builds an article list shimmer layout.
  ///
  /// @returns: Widget containing article list shimmer [Widget].
  Widget _buildArticleListShimmer() {
    return Column(
      children: List.generate(3, (index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: NbxShimmerListTile(
            leadingStyle: ShimmerSkeletonStyle(
              width: 80,
              height: 60,
              borderRadiusDouble: 8,
            ),
            titleStyle: ShimmerSkeletonStyle(width: 200, height: 18),
            subtitleStyle: ShimmerSkeletonStyle(width: 150, height: 14),
            paragraphStyle: ShimmerSkeletonStyle(
              width: double.infinity,
              height: 12,
            ),
            contentSpacing: 12,
            verticalSpacing: 6,
          ),
        );
      }),
    );
  }

  /// Builds a settings page shimmer layout.
  ///
  /// @returns: Widget containing settings page shimmer [Widget].
  Widget _buildSettingsPageShimmer() {
    return Column(
      children: [
        // Profile section
        const NbxShimmerListTile(
          leadingStyle: ShimmerSkeletonStyle(
            width: 50,
            height: 50,
            boxShape: BoxShape.circle,
          ),
          titleStyle: ShimmerSkeletonStyle(width: 120, height: 18),
          subtitleStyle: ShimmerSkeletonStyle(width: 80, height: 14),
          trailingStyle: ShimmerSkeletonStyle(width: 20, height: 20),
          contentSpacing: 12,
        ),
        const SizedBox(height: 8),
        // Settings items
        ...List.generate(5, (index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: NbxShimmerListTile(
              titleStyle: ShimmerSkeletonStyle(width: 100, height: 16),
              trailingStyle: ShimmerSkeletonStyle(width: 30, height: 30),
              contentSpacing: 16,
            ),
          );
        }),
      ],
    );
  }

  /// Builds a stat item shimmer.
  ///
  /// @returns: Widget containing stat item shimmer [Widget].
  Widget _buildStatItem() {
    return const Column(
      children: [
        NbxShimmerContainer(style: ShimmerSkeletonStyle(width: 30, height: 20)),
        SizedBox(height: 4),
        NbxShimmerContainer(style: ShimmerSkeletonStyle(width: 40, height: 14)),
      ],
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
