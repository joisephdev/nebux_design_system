import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebux_core/nebux_core.dart';
import 'screens/home_screen.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(const NebuxCoreExampleApp());
}

/// Main example application demonstrating NebuX Core design system
class NebuxCoreExampleApp extends StatelessWidget {
  const NebuxCoreExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'NebuX Core Example',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            home: FutureBuilder(
              future: themeProvider.initializeTheme(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ThemeLoadingScreen();
                }
                return const HomeScreen();
              },
            ),
          );
        },
      ),
    );
  }
}

/// Loading screen shown while theme is being initialized
class ThemeLoadingScreen extends StatelessWidget {
  const ThemeLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final typography = themeProvider.currentTypography;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            heightSpace16,
            Text(
              'Loading NebuX Core...',
              style: typography.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
