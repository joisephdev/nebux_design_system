import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebux_core/nebux_core.dart';
import 'theme_demo_screen.dart';
import 'typography_demo_screen.dart';
import 'spacing_demo_screen.dart';
import 'theme_settings_screen.dart';
import '../providers/theme_provider.dart';

/// Home screen with navigation to different NebuX Core examples
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final textColor = themeProvider.currentColors.textPrimary;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NebuX Core Examples',
          style: typography.labelLarge.copyWith(color: textColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThemeSettingsScreen(),
                ),
              );
            },
            tooltip: 'Theme Settings',
          ),
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: textColor,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
            tooltip: themeProvider.isDarkMode
                ? 'Switch to Light Mode'
                : 'Switch to Dark Mode',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to NebuX Core',
              style: typography.labelLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            heightSpace16,
            Text(
              'Explore the design system components and features',
              style: typography.bodyLarge,
            ),
            heightSpace32,
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildDemoCard(
                    context,
                    'Theme System',
                    'Colors, typography, and spacing',
                    Icons.palette,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThemeDemoScreen(),
                      ),
                    ),
                  ),
                  _buildDemoCard(
                    context,
                    'Typography',
                    'Text styles and fonts',
                    Icons.text_fields,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TypographyDemoScreen(),
                      ),
                    ),
                  ),
                  _buildDemoCard(
                    context,
                    'Spacing',
                    'Consistent spacing utilities',
                    Icons.space_bar,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpacingDemoScreen(),
                      ),
                    ),
                  ),
                  _buildDemoCard(
                    context,
                    'Components',
                    'Buttons, cards, and inputs',
                    Icons.widgets,
                    () => _showComponentsDemo(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;
    final cardTextColor = themeProvider.currentColors.textPrimary;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: theme.colorScheme.primary,
              ),
              heightSpace16,
              Text(
                title,
                style: typography.labelLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              heightSpace8,
              Text(
                description,
                style: typography.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showComponentsDemo(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Components Demo', style: typography.labelLarge),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This would show various UI components like buttons, cards, and inputs '
              'that use the NebuX Core design system.',
              style: typography.bodyMedium,
            ),
            heightSpace16,
            Text(
              'Available components:',
              style:
                  typography.labelMedium.copyWith(fontWeight: FontWeight.bold),
            ),
            heightSpace8,
            Text('• Buttons (Elevated, Outlined, Text, Filled)',
                style: typography.bodySmall),
            Text('• Cards with proper elevation', style: typography.bodySmall),
            Text('• Input fields with validation', style: typography.bodySmall),
            Text('• Navigation components', style: typography.bodySmall),
            Text('• Theme-aware components', style: typography.bodySmall),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close', style: typography.labelMedium),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThemeSettingsScreen(),
                ),
              );
            },
            child: Text('Theme Settings', style: typography.labelMedium),
          ),
        ],
      ),
    );
  }
}
