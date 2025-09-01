part of 'export.dart';

extension NbxInputDecorationExtension on NbxInputParameters {
  NebuxTheme get _nbxTheme => context.nebuxTheme;

  /// Default border
  OutlineInputBorder _defaultBorder([Color? sideColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: .5, color: sideColor ?? Colors.transparent),
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
    final decoration = this.decoration ?? const InputDecoration();
    return decoration.copyWith(
      hintText: hintText,
      counterText: '',
      labelText: formType.isOutlined ? null : labelText,
      errorMaxLines: 3,
      floatingLabelBehavior: formType.isOutlined
          ? (floatingLabelBehavior ?? FloatingLabelBehavior.auto)
          : null,
      labelStyle: _nbxTheme.typography.label.copyWith(
        color: _nbxTheme.colors.textSecondary,
      ),
      hintStyle: _nbxTheme.typography.label.copyWith(
        color: _nbxTheme.colors.textSecondary,
      ),
      errorStyle: _nbxTheme.typography.caption.copyWith(
        color: _nbxTheme.colors.error,
      ),
      filled: true,
      fillColor: _nbxTheme.colors.surface,
      // fillColor: Colors.white,
      suffixIcon: suffixIcon,
      // suffixIcon: Icon(Icons.ac_unit_rounded),
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(),
      // counter: const Text(""),
      // disabledBorder: _borderDefault(),
      enabledBorder: _defaultBorder(_nbxTheme.colors.black),
      focusedBorder: _focusedDefaultBorder(_nbxTheme.colors.black),
      focusedErrorBorder: _defaultBorder(_nbxTheme.colors.error),
      errorBorder: _defaultBorder(_nbxTheme.colors.error),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        // borderSide: BorderSide.none,
      ),
    );
  }
}
