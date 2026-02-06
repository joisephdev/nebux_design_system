import 'package:flutter/material.dart';
import '../widgets/nbx_shimmer_animation.dart';

/// A shimmer widget that displays a grid of skeleton icons.
///
/// This widget creates a grid layout with skeleton placeholders
/// that simulate icon-based content loading states.
class NbxShimmerGrid extends StatelessWidget {
  /// Number of grid items to display.
  final int itemCount;

  /// Creates a new shimmer grid widget.
  ///
  /// @param itemCount: Number of grid items to display [int].
  const NbxShimmerGrid({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return NbxShimmerAnimation(
      child: GridView.builder(
        padding: const EdgeInsets.only(right: 16, left: 16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 0,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return _buildGridItem();
        },
      ),
    );
  }

  /// Builds a single grid item with icon skeleton.
  ///
  /// @returns: Widget representing a single grid item [Widget].
  Widget _buildGridItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: SizedBox(
        height: 90,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 0,
                  left: 16,
                  right: 16,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Container(
                      height: 42,
                      width: 50,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.info,
                        size: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
