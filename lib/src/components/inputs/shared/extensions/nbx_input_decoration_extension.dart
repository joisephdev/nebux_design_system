part of 'export.dart';

/// Extension that builds [InputDecoration] from [NbxInputParameters].
extension NbxInputDecorationExtension on NbxInputParameters {
  OutlineInputBorder _defaultBorder({Color? sideColor, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: width ?? .5,
        color: sideColor ?? Colors.transparent,
      ),
    );
  }

  OutlineInputBorder _focusedDefaultBorder(Color sideColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: sideColor, width: 1),
    );
  }

  /// Builds the [InputDecoration] for text input widgets based on theme and parameters.
  InputDecoration inputDecoration(BuildContext context) {
    final nbxTheme = context.nebuxTheme;

    // Resolve enabled border based on input state
    final InputBorder resolvedEnabledBorder = _resolveEnabledBorder(nbxTheme);

    // Resolve suffix icon: success state adds a check icon if no custom suffix
    final Widget? resolvedSuffixIcon = _resolveSuffixIcon(nbxTheme);

    return const InputDecoration().copyWith(
      hintText: hintText,
      counterText: showCharacterCounter ? null : '',
      labelText: decorationStyle.isOutlined ? null : labelText,
      helperText: helperText,
      helperMaxLines: 2,
      helperStyle: nbxTheme.typography.caption.copyWith(
        color: nbxTheme.colors.textSecondary.withValues(alpha: 0.7),
      ),
      errorMaxLines: 3,
      floatingLabelBehavior: decorationStyle.isFilled
          ? FloatingLabelBehavior.never
          : (floatingLabelBehavior ?? FloatingLabelBehavior.auto),

      labelStyle: nbxTheme.typography.label.copyWith(
        color: nbxTheme.colors.textSecondary.withValues(alpha: 0.5),
      ),
      floatingLabelStyle: nbxTheme.typography.label.copyWith(
        color: nbxTheme.colors.textSecondary,
      ),
      hintStyle: nbxTheme.typography.content.copyWith(
        color: nbxTheme.colors.textSecondary.withValues(alpha: 0.5),
      ),
      errorStyle: showErrorText
          ? nbxTheme.typography.caption.copyWith(color: nbxTheme.colors.error)
          : const TextStyle(fontSize: 0.01, height: 0),
      filled: true,
      fillColor: fillColor ?? nbxTheme.colors.background,
      suffixIcon: resolvedSuffixIcon,
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(),
      enabledBorder:
          enabledBorder ?? resolvedEnabledBorder,
      border:
          border ??
          const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
      errorBorder:
          errorBorder ?? _defaultBorder(sideColor: nbxTheme.colors.error),
      focusedBorder:
          focusedBorder ?? _focusedDefaultBorder(nbxTheme.colors.focus),
      focusedErrorBorder:
          focusedErrorBorder ??
          _defaultBorder(sideColor: nbxTheme.colors.error, width: 1),
    );
  }

  /// Resolves the enabled border based on input state.
  InputBorder _resolveEnabledBorder(NebuxTheme nbxTheme) {
    if (inputState == NbxInputState.success) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: nbxTheme.colors.success),
      );
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: (nbxTheme.colors.textSecondary).withValues(alpha: 0.2),
      ),
    );
  }

  /// Resolves the suffix icon, adding a success check icon when appropriate.
  Widget? _resolveSuffixIcon(NebuxTheme nbxTheme) {
    if (suffixIcon != null) return suffixIcon;

    if (inputState == NbxInputState.success) {
      return Icon(Icons.check_circle_outline, color: nbxTheme.colors.success);
    }

    return null;
  }
}
