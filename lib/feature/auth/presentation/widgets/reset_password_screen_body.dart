import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/reset_password_success_dialog.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/text_auth_screen.dart';

class ResetPasswordScreenBody extends StatefulWidget {
  const ResetPasswordScreenBody({super.key});

  @override
  State<ResetPasswordScreenBody> createState() =>
      _ResetPasswordScreenBodyState();
}

class _ResetPasswordScreenBodyState extends State<ResetPasswordScreenBody> {
  final _formKey = GlobalKey<FormState>();
  bool obscurepassword= true;
  bool obscureConfirmPassword = true;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 50, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                  weight: 20,
                ),
              ),
              SizedBox(height: 3),

              TextAuthScreen(
                text: "Reset Password",
                textStyle: AppTextStyles.body8SemiBold,
              ),
              TextAuthScreen(
                text:
                    "Set the new password for your account so you can login and access all the features.",
                textStyle: AppTextStyles.body6Regular,
              ),
              SizedBox(height: 10),

              TextAuthScreen(
                text: "Password",
                textStyle: AppTextStyles.body1Regular.copyWith(
                  color: AppColors.black,
                ),
              ),
              CustomTextFormField(
                controller: passwordController,
                hintText: "Enter your password",
                obscureText: obscurepassword,
                isPassword: true,
                onToggleVisibility: () {
                  setState(() {
                    obscurepassword = !obscurepassword;
                  });
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  if (RegExp(r"[\u0600-\u06FF]").hasMatch(value)) {
                    return "English characters only";
                  }

                  return null;
                },
              ),

              SizedBox(height: 30),

              TextAuthScreen(
                text: "Confirm Password",
                textStyle: AppTextStyles.body1Regular.copyWith(
                  color: AppColors.black,
                ),
              ),
              CustomTextFormField(
                controller: confirmPasswordController,
                hintText: "Enter your password",
                obscureText: obscureConfirmPassword,
                isPassword: true,
                onToggleVisibility: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return " confirm Password is required";
                  }
                  if (value.trim()!= passwordController.text.trim()) {
                    return "Passwords do not match";
                  }

                  return null;
                },
              ),

              SizedBox(height: 40),
              CustomButton(
                text: "Continue",
                background: AppColors.black,
                colorText: AppColors.white,
                pressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (_) => const ResetPasswordSuccessDialog(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
