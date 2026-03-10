import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_router.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/feature/auth/data/models/auth_request/sign_up_request.dart';
import 'package:flutter_application_1/feature/auth/logic/authCubit/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/text_auth_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscureText = true;
  final key = GlobalKey<FormState>();
  bool showConfirm = false;
  bool obscureConfirmText = true;
  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {
        showConfirm = passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const CustomLoading(),
          );
        }

        if (state is SignUpSuccess) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          context.go(AppRouter.login);
        }

        if (state is SignUpFailure) {
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
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextAuthScreen(
                  text: "Create an account",
                  textStyle: AppTextStyles.header1,
                ),
                TextAuthScreen(
                  text: "Let’s create your account.",
                  textStyle: AppTextStyles.body1Regular.copyWith(
                    color: AppColors.gray500,
                  ),
                ),
                SizedBox(height: 10),
                TextAuthScreen(
                  text: "Full Name",
                  textStyle: AppTextStyles.body9Medium,
                ),
                CustomTextFormField(
                  hintText: "Enter your full name",
                  controller: nameController,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Full name is required";
                    }
                    if (value.length < 3) {
                      return "Name must be at least 3 characters";
                    }
                    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return "Name must contain English letters only";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextAuthScreen(
                  text: "Email",
                  textStyle: AppTextStyles.body9Medium,
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
                  textStyle: AppTextStyles.body9Medium,
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
                if (showConfirm) ...[
                  const SizedBox(height: 15),
                  TextAuthScreen(
                    text: "Confirm Password",
                    textStyle: AppTextStyles.body9Medium,
                  ),
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    hintText: "Re-enter your password",
                    obscureText: obscureConfirmText,
                    isPassword: true,
                    onToggleVisibility: () {
                      setState(() {
                        obscureConfirmText = !obscureConfirmText;
                      });
                    },
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm password is required";
                      }
                      if (value != passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                ],
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: "By signing up you agree to our  ",
                    style: AppTextStyles.body1Regular.copyWith(
                      color: AppColors.gray500,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms, Privacy Policy, ",
                        style: AppTextStyles.body1Medium.copyWith(
                          color: AppColors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: " and ",
                        style: AppTextStyles.body1Regular.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                      TextSpan(
                        text: " Cookie Use",
                        style: AppTextStyles.body1Medium.copyWith(
                          color: AppColors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Create an Account",
                  background: AppColors.gray200,
                  colorText: AppColors.white,
                  pressed: () {
                    if (key.currentState!.validate()) {
                      context.read<AuthCubit>().signUP(
                        SignUpRequest(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          repassword: confirmPasswordController.text.trim(),
                          phone: "01002345676",
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
                SizedBox(height: 40),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: AppTextStyles.body1Regular.copyWith(
                        color: AppColors.gray500,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(AppRouter.login);
                            },
                          text: " Log In",
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
