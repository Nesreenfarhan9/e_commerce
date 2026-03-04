import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_router.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/feature/auth/data/models/forget_password_request.dart';
import 'package:flutter_application_1/feature/auth/logic/authCubit/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/text_auth_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const CustomLoading(),
          );
        }

        if (state is ForgetPasswordSuccess) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          context.go(AppRouter.digitCode, extra: emailController.text.trim());
        }

        if (state is ForgetPasswordFailure) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 50, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                SizedBox(height: 3),

                TextAuthScreen(
                  text: "Forgot password",
                  textStyle: AppTextStyles.body8SemiBold,
                ),
                TextAuthScreen(
                  text:
                      "Enter your email for the verification \nprocess. We will send 6 digits code to your email.",
                  textStyle: AppTextStyles.body6Regular,
                ),
                SizedBox(height: 20),
                TextAuthScreen(
                  text: "Email",
                  textStyle: AppTextStyles.body1Medium,
                ),
                SizedBox(height: 3),

                CustomTextFormField(
                  hintText: "Enter your email address",
                  controller: emailController,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }

                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    if (RegExp(r"[\u0600-\u06FF]").hasMatch(value)) {
                      return "English characters only";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: "Send Code",
                  background: AppColors.black,
                  colorText: AppColors.white,
                  pressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().forgetPassword(
                        ForgetPasswordRequest(
                          email: emailController.text.trim(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
