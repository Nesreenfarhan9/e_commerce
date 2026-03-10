import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';

class CustomTextFromField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;

  final String? Function(String?)? validation;

  const CustomTextFromField({
    super.key,
    this.controller,
    required this.hintText,
    this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      validator: validation,

      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.search, color: AppColors.gray400),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),

        hintStyle: AppTextStyles.body6Regular,

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
