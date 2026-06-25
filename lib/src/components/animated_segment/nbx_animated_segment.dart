import 'package:flutter/material.dart';
import 'package:nebux_design_system/src/components/animated_segment/config/nbx_animated_segment_defaults.dart';
import 'package:nebux_design_system/src/components/animated_segment/config/nbx_animated_segment_style.dart';
import 'package:nebux_design_system/src/components/animated_segment/nbx_animated_segment_theme.dart';

/// Generic animated segmented control with a sliding pill over a track.
///
/// Pair with [NbxAnimatedSegmentTheme] or pass [theme] for design-system
/// integration. When no inherited theme is provided, [NbxAnimatedSegmentTheme.of]
/// resolves [NebuxTheme] tokens automatically when available.
class NbxAnimatedSegment<T> extends StatelessWidget {
  /// Segment values in display order [List<T>].
  final List<T> values;

  /// Currently selected value [T].
  final T selectedValue;

  /// Callback when a segment is tapped [ValueChanged<T>].
  final ValueChanged<T> onChanged;

  /// Builds the label for each segment value [String Function(T)].
  final String Function(T value) labelBuilder;

  /// Optional per-value enable check; defaults to always enabled.
  final bool Function(T value)? isEnabled;

  /// Visual geometry and color overrides [NbxAnimatedSegmentStyle].
  final NbxAnimatedSegmentStyle style;

  /// Optional theme override; falls back to [NbxAnimatedSegmentTheme.of].
  final NbxAnimatedSegmentThemeData? theme;

  /// Creates a [NbxAnimatedSegment] instance.
  ///
  /// @param values: Segment values in display order [List<T>].
  /// @param selectedValue: Currently selected value [T].
  /// @param onChanged: Segment tap callback [ValueChanged<T>].
  /// @param labelBuilder: Label builder for each value [String Function(T)].
  /// @param isEnabled: Optional enable check per value [bool Function(T)?].
  /// @param style: Visual style configuration [NbxAnimatedSegmentStyle].
  /// @param theme: Optional theme override [NbxAnimatedSegmentThemeData?].
  const NbxAnimatedSegment({
    super.key,
    required this.values,
    required this.selectedValue,
    required this.onChanged,
    required this.labelBuilder,
    this.isEnabled,
    this.style = const NbxAnimatedSegmentStyle.inset(),
    this.theme,
  });

  /// Forwards the selected segment value to [onChanged].
  ///
  /// @param value: Tapped segment value [T].
  void _onSegmentSelected(T value) {
    onChanged(value);
  }

  /// Resolves [Alignment] for the sliding pill at [index].
  ///
  /// @param index: Selected segment index [int].
  /// @param count: Total segment count [int].
  ///
  /// @returns: Alignment for [AnimatedAlign] [Alignment].
  Alignment _alignmentForIndex(int index, int count) {
    if (count <= 1) {
      return Alignment.center;
    }

    final step = 2 / (count - 1);
    return Alignment(-1 + index * step, 0);
  }

  /// Builds the outer track decoration from resolved style tokens.
  ///
  /// @param resolvedStyle: Resolved visual style [NbxResolvedAnimatedSegmentStyle].
  ///
  /// @returns: Track box decoration [BoxDecoration].
  BoxDecoration _trackDecoration(NbxResolvedAnimatedSegmentStyle resolvedStyle) {
    return BoxDecoration(
      color: resolvedStyle.trackColor,
      borderRadius: BorderRadius.circular(resolvedStyle.trackBorderRadius),
      border: resolvedStyle.trackBorderColor == null
          ? null
          : Border.all(
              color: resolvedStyle.trackBorderColor!,
              width: resolvedStyle.trackBorderWidth,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(values.isNotEmpty, 'values must not be empty');
    assert(
      values.contains(selectedValue),
      'selectedValue must be one of values',
    );

    final themeData = theme ?? NbxAnimatedSegmentTheme.of(context);
    final resolvedStyle = style.resolve(themeData);
    final selectedIndex = values.indexOf(selectedValue);

    return _buildTrack(
      resolvedStyle: resolvedStyle,
      child: _buildSegmentStack(
        themeData: themeData,
        resolvedStyle: resolvedStyle,
        selectedIndex: selectedIndex,
      ),
    );
  }

  /// Builds the outer track container and fixed-height content slot.
  ///
  /// @param resolvedStyle: Resolved visual style [NbxResolvedAnimatedSegmentStyle].
  /// @param child: Track content [Widget].
  ///
  /// @returns: Track shell [Widget].
  Widget _buildTrack({
    required NbxResolvedAnimatedSegmentStyle resolvedStyle,
    required Widget child,
  }) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(resolvedStyle.trackPadding),
      decoration: _trackDecoration(resolvedStyle),
      child: SizedBox(
        height: NbxAnimatedSegmentDefaults.trackHeight,
        child: child,
      ),
    );
  }

