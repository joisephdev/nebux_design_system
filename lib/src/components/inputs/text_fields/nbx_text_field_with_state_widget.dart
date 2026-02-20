import 'package:flutter/material.dart';
import 'package:nebux_design_system/nebux_design_system.dart';

class NbxTextFieldWithStateWidget extends StatefulWidget {
  final NbxInputParameters parameters;
  final Widget Function(NbxInputParameters) childBuilder;

  const NbxTextFieldWithStateWidget({
    required this.parameters,
    required this.childBuilder,
    super.key,
  });

  @override
  State<NbxTextFieldWithStateWidget> createState() =>
      _NbxTextFieldWithStateWidgetState();
}

class _NbxTextFieldWithStateWidgetState
    extends State<NbxTextFieldWithStateWidget> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.parameters.obscureText;
  }

  @override
  void dispose() {
    if (_parameters.autoDisposeController) {
      _parameters.controller?.dispose();
    }
    super.dispose();
  }

  NbxInputParameters get _parameters {
    return widget.parameters.copyWith(
      obscureText: _obscureText,
      suffixIcon: widget.parameters.buildSuffixIcon(
        obscureText: _obscureText,
        onTap: _handleHidePassword,
      ),
    );
  }

  void _handleHidePassword() {
    if (_parameters.suffixIconType == NbxSuffixIconType.eye) {
      setState(() => _obscureText = !_obscureText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.childBuilder.call(_parameters);
  }
}
