import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class ItemSaveBody extends StatelessWidget {
  const ItemSaveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 270, left: 90),
      child: Column(
        children: [
          TextHome(text: "Saved Items", textStyle: AppTextStyles.header2),
          Image.asset("assets/images/Heart-duotone.png"),
          TextHome(text: "No Saved Items!", textStyle: AppTextStyles.header2),
          TextHome(
            text: "You don’t have any saved items.\n Go to home and add some.",
            textStyle: AppTextStyles.body2Regular.copyWith(
              color: AppColors.gray500,
            ),
          ),
        ],
      ),
    );
  }
}
