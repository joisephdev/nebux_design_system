import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      theme: NebuxTheme.createThemeData(
        isDark: false,
        colors: NebuxColors.standardLight(),
        fontSize: NebuxFontSize.standard(),
        typography: NebuxTypography.custom('Roboto', null),
      ),
      darkTheme: NebuxTheme.createThemeData(
        isDark: true,
        colors: NebuxColors.standardDark(),
        fontSize: NebuxFontSize.standard(),
        typography: NebuxTypography.custom('Roboto', null),
      ),
      home: ExampleScreen(onToggleTheme: _toggleTheme),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const ExampleScreen({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return NbxScaffold(
      widgetName: 'ExampleScreen',
      appBarConfig: AppBarConfig(
        title: 'Nebux Design System',
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // -- Typography roles --
            Text('Typography Roles', style: context.nebuxTypography.heading),
            heightSpace8,
            Text('Section header', style: context.nebuxTypography.section),
            heightSpace4,
            Text(
              'Content text for articles and descriptions.',
              style: context.nebuxTypography.content,
            ),
            heightSpace4,
            Text(
              'Paragraph text for default body content.',
              style: context.nebuxTypography.paragraph,
            ),
            heightSpace4,
            Text('Caption / metadata', style: context.nebuxTypography.caption),
            heightSpace4,
            Text('Label text', style: context.nebuxTypography.label),
            heightSpace24,

            // -- Button variants --
            Text('Button Variants', style: context.nebuxTypography.heading),
            heightSpace12,
            NbxButton(
              text: 'Filled Button',
              onPressed: () {},
              styleConfig:
                  const ButtonStyleConfig(variant: ButtonVariant.filled),
            ),
            heightSpace8,
            NbxButton(
              text: 'Outline Button',
              onPressed: () {},
              styleConfig:
                  const ButtonStyleConfig(variant: ButtonVariant.outline),
            ),
            heightSpace8,
            NbxButton(
              text: 'Text Button',
              onPressed: () {},
              styleConfig:
                  const ButtonStyleConfig(variant: ButtonVariant.text),
            ),
            heightSpace8,
            NbxButton(
              text: 'Danger Button',
              onPressed: () {},
              styleConfig:
                  const ButtonStyleConfig(variant: ButtonVariant.danger),
            ),
            heightSpace24,

            // -- Text fields with validation --
            Text('Text Fields', style: context.nebuxTypography.heading),
            heightSpace12,
            NbxTextFieldWidget(
              NbxInputParameters(
                hintText: 'Enter your email',
                labelText: 'Email',
                inputType: NbxInputType.email,
                isRequired: true,
                requiredErrorMessage: 'Email is required',
              ),
            ),
            heightSpace12,
            NbxTextFieldWidget(
              NbxInputParameters(
                hintText: 'Enter your password',
                labelText: 'Password',
                inputType: NbxInputType.password,
                suffixIconType: NbxSuffixIconType.eye,
                isRequired: true,
                requiredErrorMessage: 'Password is required',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
