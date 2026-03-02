import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.text,
    this.pathIcon,
    required this.background,
    required this.colorText,
    required this.pressed,
    this.colorBorder
  });
  final String text;
  final String? pathIcon;
  final Color background;
  final Color colorText;
  final VoidCallback pressed;
  final Color ?colorBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: background,
          border: Border.all(color: AppColors.gray200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          if (pathIcon != null) ...[
              SvgPicture.asset(
                pathIcon!,
                width: 18,
                height: 18,
              ),
              const SizedBox(width: 8),
            ],
           

            Text(
              text,
              style: AppTextStyles.header4Medium.copyWith(color: colorText),
            ),
          ],
        ),
      ),
    );
  }
}
