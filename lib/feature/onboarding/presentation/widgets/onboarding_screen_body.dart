import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/onboarding/presentation/widgets/home_button.dart';

class OnboardingScreenBody extends StatelessWidget {
  const OnboardingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.89,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 210),
                child: Image.asset(
                  "assets/images/onboarding.png",
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: size.height * 0.06,
                left: size.width * 0.04,
                right: size.width * 0.08,
                child: Text(
                  "Define yourself in your unique way.",

                  style: AppTextStyles.header.copyWith(height: 0.8),
                ),
              ),
              Positioned(
                left: size.width * 0.02,
                top: size.height * 0.05,
                child: Image.asset("assets/images/Image.png"),
              ),
            ],
          ),
        ),

        const Spacer(),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08,
            vertical: size.height * 0.01,
          ),
          child: const HomeButton(),
        ),
      ],
    );
  }
}
