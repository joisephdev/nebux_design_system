import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

/// Example page demonstrating the usage of NbxNetworkImage widget
/// with various configurations and use cases.
class NetworkImageExamplePage extends StatelessWidget {
  const NetworkImageExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NbxNetworkImage Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Basic Usage'),
            const SizedBox(height: 16),
            _buildBasicExamples(),

            const SizedBox(height: 32),
            _buildSectionTitle('Custom Placeholders & Error Widgets'),
            const SizedBox(height: 16),
            _buildCustomWidgetsExamples(),

            const SizedBox(height: 32),
            _buildSectionTitle('Factory Constructors'),
            const SizedBox(height: 16),
            _buildFactoryExamples(),

            const SizedBox(height: 32),
            _buildSectionTitle('Advanced Configurations'),
            const SizedBox(height: 16),
            _buildAdvancedExamples(),

            const SizedBox(height: 32),
            _buildSectionTitle('Performance & Caching'),
            const SizedBox(height: 16),
            _buildPerformanceExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildBasicExamples() {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        // Basic image with default settings
        Column(
          children: [
            Text('Basic Image', style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/200/200?random=1',
              width: 200,
              height: 200,
            ),
          ],
        ),

        // Image with custom fit
        Column(
          children: [
            Text('Custom Fit', style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/200/200?random=2',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ],
        ),

        // Image with custom dimensions
        Column(
          children: [
            Text(
              'Custom Dimensions',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/300/150?random=3',
              width: 300,
              height: 150,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCustomWidgetsExamples() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        // Custom placeholder
        Column(
          children: [
            const Text(
              'Custom Placeholder',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/200/200?random=4',
              width: 200,
              height: 200,
              placeholder: Container(
                width: 200,
                height: 200,
                color: Colors.blue[100],
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 8),
                      Text('Loading...', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        // Custom error widget
        Column(
          children: [
            const Text(
              'Custom Error Widget',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://invalid-url-that-will-fail.com/image.jpg',
              width: 200,
              height: 200,
              errorWidget: Container(
                width: 200,
                height: 200,
                color: Colors.red[100],
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 48),
                      SizedBox(height: 8),
                      Text(
                        'Image failed to load',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        // Custom progress indicator
        Column(
          children: [
            const Text(
              'Custom Progress',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/200/200?random=5',
              width: 200,
              height: 200,
              progressIndicatorBuilder: (context, url, progress) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: progress.progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${((progress.progress ?? 0) * 100).toInt()}%',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFactoryExamples() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        // Circular image
        Column(
          children: [
            const Text(
              'Circular Image',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            NbxNetworkImageExtensions.circular(
              imageUrl: 'https://picsum.photos/200/200?random=6',
              radius: 100,
              border: Border.all(color: Colors.blue, width: 3),
              shadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ],
        ),

        // Square image
        Column(
          children: [
            const Text(
              'Square Image',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            NbxNetworkImageExtensions.square(
              imageUrl: 'https://picsum.photos/200/200?random=7',
              size: 200,
              borderRadius: BorderRadius.circular(20),
              shadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ],
        ),

        // Rounded image
        Column(
          children: [
            const Text(
              'Rounded Image',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            NbxNetworkImageExtensions.rounded(
              imageUrl: 'https://picsum.photos/300/200?random=8',
              width: 300,
              height: 200,
              borderRadius: 25,
              border: Border.all(color: Colors.green, width: 2),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdvancedExamples() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        // Image with fade animations
        const Column(
          children: [
            Text(
              'Fade Animations',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/200/200?random=9',
              width: 200,
              height: 200,
              fadeInDuration: Duration(milliseconds: 500),
              fadeOutDuration: Duration(milliseconds: 300),
              fadeInCurve: Curves.easeInOut,
              fadeOutCurve: Curves.easeInOut,
            ),
          ],
        ),

        // Image with color blending
        Column(
          children: [
            const Text(
              'Color Blending',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/200/200?random=10',
              width: 200,
              height: 200,
              color: Colors.blue.withValues(alpha: 0.3),
              colorBlendMode: BlendMode.modulate,
            ),
          ],
        ),

        // Image with custom cache settings
        const Column(
          children: [
            Text('Custom Cache', style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/200/200?random=11',
              width: 200,
              height: 200,
              memCacheWidth: 400,
              memCacheHeight: 400,
              maxWidthDiskCache: 800,
              maxHeightDiskCache: 800,
              cacheKey: 'custom_cache_key_11',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPerformanceExamples() {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        // Multiple images with different cache keys
        Column(
          children: [
            Text(
              'Multiple Cached Images',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                NbxNetworkImage(
                  imageUrl: 'https://picsum.photos/100/100?random=12',
                  width: 100,
                  height: 100,
                  cacheKey: 'performance_test_12',
                ),
                SizedBox(width: 8),
                NbxNetworkImage(
                  imageUrl: 'https://picsum.photos/100/100?random=13',
                  width: 100,
                  height: 100,
                  cacheKey: 'performance_test_13',
                ),
                SizedBox(width: 8),
                NbxNetworkImage(
                  imageUrl: 'https://picsum.photos/100/100?random=14',
                  width: 100,
                  height: 100,
                  cacheKey: 'performance_test_14',
                ),
              ],
            ),
          ],
        ),

        // Image with old image on URL change
        Column(
          children: [
            Text(
              'Old Image on URL Change',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/200/200?random=15',
              width: 200,
              height: 200,
              useOldImageOnUrlChange: true,
            ),
          ],
        ),

        // Image with HTTP headers
        Column(
          children: [
            Text(
              'With HTTP Headers',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            NbxNetworkImage(
              imageUrl: 'https://picsum.photos/200/200?random=16',
              width: 200,
              height: 200,
              httpHeaders: {
                'User-Agent': 'NbxNetworkImage/1.0',
                'Accept': 'image/*',
              },
            ),
          ],
        ),
      ],
    );
  }
}
