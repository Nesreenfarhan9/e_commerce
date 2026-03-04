import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_router.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_button.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/text_auth_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordSuccessDialog extends StatelessWidget {
  const ResetPasswordSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // insetPadding: const EdgeInsets.symmetric(vertical: 150),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            top: 40,
            bottom: 60,
            right: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/Check-duotone.svg", height: 78),
                const SizedBox(height: 12),

                TextAuthScreen(
                  text: "Password Changed!",
                  textAlign: TextAlign.center,
                  textStyle: AppTextStyles.body8SemiBold,
                ),

                const SizedBox(height: 8),
                TextAuthScreen(
                  text: "You can now use your new\npassword to login.",
                  textAlign: TextAlign.center,
                  textStyle: AppTextStyles.body2Regular,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Login",
                  background: AppColors.black,
                  colorText: AppColors.white,
                  pressed: () {
                    Navigator.of(context).pop();
                    context.go(AppRouter.login);
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
