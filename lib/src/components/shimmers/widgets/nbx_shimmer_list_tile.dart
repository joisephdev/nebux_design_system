import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/shimmers/constants/shimmer_constants.dart';
import 'package:nebux_design_system/src/components/shimmers/models/shimmer_skeleton_style.dart';
import 'package:nebux_design_system/src/components/shimmers/widgets/nbx_shimmer_animation.dart';
import 'package:nebux_design_system/src/components/shimmers/widgets/shimmer_container_builder.dart';

/// A shimmer widget that simulates a list tile with customizable elements.
///
/// This widget creates a skeleton list tile with optional leading, title,
/// subtitle, paragraph, and trailing elements.
class NbxShimmerListTile extends StatelessWidget {
  /// Style configuration for the leading element.
  final ShimmerSkeletonStyle? leadingStyle;

  /// Style configuration for the title element.
  final ShimmerSkeletonStyle titleStyle;

  /// Style configuration for the subtitle element.
  final ShimmerSkeletonStyle? subtitleStyle;

  /// Style configuration for the paragraph element.
  final ShimmerSkeletonStyle? paragraphStyle;

  /// Style configuration for the trailing element.
  final ShimmerSkeletonStyle? trailingStyle;

  /// Padding around the entire list tile.
  final EdgeInsetsGeometry? padding;

  /// Spacing between content elements.
  final double? contentSpacing;

  /// Vertical spacing between elements.
  final double? verticalSpacing;

  /// Whether to wrap the tile in a container with background.
  final bool? hasContainer;

  /// Creates a new shimmer list tile widget.
  ///
  /// @param leadingStyle: Style for leading element [ShimmerContainerStyle?].
  /// @param titleStyle: Style for title element [ShimmerSkeletonStyle].
  /// @param subtitleStyle: Style for subtitle element [ShimmerContainerStyle?].
  /// @param paragraphStyle: Style for paragraph element [ShimmerContainerStyle?].
  /// @param trailingStyle: Style for trailing element [ShimmerContainerStyle?].
  /// @param padding: Padding around the tile [EdgeInsetsGeometry?].
  /// @param contentSpacing: Spacing between content elements [double?].
  /// @param verticalSpacing: Vertical spacing between elements [double?].
  /// @param hasContainer: Whether to add container background [bool?].
  const NbxShimmerListTile({
    super.key,
    this.leadingStyle,
    required this.titleStyle,
    this.subtitleStyle,
    this.paragraphStyle,
    this.trailingStyle,
    this.padding,
    this.contentSpacing,
    this.verticalSpacing,
    this.hasContainer,
  });

  @override
  Widget build(BuildContext context) {
    return NbxShimmerAnimation(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          decoration: hasContainer == true ? _buildContainerDecoration() : null,
          padding: hasContainer == true
              ? ShimmerConstants.defaultPadding
              : null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingStyle?.width != null)
                ShimmerContainerBuilder(style: leadingStyle!),
              SizedBox(
                width: contentSpacing ?? ShimmerConstants.defaultSpacing,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ShimmerContainerBuilder(style: titleStyle),
                    if (subtitleStyle?.width != null) ...[
                      SizedBox(
                        height:
                            verticalSpacing ?? ShimmerConstants.defaultSpacing,
                      ),
                      ShimmerContainerBuilder(style: subtitleStyle!),
                    ],
                    if (paragraphStyle?.width != null) ...[
                      SizedBox(
                        height:
                            verticalSpacing ?? ShimmerConstants.defaultSpacing,
                      ),
                      ShimmerContainerBuilder(style: paragraphStyle!),
                    ],
                  ],
                ),
              ),
              SizedBox(
                width: contentSpacing ?? ShimmerConstants.defaultSpacing,
              ),
              if (trailingStyle?.width != null)
                ShimmerContainerBuilder(style: trailingStyle!),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the decoration for the container background.
  ///
  /// @returns: BoxDecoration for the container [BoxDecoration].
  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
      boxShadow: ShimmerConstants.defaultShadow,
    );
  }
}
