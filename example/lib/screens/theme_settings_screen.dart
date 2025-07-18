import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebux_core/nebux_core.dart';
import '../providers/theme_provider.dart';

/// Theme settings screen demonstrating advanced theme functionality
class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final textColor = themeProvider.currentColors.textPrimary;
    final secondaryTextColor = textColor.withValues(alpha: 0.7);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme Settings',
          style: typography.labelLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: textColor,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Configuration',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            heightSpace16,
            Text(
              'Customize your app appearance with different theme options.',
              style: typography.bodyLarge,
            ),
            heightSpace32,
            // Current Theme Status
            _buildThemeStatusCard(context, themeProvider),
            heightSpace24,
            // Theme Mode Selection
            _buildThemeModeSection(context, themeProvider),
            heightSpace24,
            // Theme Actions
            _buildThemeActionsSection(context, themeProvider),
            heightSpace24,
            // Theme Information
            _buildThemeInfoSection(context, themeProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeStatusCard(
    BuildContext context,
    ThemeProvider themeProvider,
  ) {
    final typography = themeProvider.currentTypography;
    final colors = themeProvider.currentColors;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: colors.primary,
                  size: 24,
                ),
                widthSpace12,
                Text(
                  'Current Theme',
                  style: typography.labelLarge,
                ),
              ],
            ),
            heightSpace12,
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: colors.primary,
                  size: 24,
                ),
                widthSpace8,
                Text(
                  themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode',
                  style: typography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  'Active',
                  style: typography.bodySmall.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeModeSection(
    BuildContext context,
    ThemeProvider themeProvider,
  ) {
    final typography = themeProvider.currentTypography;
    final cardTextColor = themeProvider.currentColors.textPrimary;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Mode',
              style: typography.labelLarge,
            ),
            heightSpace16,
            _buildThemeOption(
              context,
              'Light Mode',
              'Clean and bright interface',
              Icons.light_mode,
              false,
              themeProvider.isDarkMode == false,
              () => themeProvider.setThemeMode(false),
              cardTextColor,
            ),
            heightSpace12,
            _buildThemeOption(
              context,
              'Dark Mode',
              'Easy on the eyes in low light',
              Icons.dark_mode,
              true,
              themeProvider.isDarkMode == true,
              () => themeProvider.setThemeMode(true),
              cardTextColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    bool isDark,
    bool isSelected,
    VoidCallback onTap,
    Color cardTextColor,
  ) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final colors = themeProvider.currentColors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? colors.primary : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected
              ? colors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? colors.primary : cardTextColor,
            ),
            widthSpace12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: typography.labelMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(description, style: typography.bodySmall),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: colors.primary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeActionsSection(
      BuildContext context, ThemeProvider themeProvider) {
    final typography = themeProvider.currentTypography;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Actions',
              style: typography.labelLarge,
            ),
            heightSpace16,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => themeProvider.toggleTheme(),
                    icon: const Icon(Icons.swap_horiz),
                    label: Text('Toggle Theme', style: typography.labelMedium),
                  ),
                ),
                widthSpace12,
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => themeProvider.resetTheme(),
                    icon: const Icon(Icons.refresh),
                    label: Text('Reset', style: typography.labelMedium),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeInfoSection(
      BuildContext context, ThemeProvider themeProvider) {
    final typography = themeProvider.currentTypography;
    final colors = themeProvider.currentColors;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Information',
              style: typography.labelLarge,
            ),
            heightSpace16,
            _buildInfoRow(
                'Primary Color', _getColorHex(colors.primary), typography),
            _buildInfoRow(
                'Secondary Color', _getColorHex(colors.secondary), typography),
            _buildInfoRow(
                'Scaffold', _getColorHex(colors.scaffold), typography),
            _buildInfoRow('Black', _getColorHex(colors.black), typography),
            _buildInfoRow('White', _getColorHex(colors.white), typography),
            _buildInfoRow(
                'Error Color', _getColorHex(colors.error), typography),
            _buildInfoRow(
                'Brightness', themeProvider.brightness.name, typography),
            _buildInfoRow('Material 3', 'Enabled', typography),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, NebuxTypography typography) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: typography.labelMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            value,
            style: typography.bodySmall.copyWith(
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  String _getColorHex(Color color) {
    return '#${color.value.toRadixString(16).toUpperCase().substring(2)}';
  }
}
