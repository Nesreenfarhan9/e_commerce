import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_router.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/feature/auth/data/models/auth_request/login_request.dart';
import 'package:flutter_application_1/feature/auth/logic/authCubit/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/text_auth_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const CustomLoading(),
            );
          }

          if (state is LoginSuccess) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            context.go(AppRouter.homePage);
          }

          if (state is LoginFailure) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },

        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextAuthScreen(
                  text: "Login to your account",
                  textStyle: AppTextStyles.header1,
                ),
                TextAuthScreen(
                  text: "It’s great to see you again.",
                  textStyle: AppTextStyles.body2Regular,
                ),
                SizedBox(height: 10),
                TextAuthScreen(
                  text: "Email",
                  textStyle: AppTextStyles.body1Medium,
                ),

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
                SizedBox(height: 10),

                TextAuthScreen(
                  text: "Password",
                  textStyle: AppTextStyles.body1Medium,
                ),

                CustomTextFormField(
                  hintText: "Enter your password",
                  controller: passwordController,
                  obscureText: obscureText,
                  isPassword: true,
                  onToggleVisibility: () {
                    setState(() {
                      obscureText = !obscureText;
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: RichText(
                    text: TextSpan(
                      text: "Forgot your password? ",
                      style: AppTextStyles.body2Regular,
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push(AppRouter.forgetPassword);
                            },
                          text: " Reset your password",
                          style: AppTextStyles.body2Regular.copyWith(
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Login",
                  background: AppColors.gray200,
                  colorText: AppColors.white,
                  pressed: () {
                    if (key.currentState!.validate()) {
                      context.read<AuthCubit>().login(
                        LoginRequest(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.gray100, thickness: 2),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text("Or", style: AppTextStyles.body2Regular),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.gray100, thickness: 2),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                CustomButton(
                  text: "Sign Up with Google",
                  pathIcon: "assets/icons/logos_google-icon.svg",
                  background: AppColors.white,
                  colorText: AppColors.black,
                  pressed: () {},
                ),

                SizedBox(height: 20),
                CustomButton(
                  text: "Sign Up with Facebook",
                  pathIcon: "assets/icons/logos_facebook.svg",
                  background: AppColors.blue,
                  colorText: AppColors.white,
                  pressed: () {},
                ),
                SizedBox(height: 150),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: AppTextStyles.body2Regular.copyWith(
                        color: AppColors.gray500,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push(AppRouter.signUp);
                            },
                          text: " Join",
                          style: AppTextStyles.body2Regular.copyWith(
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
