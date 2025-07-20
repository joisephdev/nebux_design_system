import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class NebuxAppBar extends StatelessWidget {
  const NebuxAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.nebuxTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: theme.colors.textPrimary),
          ),
          Expanded(
            child: Text(
              'Settings',
              style: TextStyle(
                color: theme.colors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
