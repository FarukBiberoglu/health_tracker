import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:penta_core/penta_core.dart';

class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          context.ext.theme.isDark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
      child: SafeArea(child: child),
    );
  }
}
