import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    required this.text,
    required this.onTap,
    required this.isSelect,
  });

  final String text;
  final bool isSelect;
  final VoidCallback? onTap;
  @override
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        backgroundColor: isSelect ? AppColors.black : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: AppColors.gray200),
        ),
      ),

      child: TextHome(
        text: text,

        textStyle: AppTextStyles.body2Medium.copyWith(
          color: isSelect ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
