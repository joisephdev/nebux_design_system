import 'package:flutter/material.dart';

import '../models/shimmer_skeleton_style.dart';
import '../widgets/nbx_shimmer_list_tile.dart';

/// A shimmer widget that displays a list of shimmer list tiles.
///
/// This widget creates a scrollable list of shimmer list tiles with
/// customizable separators and styling.
class NbxShimmerListTileListView extends StatelessWidget {
  /// Total height of the list view.
  final double? heightFull;

  /// Number of list tiles to display.
  final int itemCount;

  /// Style configuration for the title element in each tile.
  final ShimmerSkeletonStyle titleStyle;

  /// Style configuration for the leading element in each tile.
  final ShimmerSkeletonStyle? leadingStyle;

  /// Style configuration for the subtitle element in each tile.
  final ShimmerSkeletonStyle? subtitleStyle;

  /// Style configuration for the paragraph element in each tile.
  final ShimmerSkeletonStyle? paragraphStyle;

  /// Style configuration for the trailing element in each tile.
  final ShimmerSkeletonStyle? trailingStyle;

  /// Padding around each list tile.
  final EdgeInsetsGeometry? padding;

  /// Spacing between content elements in each tile.
  final double? contentSpacing;

  /// Vertical spacing between elements in each tile.
  final double? verticalSpacing;

  /// Whether to wrap each tile in a container with background.
  final bool? hasContainer;

  /// Custom divider widget between tiles. If null, uses default divider.
  final Widget? dividerWidget;

  /// Creates a new shimmer list tile list view widget.
  ///
  /// @param heightFull: Total height of the list [double?].
  /// @param itemCount: Number of tiles to display [int].
  /// @param titleStyle: Style for title elements [ShimmerSkeletonStyle].
  /// @param leadingStyle: Style for leading elements [ShimmerContainerStyle?].
  /// @param subtitleStyle: Style for subtitle elements [ShimmerContainerStyle?].
  /// @param paragraphStyle: Style for paragraph elements [ShimmerContainerStyle?].
  /// @param trailingStyle: Style for trailing elements [ShimmerContainerStyle?].
  /// @param padding: Padding around each tile [EdgeInsetsGeometry?].
  /// @param contentSpacing: Spacing between content elements [double?].
  /// @param verticalSpacing: Vertical spacing between elements [double?].
  /// @param hasContainer: Whether to add container background [bool?].
  /// @param dividerWidget: Custom divider between tiles [Widget?].
  const NbxShimmerListTileListView({
    super.key,
    this.heightFull,
    required this.itemCount,
    required this.titleStyle,
    this.leadingStyle,
    this.subtitleStyle,
    this.paragraphStyle,
    this.trailingStyle,
    this.padding,
    this.contentSpacing,
    this.verticalSpacing,
    this.hasContainer,
    this.dividerWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: heightFull,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (BuildContext context, int index) {
              return dividerWidget ?? _buildDefaultDivider();
            },
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              return NbxShimmerListTile(
                hasContainer: hasContainer,
                padding: padding,
                leadingStyle: leadingStyle,
                subtitleStyle: subtitleStyle,
                verticalSpacing: verticalSpacing,
                contentSpacing: contentSpacing,
                titleStyle: titleStyle,
                paragraphStyle: paragraphStyle,
                trailingStyle: trailingStyle,
              );
            },
          ),
        ),
      ],
    );
  }

  /// Builds the default divider widget.
  ///
  /// @returns: Default divider widget [Widget].
  Widget _buildDefaultDivider() {
    return Divider(height: 0, color: Colors.grey.shade500, thickness: 0.2);
  }
}
