import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class EmptyItemSaved extends StatelessWidget {
  const EmptyItemSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        children: [
          TextHome(text: "Saved Items", textStyle: AppTextStyles.header2),

          const Divider(),

          const Spacer(),

          Image.asset("assets/images/Heart-duotone.png", height: 110),

          TextHome(text: "No Saved Items!", textStyle: AppTextStyles.header3),

          const SizedBox(height: 8),

          Text(
            "You don’t have any saved\n items. Go to home and add\n some.",
            textAlign: TextAlign.center,
            style: AppTextStyles.body6Regular.copyWith(
              color: AppColors.gray500,
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