  /// Builds the sliding pill layered behind the segment option row.
  ///
  /// @param themeData: Theme tokens [NbxAnimatedSegmentThemeData].
  /// @param resolvedStyle: Resolved visual style [NbxResolvedAnimatedSegmentStyle].
  /// @param selectedIndex: Index of the selected segment [int].
  ///
  /// @returns: Pill and options stack [Widget].
  Widget _buildSegmentStack({
    required NbxAnimatedSegmentThemeData themeData,
    required NbxResolvedAnimatedSegmentStyle resolvedStyle,
    required int selectedIndex,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildSlidingPill(
          themeData: themeData,
          resolvedStyle: resolvedStyle,
          selectedIndex: selectedIndex,
        ),
        _buildSegmentOptionsRow(
          themeData: themeData,
          resolvedStyle: resolvedStyle,
        ),
      ],
    );
  }

  /// Builds the animated selected pill indicator.
  ///
  /// @param themeData: Theme tokens [NbxAnimatedSegmentThemeData].
  /// @param resolvedStyle: Resolved visual style [NbxResolvedAnimatedSegmentStyle].
  /// @param selectedIndex: Index of the selected segment [int].
  ///
  /// @returns: Animated pill widget [Widget].
  Widget _buildSlidingPill({
    required NbxAnimatedSegmentThemeData themeData,
    required NbxResolvedAnimatedSegmentStyle resolvedStyle,
    required int selectedIndex,
  }) {
    return AnimatedAlign(
      duration: themeData.animationDuration,
      curve: Curves.easeOutCubic,
      alignment: _alignmentForIndex(selectedIndex, values.length),
      child: FractionallySizedBox(
        widthFactor: 1 / values.length,
        heightFactor: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: resolvedStyle.selectedColor,
            borderRadius: BorderRadius.circular(
              resolvedStyle.selectedBorderRadius,
            ),
            boxShadow: resolvedStyle.selectedShadow,
          ),
        ),
      ),
    );
  }

  /// Builds the row of tappable segment options.
  ///
  /// @param themeData: Theme tokens [NbxAnimatedSegmentThemeData].
  /// @param resolvedStyle: Resolved visual style [NbxResolvedAnimatedSegmentStyle].
  ///
  /// @returns: Segment options row [Widget].
  Widget _buildSegmentOptionsRow({
    required NbxAnimatedSegmentThemeData themeData,
    required NbxResolvedAnimatedSegmentStyle resolvedStyle,
  }) {
    return Row(
      children: values.map((value) {
        final enabled = isEnabled?.call(value) ?? true;

        return Expanded(
          child: _buildSegmentOption(
            themeData: themeData,
            resolvedStyle: resolvedStyle,
            label: labelBuilder(value),
            isSelected: value == selectedValue,
            isEnabled: enabled,
            onTap: () => _onSegmentSelected(value),
          ),
        );
      }).toList(),
    );
  }

  /// Builds a tappable label for one segment option.
  ///
  /// @param themeData: Theme tokens [NbxAnimatedSegmentThemeData].
  /// @param resolvedStyle: Resolved visual style [NbxResolvedAnimatedSegmentStyle].
  /// @param label: Segment label [String].
  /// @param isSelected: Whether this option is selected [bool].
  /// @param isEnabled: Whether this option accepts taps [bool].
  /// @param onTap: Tap callback [VoidCallback].
  ///
  /// @returns: Segment label widget [Widget].
  Widget _buildSegmentOption({
    required NbxAnimatedSegmentThemeData themeData,
    required NbxResolvedAnimatedSegmentStyle resolvedStyle,
    required String label,
    required bool isSelected,
    required bool isEnabled,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: isEnabled ? onTap : null,
      child: Opacity(
        opacity: !isEnabled && !isSelected ? themeData.disabledOpacity : 1,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: NbxAnimatedSegmentDefaults.optionHorizontalPadding,
          ),
          child: _buildSegmentLabel(
            themeData: themeData,
            resolvedStyle: resolvedStyle,
            label: label,
            isSelected: isSelected,
          ),
        ),
      ),
    );
  }

  /// Builds the animated label text for one segment option.
  ///
  /// @param themeData: Theme tokens [NbxAnimatedSegmentThemeData].
  /// @param resolvedStyle: Resolved visual style [NbxResolvedAnimatedSegmentStyle].
  /// @param label: Segment label [String].
  /// @param isSelected: Whether this option is selected [bool].
  ///
  /// @returns: Animated segment label [Widget].
  Widget _buildSegmentLabel({
    required NbxAnimatedSegmentThemeData themeData,
    required NbxResolvedAnimatedSegmentStyle resolvedStyle,
    required String label,
    required bool isSelected,
  }) {
    return AnimatedDefaultTextStyle(
      duration: themeData.animationDuration,
      curve: Curves.easeOutCubic,
      style: resolvedStyle.labelStyle(themeData, isSelected: isSelected),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label,
          maxLines: 1,
          textAlign: TextAlign.center,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        ),
      ),
    );
  }
}
