import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 174,
                width: double.infinity,
                color: AppColors.gray100,
                child: Image.asset(
                  "assets/images/test.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// Favorite Icon
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.favorite_border_outlined,
                  size: 20,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        TextHome(
          text: "Regular Fit Slogan",
          textStyle: AppTextStyles.body2SemiBold,
        ),

        TextHome(
          text: "\$ 1,190",
          textStyle:
              AppTextStyles.body3Medium.copyWith(color: AppColors.gray500),
        ),
      ],
    );
  }
}