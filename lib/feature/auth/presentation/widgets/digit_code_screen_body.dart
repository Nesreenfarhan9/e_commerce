import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_router.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/feature/auth/data/models/verification_code_request.dart';
import 'package:flutter_application_1/feature/auth/logic/authCubit/auth_cubit.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/text_auth_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class DigitCodeScreenBody extends StatefulWidget {
  const DigitCodeScreenBody({super.key, required this.email});
  final String email;

  @override
  State<DigitCodeScreenBody> createState() => _DigitCodeScreenBodyState();
}

class _DigitCodeScreenBodyState extends State<DigitCodeScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is VerificationCodeLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const CustomLoading(),
          );
        }

        if (state is VerificationCodeSuccess) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          context.go(AppRouter.resetPassword, extra: widget.email);
        }

        if (state is VerificationCodeFailure) {
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
          padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back, color: AppColors.black, weight: 20),
                SizedBox(height: 3),

                TextAuthScreen(
                  text: "Enter 6 Digit Code",
                  textStyle: AppTextStyles.body8SemiBold,
                ),
                TextAuthScreen(
                  text:
                      "Enter 6 digit code that your receive on \n your email (${widget.email}).",
                  textStyle: AppTextStyles.body6Regular,
                ),
                SizedBox(height: 30),
                Pinput(
                  validator: (value) {
                    if (value == null || value.length != 6) {
                      return "Enter complete 6 digit code";
                    }
                    return null;
                  },
                  controller: codeController,
                  length: 6,
                  keyboardType: TextInputType.number,
                  defaultPinTheme: PinTheme(
                    width: 55,
                    height: 55,
                    textStyle: AppTextStyles.body8SemiBold,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: "Continue",
                  background: AppColors.black,
                  colorText: AppColors.white,
                  pressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().verificationCode(
                        VerificationCodeRequest(
                          code: codeController.text.trim(),
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
