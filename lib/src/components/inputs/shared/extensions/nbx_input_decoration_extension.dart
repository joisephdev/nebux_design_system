part of 'export.dart';

extension NbxInputDecorationExtension on NbxInputParameters {
  NebuxTheme get _nbxTheme => context.nebuxTheme;

  OutlineInputBorder _borderDefault([Color? sideColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(width: .5, color: sideColor ?? Colors.transparent),
    );
  }

  InputDecoration get inputDecoration {
    final decoration = this.decoration ?? const InputDecoration();
    return decoration.copyWith(
      hintText: hintText,
      counterText: '',
      labelText: labelText,
      errorMaxLines: 3,
      floatingLabelBehavior:
          floatingLabelBehavior ?? FloatingLabelBehavior.auto,
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
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      // suffixIcon: Icon(Icons.ac_unit_rounded),
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(),
      // counter: const Text(""),
      // disabledBorder: _borderDefault(),
      enabledBorder: _borderDefault(_nbxTheme.colors.black),
      focusedBorder: _borderDefault(_nbxTheme.colors.black),
      focusedErrorBorder: _borderDefault(_nbxTheme.colors.error),
      errorBorder: _borderDefault(_nbxTheme.colors.error),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        // borderSide: BorderSide.none,
      ),
    );
  }
}
