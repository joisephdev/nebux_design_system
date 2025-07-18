import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebux_core/nebux_core.dart';
import '../providers/theme_provider.dart';

/// Demo screen showcasing NebuX Core typography system
class TypographyDemoScreen extends StatelessWidget {
  const TypographyDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final textColor = themeProvider.currentColors.textPrimary;
    final secondaryTextColor = textColor.withOpacity(0.7);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Typography Demo',
          style: typography.labelLarge.copyWith(color: textColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Text Styles',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            _buildTypographySection(context),
            heightSpace32,
            Text(
              'Font Sizes',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            _buildFontSizeSection(context),
            heightSpace32,
            Text(
              'Custom Typography',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            _buildCustomTypographyExample(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTypographySection(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextStyleCard(
            context,
            'Body Large',
            typography.bodyLarge,
            'This is body large text with a longer sample to show how it wraps and flows naturally in the layout.',
            typography),
        heightSpace8,
        _buildTextStyleCard(
            context,
            'Body Medium',
            typography.bodyMedium,
            'This is body medium text with a longer sample to show how it wraps and flows naturally in the layout.',
            typography),
        heightSpace8,
        _buildTextStyleCard(context, 'Body Small', typography.bodySmall,
            'This is body small text for captions and metadata.', typography),
        heightSpace8,
        _buildTextStyleCard(context, 'Label Large', typography.labelLarge,
            'This is label large text for headings and titles.', typography),
        heightSpace8,
        _buildTextStyleCard(context, 'Label Medium', typography.labelMedium,
            'This is label medium text for section headers.', typography),
        heightSpace8,
        _buildTextStyleCard(context, 'Label Small', typography.labelSmall,
            'This is label small text for timestamps and status.', typography),
        heightSpace8,
        _buildTextStyleCard(context, 'CTA', typography.cta,
            'This is CTA text for call-to-action buttons.', typography),
        heightSpace8,
        _buildTextStyleCard(context, 'Alternative', typography.alternative,
            'This is alternative text for secondary buttons.', typography),
      ],
    );
  }

  Widget _buildTextStyleCard(BuildContext context, String label,
      TextStyle style, String sample, NebuxTypography typography) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cardTextColor = themeProvider.currentColors.textPrimary;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: typography.labelMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            heightSpace8,
            Text(
              sample,
              style: style,
            ),
            heightSpace4,
            Text(
              'Font: ${style.fontFamily ?? 'System'}, '
              'Size: ${style.fontSize?.toStringAsFixed(1) ?? 'N/A'}, '
              'Weight: ${_getFontWeightName(style.fontWeight)}',
              style: typography.bodySmall.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFontWeightName(FontWeight? weight) {
    if (weight == null) return 'Normal';
    switch (weight) {
      case FontWeight.w100:
        return 'Thin (100)';
      case FontWeight.w200:
        return 'Extra Light (200)';
      case FontWeight.w300:
        return 'Light (300)';
      case FontWeight.w400:
        return 'Normal (400)';
      case FontWeight.w500:
        return 'Medium (500)';
      case FontWeight.w600:
        return 'Semi Bold (600)';
      case FontWeight.w700:
        return 'Bold (700)';
      case FontWeight.w800:
        return 'Extra Bold (800)';
      case FontWeight.w900:
        return 'Black (900)';
      default:
        return 'Normal';
    }
  }

  Widget _buildFontSizeSection(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final fontSize = themeProvider.currentFontSize;
    final typography = themeProvider.currentTypography;
    final cardTextColor = themeProvider.currentColors.textPrimary;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Font Sizes',
              style: typography.labelLarge,
            ),
            heightSpace16,
            _buildFontSizeRow(
                context, 'Extra Large', fontSize.extraLarge, typography),
            heightSpace8,
            _buildFontSizeRow(context, 'Large', fontSize.large, typography),
            heightSpace8,
            _buildFontSizeRow(context, 'Medium', fontSize.medium, typography),
            heightSpace8,
            _buildFontSizeRow(context, 'Small', fontSize.small, typography),
            heightSpace8,
            _buildFontSizeRow(
                context, 'Heading 1', fontSize.heading1, typography),
            heightSpace8,
            _buildFontSizeRow(
                context, 'Heading 2', fontSize.heading2, typography),
            heightSpace8,
            _buildFontSizeRow(
                context, 'Heading 3', fontSize.heading3, typography),
            heightSpace8,
            _buildFontSizeRow(
                context, 'Heading 4', fontSize.heading4, typography),
          ],
        ),
      ),
    );
  }

  Widget _buildFontSizeRow(BuildContext context, String label, double size,
      NebuxTypography typography) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cardTextColor = themeProvider.currentColors.textPrimary;
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: typography.labelSmall.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        widthSpace16,
        Text(
          'Sample Text',
          style: TextStyle(fontSize: size),
        ),
        const Spacer(),
        Text(
          '${size.toStringAsFixed(1)}px',
          style: typography.bodySmall.copyWith(
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }

  Widget _buildCustomTypographyExample(BuildContext context) {
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
              'Creating Custom Typography',
              style: typography.labelLarge,
            ),
            heightSpace8,
            Text(
              'You can create custom typography using NebuxTypography.custom() '
              'or NebuxTypography.standard() for predefined styles. '
              'The typography system uses Google Fonts Montserrat by default.',
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
                '// Example: Creating custom typography\n'
                'final typography = NebuxTypography.custom(\n'
                '  bodyLarge: GoogleFonts.montserrat(\n'
                '    fontSize: 16,\n'
                '    fontWeight: FontWeight.w400,\n'
                '  ),\n'
                '  labelLarge: GoogleFonts.montserrat(\n'
                '    fontSize: 18,\n'
                '    fontWeight: FontWeight.w600,\n'
                '  ),\n'
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
