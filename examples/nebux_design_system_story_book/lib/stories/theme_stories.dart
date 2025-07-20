import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ThemeStories extends StatelessWidget {
  const ThemeStories({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeShowcase();
  }
}

class ThemeShowcase extends StatelessWidget {
  const ThemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.nebuxTheme;

    return Scaffold(
      backgroundColor: theme.colors.scaffold,
      appBar: AppBar(
        title: Text(
          'Theme & Colors',
          style: theme.typography.heading.copyWith(
            color: theme.colors.textPrimary,
          ),
        ),
        backgroundColor: theme.colors.scaffold,
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
              'Color Palette',
              style: theme.typography.heading.copyWith(
                color: theme.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // Color Palette
            _buildColorPalette(context),

            const SizedBox(height: 32),

            Text(
              'Typography',
              style: theme.typography.heading.copyWith(
                color: theme.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // Typography Examples
            _buildTypographyExamples(context),

            const SizedBox(height: 32),

            Text(
              'Spacing',
              style: theme.typography.heading.copyWith(
                color: theme.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // Spacing Examples
            _buildSpacingExamples(context),
          ],
        ),
      ),
    );
  }

  Widget _buildColorPalette(BuildContext context) {
    final theme = context.nebuxTheme;
    final colors = theme.colors;

    return Column(
      children: [
        _buildColorCard('Primary', colors.primary, 'Main brand color'),
        _buildColorCard('Secondary', colors.secondary, 'Secondary actions'),
        _buildColorCard('Scaffold', colors.scaffold, 'Background color'),
        _buildColorCard('Error', colors.error, 'Error states'),
        _buildColorCard('Disabled', colors.disabled, 'Disabled states'),
        _buildColorCard('Text Primary', colors.textPrimary, 'Main text color'),
        _buildColorCard(
          'Text Secondary',
          colors.textSecondary,
          'Secondary text',
        ),
      ],
    );
  }

  Widget _buildColorCard(String name, Color color, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            Text(
              '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypographyExamples(BuildContext context) {
    final theme = context.nebuxTheme;

    return Column(
      children: [
        _buildTypographyCard('Heading', theme.typography.heading),
        _buildTypographyCard('Section', theme.typography.section),
        _buildTypographyCard('Content', theme.typography.content),
        _buildTypographyCard('Paragraph', theme.typography.paragraph),
        _buildTypographyCard('Label', theme.typography.label),
        _buildTypographyCard('Caption', theme.typography.caption),
        _buildTypographyCard('Primary Action', theme.typography.primaryAction),
        _buildTypographyCard(
          'Secondary Action',
          theme.typography.secondaryAction,
        ),
      ],
    );
  }

  Widget _buildTypographyCard(String name, TextStyle style) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text('The quick brown fox jumps over the lazy dog', style: style),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacingExamples(BuildContext context) {
    final theme = context.nebuxTheme;

    return Column(
      children: [
        _buildSpacingCard('Extra Small', 8.0),
        _buildSpacingCard('Small', 10.0),
        _buildSpacingCard('Medium', 12.0),
        _buildSpacingCard('Medium Large', 13.0),
        _buildSpacingCard('Large', 14.0),
        _buildSpacingCard('Extra Large', 16.0),
        _buildSpacingCard('Heading 4', 18.0),
        _buildSpacingCard('Heading 3', 20.0),
        _buildSpacingCard('Heading 2', 22.0),
        _buildSpacingCard('Heading 1', 24.0),
      ],
    );
  }

  Widget _buildSpacingCard(String name, double size) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const Spacer(),
            Container(
              width: size,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${size.toInt()}px',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widgetbook Story for Color Palette
class ColorPaletteStory extends StatelessWidget {
  const ColorPaletteStory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.nebuxTheme;
    final colors = theme.colors;

    return Scaffold(
      backgroundColor: theme.colors.scaffold,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NebuX Color Palette', style: theme.typography.heading),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildColorTile('Primary', colors.primary),
                  _buildColorTile('Secondary', colors.secondary),
                  _buildColorTile('Error', colors.error),
                  _buildColorTile('Disabled', colors.disabled),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorTile(String name, Color color) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: color.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// Widgetbook Story for Typography
class TypographyStory extends StatelessWidget {
  const TypographyStory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.nebuxTheme;

    return Scaffold(
      backgroundColor: theme.colors.scaffold,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NebuX Typography', style: theme.typography.heading),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildTypographyExample('Heading', theme.typography.heading),
                  _buildTypographyExample('Section', theme.typography.section),
                  _buildTypographyExample('Content', theme.typography.content),
                  _buildTypographyExample(
                    'Paragraph',
                    theme.typography.paragraph,
                  ),
                  _buildTypographyExample('Label', theme.typography.label),
                  _buildTypographyExample('Caption', theme.typography.caption),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypographyExample(String name, TextStyle style) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text('The quick brown fox jumps over the lazy dog', style: style),
          ],
        ),
      ),
    );
  }
}
