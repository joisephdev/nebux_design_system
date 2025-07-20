import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

import 'package:nebux_design_system_story_book/stories/app_bars_stories.dart';
import 'package:nebux_design_system_story_book/stories/theme_stories.dart';
import 'package:nebux_design_system_story_book/stories/utils_stories.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:nebux_design_system_story_book/main.directories.g.dart';

void main() {
  runApp(const MyApp());
}

@widgetbook.App()
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // The [directories] variable does not exist yet,
      // it will be generated in the next step
      directories: directories,
      lightTheme: NebuxTheme.createThemeData(
        isDark: false, // isDark
        colors: const NebuxColors(
          primary: Color(0xFF2196F3),
          secondary: Color(0xFF03DAC6),
          background: Color(0xFFF5F5F5),
          black: Color(0xFF000000),
          white: Color(0xFFFFFFFF),
          error: Color(0xFFB00020),
          textPrimary: Color(0xFF000000),
          textSecondary: Color(0xFF666666),
          primaryVariant: Color(0xFF2196F3),
          accent: Color(0xFF03DAC6),
          surface: Color(0xFFF5F5F5),
          cardColor: Color(0xFFF5F5F5),
          success: Color(0xFF48BB78),
          warning: Color(0xFFED8936),
          info: Color(0xFF4299E1),
          primaryGradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF03DAC6)],
          ),
          secondaryGradient: LinearGradient(
            colors: [Color(0xFF03DAC6), Color(0xFF2196F3)],
          ),
        ),
        fontSize: NebuxFontSize.standard(),
        typography: NebuxTypography.standard(),
      ),
      darkTheme: NebuxTheme.createThemeData(
        isDark: true, // isDark
        colors: const NebuxColors(
          primary: Color(0xFF90CAF9),
          secondary: Color(0xFF80DEEA),
          black: Color(0xFF000000),
          white: Color(0xFFFFFFFF),
          error: Color(0xFFCF6679),
          textPrimary: Color(0xFFFFFFFF),
          textSecondary: Color(0xFFB0B0B0),
          primaryVariant: Color(0xFF90CAF9),
          accent: Color(0xFF80DEEA),
          background: Color(0xFF121212),
          surface: Color(0xFF121212),
          cardColor: Color(0xFF121212),
          success: Color(0xFF48BB78),
          warning: Color(0xFFED8936),
          info: Color(0xFF4299E1),
          primaryGradient: LinearGradient(
            colors: [Color(0xFF90CAF9), Color(0xFF80DEEA)],
          ),
          secondaryGradient: LinearGradient(
            colors: [Color(0xFF80DEEA), Color(0xFF90CAF9)],
          ),
        ),
        fontSize: NebuxFontSize.standard(),
        typography: NebuxTypography.standard(),
      ),
      // home: const DesignSystemShowcase(),
    );

    return MaterialApp(
      title: 'NebuX Design System Storybook',
      theme: NebuxTheme.createThemeData(
        isDark: false, // isDark
        colors: const NebuxColors(
          primary: Color(0xFF2196F3),
          secondary: Color(0xFF03DAC6),
          background: Color(0xFFF5F5F5),
          black: Color(0xFF000000),
          white: Color(0xFFFFFFFF),
          error: Color(0xFFB00020),
          textPrimary: Color(0xFF000000),
          textSecondary: Color(0xFF666666),
          primaryVariant: Color(0xFF2196F3),
          accent: Color(0xFF03DAC6),
          surface: Color(0xFFF5F5F5),
          cardColor: Color(0xFFF5F5F5),
          success: Color(0xFF48BB78),
          warning: Color(0xFFED8936),
          info: Color(0xFF4299E1),
          primaryGradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF03DAC6)],
          ),
          secondaryGradient: LinearGradient(
            colors: [Color(0xFF03DAC6), Color(0xFF2196F3)],
          ),
        ),
        fontSize: NebuxFontSize.standard(),
        typography: NebuxTypography.standard(),
      ),
      darkTheme: NebuxTheme.createThemeData(
        isDark: true, // isDark
        colors: const NebuxColors(
          primary: Color(0xFF90CAF9),
          secondary: Color(0xFF80DEEA),
          black: Color(0xFF000000),
          white: Color(0xFFFFFFFF),
          error: Color(0xFFCF6679),
          textPrimary: Color(0xFFFFFFFF),
          textSecondary: Color(0xFFB0B0B0),
          primaryVariant: Color(0xFF90CAF9),
          accent: Color(0xFF80DEEA),
          background: Color(0xFF121212),
          surface: Color(0xFF121212),
          cardColor: Color(0xFF121212),
          success: Color(0xFF48BB78),
          warning: Color(0xFFED8936),
          info: Color(0xFF4299E1),
          primaryGradient: LinearGradient(
            colors: [Color(0xFF90CAF9), Color(0xFF80DEEA)],
          ),
          secondaryGradient: LinearGradient(
            colors: [Color(0xFF80DEEA), Color(0xFF90CAF9)],
          ),
        ),
        fontSize: NebuxFontSize.standard(),
        typography: NebuxTypography.standard(),
      ),
      home: const DesignSystemShowcase(),
    );
  }
}

class DesignSystemShowcase extends StatelessWidget {
  const DesignSystemShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.nebuxTheme;

    return Scaffold(
      backgroundColor: theme.colors.background,
      appBar: AppBar(
        title: Text(
          'NebuX Design System',
          style: theme.typography.heading.copyWith(
            color: theme.colors.textPrimary,
          ),
        ),
        backgroundColor: theme.colors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Component Showcase',
              style: theme.typography.heading.copyWith(
                color: theme.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 24),

            // App Bars Section
            _buildSection(
              context,
              'App Bars',
              'Navigation and header components',
              Icons.app_settings_alt,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppBarsShowcase(),
                ),
              ),
            ),

            // Theme Section
            _buildSection(
              context,
              'Theme & Colors',
              'Color palettes and typography',
              Icons.palette,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThemeShowcase()),
              ),
            ),

            // Utils Section
            _buildSection(
              context,
              'Utilities',
              'Helper components and utilities',
              Icons.build,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UtilsShowcase()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    final theme = context.nebuxTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: theme.colors.primary),
        title: Text(
          title,
          style: theme.typography.primaryAction.copyWith(
            color: theme.colors.textPrimary,
          ),
        ),
        subtitle: Text(
          description,
          style: theme.typography.content.copyWith(
            color: theme.colors.textSecondary,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: theme.colors.textSecondary,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}
