import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class ItemSaveBody extends StatelessWidget {
  const ItemSaveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Column(
      
        children: [
        TextHome(text: "TextHome", textStyle: AppTextStyles.header1),
        Image.asset("assets/images/Heart-duotone.png"),
         TextHome(text: "No Saved Items!", textStyle: AppTextStyles.header1),
          TextHome(text: "You don’t have any saved items. Go to home and add some.", textStyle: AppTextStyles.body2Regular.copyWith(color: AppColors.gray500)),
        
      ],),
    );
  }
}