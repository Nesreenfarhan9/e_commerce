import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class EmptySearchScreen extends StatelessWidget {
   EmptySearchScreen({super.key});
    final TextEditingController SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        children: [
          
          TextHome(text: "Search", textStyle: AppTextStyles.header2),
          SizedBox(height: 20,),

           CustomTextFromField(hintText: "Search for clothes...",validation:(e){} ,controller: SearchController,),

          const Spacer(),

          Image.asset("assets/images/search.png", height: 110),

          TextHome(text: "No Results Found!", textStyle: AppTextStyles.header3),

          const SizedBox(height: 8),

          Text(
            "Try a similar word or something\n more general.",
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