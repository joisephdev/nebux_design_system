import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/shimmers/nbx_shimmers.dart';

/// Example page showcasing all available shimmer components.
///
/// This page demonstrates the different types of shimmer effects
/// available in the BB Center App Design System.
class ShimmerExamplesPage extends StatefulWidget {
  /// Creates a new shimmer examples page.
  ///
  /// @returns: ShimmerExamplesPage instance [ShimmerExamplesPage].
  const ShimmerExamplesPage({super.key});

  @override
  State<ShimmerExamplesPage> createState() => _ShimmerExamplesPageState();
}

class _ShimmerExamplesPageState extends State<ShimmerExamplesPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading for demonstration
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Examples'),
        actions: [
          IconButton(
            icon: Icon(_isLoading ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              setState(() {
                _isLoading = !_isLoading;
              });
            },
          ),
        ],
      ),
      body: _isLoading ? _buildShimmerContent() : _buildRealContent(),
    );
  }

  /// Builds the shimmer loading content.
  ///
  /// @returns: Widget containing all shimmer examples [Widget].
  Widget _buildShimmerContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Basic Container'),
          _buildBasicContainerExample(),
          const SizedBox(height: 24),

          _buildSectionTitle('Expanded Container'),
          _buildExpandedContainerExample(),
          const SizedBox(height: 24),

          _buildSectionTitle('Container Lists'),
          _buildContainerListExamples(),
          const SizedBox(height: 24),

          _buildSectionTitle('List Tiles'),
          _buildListTileExamples(),
          const SizedBox(height: 24),

          _buildSectionTitle('Grid Layout'),
          _buildGridExample(),
          const SizedBox(height: 24),

          _buildSectionTitle('Complex Layout'),
          _buildComplexLayoutExample(),
        ],
      ),
    );
  }

  /// Builds the real content after loading.
  ///
  /// @returns: Widget containing real content [Widget].
  Widget _buildRealContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Content Loaded!'),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'This is the real content that replaces the shimmer loading state.',
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a section title widget.
  ///
  /// @param title: Title text for the section [String].
  /// @returns: Widget containing the section title [Widget].
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Builds basic container shimmer example.
  ///
  /// @returns: Widget containing basic container example [Widget].
  Widget _buildBasicContainerExample() {
    return const Column(
      children: [
        Text('Simple container with shimmer effect:'),
        SizedBox(height: 8),
        NbxShimmerContainer(
          style: ShimmerSkeletonStyle(
            width: 200,
            height: 100,
            borderRadiusDouble: 12,
          ),
        ),
      ],
    );
  }

  /// Builds expanded container shimmer example.
  ///
  /// @returns: Widget containing expanded container example [Widget].
  Widget _buildExpandedContainerExample() {
    return const Column(
      children: [
        Text('Expanded container that fills available space:'),
        SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: NbxShimmerContainerExpanded(
            style: ShimmerSkeletonStyle(
              width: double.infinity,
              borderRadiusDouble: 8,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds container list shimmer examples.
  ///
  /// @returns: Widget containing container list examples [Widget].
  Widget _buildContainerListExamples() {
    return const Column(
      children: [
        Text('Horizontal list of containers:'),
        SizedBox(height: 8),
        NbxShimmerContainerList(
          style: ShimmerSkeletonStyle(
            width: 80,
            height: 60,
            borderRadiusDouble: 8,
          ),
          itemCount: 5,
          isColumn: false,
        ),
        SizedBox(height: 16),
        Text('Vertical list of containers:'),
        SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: NbxShimmerContainerList(
            style: ShimmerSkeletonStyle(
              width: double.infinity,
              height: 40,
              borderRadiusDouble: 6,
            ),
            itemCount: 4,
            isColumn: true,
          ),
        ),
      ],
    );
  }

  /// Builds list tile shimmer examples.
  ///
  /// @returns: Widget containing list tile examples [Widget].
  Widget _buildListTileExamples() {
    return const Column(
      children: [
        Text('Single list tile with multiple elements:'),
        SizedBox(height: 8),
        NbxShimmerListTile(
          leadingStyle: ShimmerSkeletonStyle(
            width: 50,
            height: 50,
            boxShape: BoxShape.circle,
          ),
          titleStyle: ShimmerSkeletonStyle(width: 200, height: 20),
          subtitleStyle: ShimmerSkeletonStyle(width: 150, height: 16),
          trailingStyle: ShimmerSkeletonStyle(width: 30, height: 30),
          contentSpacing: 12,
          verticalSpacing: 8,
          hasContainer: true,
        ),
        SizedBox(height: 16),
        Text('List of tiles with separators:'),
        SizedBox(height: 8),
        SizedBox(
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
            hasContainer: false,
          ),
        ),
      ],
    );
  }

  /// Builds grid shimmer example.
  ///
  /// @returns: Widget containing grid example [Widget].
  Widget _buildGridExample() {
    return const Column(
      children: [
        Text('Grid layout with icon skeletons:'),
        SizedBox(height: 8),
        SizedBox(height: 200, child: NbxShimmerGrid(itemCount: 6)),
      ],
    );
  }

  /// Builds complex layout shimmer example.
  ///
  /// @returns: Widget containing complex layout example [Widget].
  Widget _buildComplexLayoutExample() {
    return const Column(
      children: [
        Text('Complex layout with multiple shimmer types:'),
        SizedBox(height: 8),
        NbxShimmerTwiceContainerList(
          heightFull: 200,
          axis: Axis.vertical,
          skeletonListOneStyle: ShimmerSkeletonStyle(
            width: double.infinity,
            height: 30,
            borderRadiusDouble: 6,
          ),
          itemCountListOne: 3,
          isColumnListOne: true,
          skeletonListTwoStyle: ShimmerSkeletonStyle(
            width: 100,
            height: 50,
            borderRadiusDouble: 8,
          ),
          itemCountListTwo: 4,
          isColumnListTwo: false,
        ),
      ],
    );
  }
}
