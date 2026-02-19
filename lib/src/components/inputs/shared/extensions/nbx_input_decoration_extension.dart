part of 'export.dart';

extension NbxInputDecorationExtension on NbxInputParameters {
  NebuxTheme get _nbxTheme => context.nebuxTheme;

  /// Default border
  OutlineInputBorder _defaultBorder({Color? sideColor, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: width ?? .5,
        color: sideColor ?? Colors.transparent,
      ),
    );
  }

  /// Default focused border
  OutlineInputBorder _focusedDefaultBorder([Color? sideColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: sideColor ?? Colors.black, width: 1),
    );
  }

  InputDecoration get inputDecoration {
    // final decoration = this.decoration ?? const InputDecoration();
    return const InputDecoration().copyWith(
      hintText: hintText,
      counterText: '',
      labelText: decorationStyle.isOutlined ? null : labelText,
      errorMaxLines: 3,
      floatingLabelBehavior: decorationStyle.isFilled
          ? FloatingLabelBehavior.never
          : (floatingLabelBehavior ?? FloatingLabelBehavior.auto),

      labelStyle: _nbxTheme.typography.label.copyWith(
        // color: _nbxTheme.colors.textSecondary,
        color: _nbxTheme.colors.textSecondary.withValues(alpha: 0.5),
      ),
      floatingLabelStyle: _nbxTheme.typography.label.copyWith(
        color: _nbxTheme.colors.textSecondary,
      ),
      hintStyle: _nbxTheme.typography.content.copyWith(
        color: _nbxTheme.colors.textSecondary.withValues(alpha: 0.5),
      ),
      errorStyle: showErrorText
          ? _nbxTheme.typography.caption.copyWith(color: _nbxTheme.colors.error)
          // fontSize: 0.01 is a standard Flutter pattern to hide the error text visually
          // while preserving the reserved space below the field (avoids layout jumps).
          : const TextStyle(fontSize: 0.01, height: 0),
      filled: true,
      fillColor: fillColor ?? _nbxTheme.colors.background,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(),
      enabledBorder:
          enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: (_nbxTheme.colors.textSecondary).withValues(alpha: 0.2),
            ),
          ),
      border:
          border ??
          const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
      errorBorder:
          errorBorder ?? _defaultBorder(sideColor: _nbxTheme.colors.error),
      focusedBorder:
          focusedBorder ?? _focusedDefaultBorder(_nbxTheme.colors.black),
      focusedErrorBorder:
          focusedErrorBorder ??
          _defaultBorder(sideColor: _nbxTheme.colors.error, width: 1),
    );
  }
}
