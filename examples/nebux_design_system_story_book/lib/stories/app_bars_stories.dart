import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class AppBarsShowcase extends StatelessWidget {
  const AppBarsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.nebuxTheme;

    return Scaffold(
      backgroundColor: theme.colors.scaffold,
      appBar: AppBar(
        title: Text(
          'App Bars',
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
              'App Bar Components',
              style: theme.typography.heading.copyWith(
                color: theme.colors.textPrimary,
              ),
            ),
            const SizedBox(height: 24),

            // NebuxAppBar Showcase
            _buildComponentCard(
              context,
              'NebuxAppBar',
              'Custom app bar with back button and centered title',
              const NebuxAppBar(),
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

            _buildUsageExample(context, 'Basic Usage', '''
// Import the component
import 'package:nebux_design_system/nebux_design_system.dart';

// Use in your app
Scaffold(
  appBar: NebuxAppBar(),
  body: YourContent(),
)
              '''),

            _buildUsageExample(context, 'Custom Title', '''
// The app bar automatically centers the title
// and provides a back button for navigation
NebuxAppBar()
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.colors.textSecondary.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: component,
            ),
          ],
        ),
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
                color: theme.colors.scaffold,
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
