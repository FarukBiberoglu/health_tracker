import 'package:calory_tool/core/configs/theme/i_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    super.key,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.hintText,
  });

  final String? hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String value)? onChanged;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: context.appThemeExt.appColors.grey),
      borderRadius: AppValues.lg.ext.radius.border.all,
    );
    return TextField(
      onTapUpOutside: (_) => FocusScope.of(context).unfocus(),
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      style: context.ext.theme.textTheme.bodyLarge?.copyWith(
        color:
            context.appThemeExt.appColors.white
                .byBrightness(context.ext.theme.isDark)
                .onColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: context.appThemeExt.appColors.white.byBrightness(
          context.ext.theme.isDark,
        ),
        border: border,
        errorBorder: border.copyWith(
          borderSide: BorderSide(
            color: context.appThemeExt.appColors.error.byBrightness(
              context.ext.theme.isDark,
            ),
          ),
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: context.appThemeExt.appColors.grey),
        ),
        disabledBorder: border.copyWith(
          borderSide: BorderSide(
            color: context.appThemeExt.appColors.lightGrey,
          ),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(
            color: context.appThemeExt.appColors.error.byBrightness(
              context.ext.theme.isDark,
            ),
          ),
        ),
        iconColor:
            context.appThemeExt.appColors.white
                .byBrightness(context.ext.theme.isDark)
                .onColor,
        prefixIconColor:
            context.appThemeExt.appColors.white
                .byBrightness(context.ext.theme.isDark)
                .onColor,
        suffixIconColor:
            context.appThemeExt.appColors.white
                .byBrightness(context.ext.theme.isDark)
                .onColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
