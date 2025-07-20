import 'package:flutter/material.dart';
import 'package:nebux_design_system_story_book/stories/app_bars_stories.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: AppBarsShowcase)
Widget buildCoolButtonUseCase(BuildContext context) {
  return const AppBarsShowcase();
}
