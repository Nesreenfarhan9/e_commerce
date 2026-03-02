import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_router.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/digit_code_text_field.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/text_auth_screen.dart';
import 'package:go_router/go_router.dart';

class DigitCodeScreenBody extends StatefulWidget {
  const DigitCodeScreenBody({super.key});

  @override
  State<DigitCodeScreenBody> createState() => _DigitCodeScreenBodyState();
}

class _DigitCodeScreenBodyState extends State<DigitCodeScreenBody> {
  
    final _formKey = GlobalKey<FormState>();
    String? validation(String? value) {
    if (value == null || value.isEmpty) {
      return ' enter number';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back, color: AppColors.black, weight: 20),
            SizedBox(height: 3),

            TextAuthScreen(
              text: "Enter 4 Digit Code",
              textStyle: AppTextStyles.body8SemiBold,
            ),
            TextAuthScreen(
              text:
                  "Enter 4 digit code that your receive on \n your email (cody.fisher45@example.com).",
              textStyle: AppTextStyles.body6Regular,
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DigitCodeTextField(hintText: "", validation: validation),
                 DigitCodeTextField(hintText: "", validation: validation),
                  DigitCodeTextField(hintText: "", validation: validation),
                   DigitCodeTextField(hintText: "", validation: validation),
              ],
            ),
            SizedBox(height: 30,),
              CustomButton(
              text: "Continue",
              background: AppColors.black,
              colorText: AppColors.white,
              pressed: () {
                if (_formKey.currentState!.validate()) {
                   context.push(AppRouter.resetPassword);
                }})
            
          ])
            ));}}
  
