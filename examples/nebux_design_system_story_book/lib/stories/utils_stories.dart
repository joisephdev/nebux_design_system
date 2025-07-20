import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class UtilsStories extends StatelessWidget {
  const UtilsStories({super.key});

  @override
  Widget build(BuildContext context) {
    return const UtilsShowcase();
  }
}

class UtilsShowcase extends StatelessWidget {
  const UtilsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.nebuxTheme;

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: AppBar(
        title: Text(
          'Utilities',
          style: theme.typography.heading.copyWith(
            color: theme.colors.textPrimary,
          ),
        ),
        backgroundColor: theme.colors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Utility Components',
              style: theme.typography.heading.copyWith(
                color: theme.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 24),

            // Bottom Sheet Example
            _buildComponentCard(
              context,
              'Bottom Sheet',
              'Custom bottom sheet with NebuX styling',
              _buildBottomSheetExample(context),
            ),

            const SizedBox(height: 24),

            // Spacing Utilities
            _buildComponentCard(
              context,
              'Spacing Utilities',
              'Predefined spacing values for consistent layouts',
              _buildSpacingUtilities(context),
            ),

            const SizedBox(height: 24),

            // Color Converter
            _buildComponentCard(
              context,
              'Color Converter',
              'Utilities for color manipulation and conversion',
              _buildColorConverterExample(context),
            ),

            const SizedBox(height: 24),

            // Usage Examples
            Text(
              'Usage Examples',
              style: theme.typography.section.copyWith(
                color: theme.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            _buildUsageExample(context, 'Bottom Sheet Usage', '''
// Show a custom bottom sheet
NebuxBottomSheet.showBottomSheet(
  context,
  body: YourContent(),
);
              '''),

            _buildUsageExample(context, 'Spacing Usage', '''
// Use predefined spacing
SizedBox(height: NebuxSpacing.medium),
SizedBox(width: NebuxSpacing.large),
              '''),
          ],
        ),
      ),
    );
  }

  Widget _buildComponentCard(
    BuildContext context,
    String title,
    String description,
    Widget component,
  ) {
    final theme = context.nebuxTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.typography.primaryAction.copyWith(
                color: theme.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: theme.typography.content.copyWith(
                color: theme.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            component,
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetExample(BuildContext context) {
    final theme = context.nebuxTheme;

    return ElevatedButton(
      onPressed: () {
        NebuxBottomSheet.showBottomSheet(
          context,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Example Bottom Sheet', style: theme.typography.heading),
                const SizedBox(height: 16),
                Text(
                  'This is an example bottom sheet',
                  style: theme.typography.content,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
      child: const Text('Show Bottom Sheet'),
    );
  }

  Widget _buildSpacingUtilities(BuildContext context) {
    // final theme = context.nebuxTheme;

    return Column(
      children: [
        _buildSpacingRow('Extra Small', 8.0),
        _buildSpacingRow('Small', 10.0),
        _buildSpacingRow('Medium', 12.0),
        _buildSpacingRow('Large', 14.0),
        _buildSpacingRow('Extra Large', 16.0),
      ],
    );
  }

  Widget _buildSpacingRow(String name, double size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(name, style: const TextStyle(fontSize: 12)),
          ),
          Container(
            width: size,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${size.toInt()}px',
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'monospace',
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorConverterExample(BuildContext context) {
    final theme = context.nebuxTheme;

    return Column(
      children: [
        Text(
          'Color Examples',
          style: theme.typography.section.copyWith(
            color: theme.colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        _buildColorExample('Primary', theme.colors.primary),
        _buildColorExample('Secondary', theme.colors.secondary),
        _buildColorExample('Error', theme.colors.error),
      ],
    );
  }

  Widget _buildColorExample(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$name: #${color.value.toRadixString(16).substring(2).toUpperCase()}',
            style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageExample(BuildContext context, String title, String code) {
    final theme = context.nebuxTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.typography.primaryAction.copyWith(
                color: theme.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: theme.colors.textSecondary.withOpacity(0.1),
                ),
              ),
              child: Text(
                code,
                style: theme.typography.content.copyWith(
                  color: theme.colors.textPrimary,
                  fontFamily: 'monospace',
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widgetbook Story for Bottom Sheet
class BottomSheetStory extends StatelessWidget {
  const BottomSheetStory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.nebuxTheme;

    return Scaffold(
      backgroundColor: theme.colors.background,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NebuxBottomSheet.showBottomSheet(
              context,
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('NebuX Bottom Sheet', style: theme.typography.heading),
                    const SizedBox(height: 16),
                    Text(
                      'This is a custom bottom sheet with NebuX styling',
                      style: theme.typography.content,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}

// Widgetbook Story for Spacing
class SpacingStory extends StatelessWidget {
  const SpacingStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'NebuX Spacing Scale',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildSpacingExample('Extra Small', 8.0),
                  _buildSpacingExample('Small', 10.0),
                  _buildSpacingExample('Medium', 12.0),
                  _buildSpacingExample('Medium Large', 13.0),
                  _buildSpacingExample('Large', 14.0),
                  _buildSpacingExample('Extra Large', 16.0),
                  _buildSpacingExample('Heading 4', 18.0),
                  _buildSpacingExample('Heading 3', 20.0),
                  _buildSpacingExample('Heading 2', 22.0),
                  _buildSpacingExample('Heading 1', 24.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacingExample(String name, double size) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              width: size,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${size.toInt()}px',
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
