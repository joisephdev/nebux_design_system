import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class NebuxAppBar extends StatelessWidget {
  final Widget? iconBack;
  const NebuxAppBar({super.key, this.iconBack});

  @override
  Widget build(BuildContext context) {
    final theme = context.nebuxTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon:
                    iconBack ??
                    Icon(Icons.arrow_back, color: theme.colors.textPrimary),
              ),
            ),
            Text(
              'Settings',
              style: TextStyle(
                color: theme.colors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        // Drag handle
        Container(
          width: 40,
          height: 4,
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
