import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebux_core/nebux_core.dart';
import '../providers/theme_provider.dart';

/// Demo screen showcasing NebuX Core theme system
class ThemeDemoScreen extends StatelessWidget {
  const ThemeDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final textColor = themeProvider.currentColors.textPrimary;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme System Demo',
          style: typography.labelLarge.copyWith(color: textColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Color Palette',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            _buildColorSection(context),
            heightSpace32,
            Text(
              'Theme Components',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            _buildThemeComponents(context),
            heightSpace32,
            Text(
              'Custom Theme Example',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            _buildCustomThemeExample(context),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSection(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final colors = themeProvider.currentColors;
    final cardTextColor = themeProvider.currentColors.textPrimary;

    return Column(
      children: [
        _buildColorCard('Primary', colors.primary, typography, cardTextColor),
        heightSpace8,
        _buildColorCard(
            'Secondary', colors.secondary, typography, cardTextColor),
        heightSpace8,
        _buildColorCard('Error', colors.error, typography, cardTextColor),
        heightSpace8,
        _buildColorCard('Scaffold', colors.scaffold, typography, cardTextColor),
        heightSpace8,
        _buildColorCard('Black', colors.black, typography, cardTextColor),
        heightSpace8,
        _buildColorCard('White', colors.white, typography, cardTextColor),
      ],
    );
  }

  Widget _buildColorCard(String label, Color color, NebuxTypography typography,
      Color cardTextColor) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
            ),
            widthSpace16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: typography.labelMedium
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '#${color.value.toRadixString(16).toUpperCase()}',
                    style: typography.bodySmall.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeComponents(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final cardTextColor = themeProvider.currentColors.textPrimary;

    return Column(
      children: [
        // Buttons
        Text(
          'Buttons',
          style: typography.labelLarge,
        ),
        heightSpace8,
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Elevated', style: typography.labelMedium),
              ),
            ),
            widthSpace8,
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Outlined', style: typography.labelMedium),
              ),
            ),
            widthSpace8,
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text('Text', style: typography.labelMedium),
              ),
            ),
          ],
        ),
        heightSpace16,

        // Cards
        Text(
          'Cards',
          style: typography.labelLarge,
        ),
        heightSpace8,
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sample Card',
                  style: typography.labelMedium,
                ),
                heightSpace8,
                Text(
                  'This card demonstrates the default card styling from the theme.',
                  style: typography.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        heightSpace16,

        // Input fields
        Text(
          'Input Fields',
          style: typography.labelLarge,
        ),
        heightSpace8,
        TextField(
          decoration: InputDecoration(
            labelText: 'Sample Input',
            hintText: 'Enter some text...',
            labelStyle: typography.labelMedium,
            hintStyle: typography.placeholder,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomThemeExample(BuildContext context) {
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
              'Creating Custom Themes',
              style: typography.labelLarge,
            ),
            heightSpace8,
            Text(
              'You can create custom themes using NebuxColors, NebuxTypography, '
              'and NebuxFontSize classes. The theme system supports both light '
              'and dark modes with proper color contrast.',
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
                '// Example: Creating custom NebuxTheme\n'
                'final nebuxTheme = NebuxTheme.custom(\n'
                '  colors: NebuxColors(\n'
                '    primary: Color(0xFF2196F3),\n'
                '    secondary: Color(0xFF4CAF50),\n'
                '    scaffold: Color(0xFFFFFFFF),\n'
                '    black: Color(0xFF000000),\n'
                '    white: Color(0xFFFFFFFF),\n'
                '    error: Color(0xFFE53935),\n'
                '    disabled: Color(0xFFBDBDBD),\n'
                '    textPrimary: Color(0xFF000000),\n'
                '    textSecondary: Color(0xFF666666),\n'
                '  ),\n'
                '  fontSize: NebuxFontSize.standard(),\n'
                '  typography: NebuxTypography.standard(),\n'
                ');',
                style: typography.bodySmall.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
