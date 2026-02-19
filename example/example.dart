import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NbxScaffold(
      widgetName: 'ExampleScreen',
      appBarConfig: AppBarConfig(title: 'Nebux Design System'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Welcome', style: context.nebuxTypography.heading),
            heightSpace16,
            NbxButton(
              text: 'Filled Button',
              onPressed: () {},
              styleConfig: ButtonStyleConfig(variant: ButtonVariant.filled),
            ),
            heightSpace12,
            NbxButton(
              text: 'Outline Button',
              onPressed: () {},
              styleConfig: ButtonStyleConfig(variant: ButtonVariant.outline),
            ),
            heightSpace16,
            Builder(
              builder: (ctx) => NbxTextFieldWidget(
                NbxInputParameters(
                  context: ctx,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  inputType: NbxInputType.email,
                  isRequired: true,
                  requiredErrorMessage: 'Email is required',
                ),
              ),
            ),
            heightSpace12,
            Builder(
              builder: (ctx) => NbxTextFieldWidget(
                NbxInputParameters(
                  context: ctx,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  inputType: NbxInputType.password,
                  suffixIconType: NbxSuffixIconType.eye,
                  isRequired: true,
                  requiredErrorMessage: 'Password is required',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
