import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebux_core/nebux_core.dart';
import '../providers/theme_provider.dart';

/// Demo screen showcasing NebuX Core spacing utilities
class SpacingDemoScreen extends StatelessWidget {
  const SpacingDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final textColor = themeProvider.currentColors.textPrimary;
    final secondaryTextColor = textColor.withOpacity(0.7);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spacing Demo',
          style: typography.labelLarge.copyWith(color: textColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spacing Utilities',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            Text(
              'NebuX Core provides consistent spacing utilities for height and width. '
              'These utilities help maintain consistent spacing throughout your app.',
              style: typography.bodyLarge.copyWith(color: secondaryTextColor),
            ),
            heightSpace32,
            Text(
              'Height Spacing',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            _buildHeightSpacingSection(context),
            heightSpace32,
            Text(
              'Width Spacing',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            _buildWidthSpacingSection(context),
            heightSpace32,
            Text(
              'Usage Examples',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            _buildUsageExamples(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeightSpacingSection(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final cardTextColor = themeProvider.currentColors.textPrimary;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Height Spacers',
              style:
                  typography.labelLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            heightSpace16,
            _buildSpacingRow(context, 'heightSpace2', 2, typography),
            _buildSpacingRow(context, 'heightSpace4', 4, typography),
            _buildSpacingRow(context, 'heightSpace6', 6, typography),
            _buildSpacingRow(context, 'heightSpace8', 8, typography),
            _buildSpacingRow(context, 'heightSpace10', 10, typography),
            _buildSpacingRow(context, 'heightSpace12', 12, typography),
            _buildSpacingRow(context, 'heightSpace15', 15, typography),
            _buildSpacingRow(context, 'heightSpace16', 16, typography),
            _buildSpacingRow(context, 'heightSpace20', 20, typography),
            _buildSpacingRow(context, 'heightSpace24', 24, typography),
            _buildSpacingRow(context, 'heightSpace25', 25, typography),
            _buildSpacingRow(context, 'heightSpace30', 30, typography),
            _buildSpacingRow(context, 'heightSpace32', 32, typography),
            _buildSpacingRow(context, 'heightSpace40', 40, typography),
            _buildSpacingRow(context, 'heightSpace50', 50, typography),
            _buildSpacingRow(context, 'heightSpace60', 60, typography),
            _buildSpacingRow(context, 'heightSpace80', 80, typography),
            _buildSpacingRow(context, 'heightSpace100', 100, typography),
            _buildSpacingRow(context, 'heightSpace200', 200, typography),
          ],
        ),
      ),
    );
  }

  Widget _buildWidthSpacingSection(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final cardTextColor = themeProvider.currentColors.textPrimary;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Width Spacers',
              style:
                  typography.labelLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            heightSpace16,
            _buildSpacingRow(context, 'widthSpace2', 2, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace4', 4, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace6', 6, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace8', 8, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace10', 10, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace12', 12, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace14', 14, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace15', 15, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace16', 16, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace18', 18, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace20', 20, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace24', 24, typography,
                isWidth: true),
            _buildSpacingRow(context, 'widthSpace25', 25, typography,
                isWidth: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacingRow(BuildContext context, String name, double size,
      NebuxTypography typography,
      {bool isWidth = false}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cardTextColor = themeProvider.currentColors.textPrimary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              name,
              style: typography.bodySmall.copyWith(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          widthSpace16,
          Container(
            width: isWidth ? size : 200,
            height: isWidth ? 20 : size,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              border: Border.all(color: Colors.blue.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                '${size.toStringAsFixed(0)}px',
                style: typography.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageExamples(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final cardTextColor = themeProvider.currentColors.textPrimary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic Usage',
                  style: typography.labelLarge,
                ),
                heightSpace8,
                Text(
                  'Use spacing utilities to add consistent spacing between widgets:',
                  style: typography.bodyMedium,
                ),
                heightSpace16,
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    'Column(\n'
                    '  children: [\n'
                    '    Text(\'First widget\'),\n'
                    '    heightSpace16,  // 16px spacing\n'
                    '    Text(\'Second widget\'),\n'
                    '    heightSpace24,  // 24px spacing\n'
                    '    Text(\'Third widget\'),\n'
                    '  ],\n'
                    ')',
                    style: typography.bodySmall.copyWith(
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        heightSpace16,
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Horizontal Layout',
                  style: typography.labelLarge,
                ),
                heightSpace8,
                Text(
                  'Use width spacers for horizontal layouts:',
                  style: typography.bodyMedium,
                ),
                heightSpace16,
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('Left',
                          style: typography.bodySmall
                              .copyWith(color: cardTextColor)),
                    ),
                    widthSpace16,
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('Center',
                          style: typography.bodySmall
                              .copyWith(color: cardTextColor)),
                    ),
                    widthSpace16,
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('Right',
                          style: typography.bodySmall
                              .copyWith(color: cardTextColor)),
                    ),
                  ],
                ),
                heightSpace16,
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    'Row(\n'
                    '  children: [\n'
                    '    Widget1(),\n'
                    '    widthSpace16,  // 16px spacing\n'
                    '    Widget2(),\n'
                    '    widthSpace16,  // 16px spacing\n'
                    '    Widget3(),\n'
                    '  ],\n'
                    ')',
                    style: typography.bodySmall.copyWith(
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
