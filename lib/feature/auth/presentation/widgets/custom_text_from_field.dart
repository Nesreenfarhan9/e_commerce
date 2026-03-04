import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.controller,
    required this.hintText,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleVisibility,
    required this.validation,
  });
  final TextEditingController? controller;
  final String hintText;
  final bool isPassword;
  final  bool obscureText;
  final VoidCallback? onToggleVisibility;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validation,

      decoration: InputDecoration(
        hintText: hintText,

        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.gray400,
                ),
                onPressed: onToggleVisibility,
              )
            : null,

        hintStyle: AppTextStyles.body1Regular.copyWith(
          color: AppColors.gray500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.gray100),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.gray100),
          borderRadius: BorderRadius.circular(10),
        ),
          errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.gray100),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
