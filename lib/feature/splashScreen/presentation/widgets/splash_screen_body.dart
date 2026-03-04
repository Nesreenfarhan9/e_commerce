import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_router.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      context.go(AppRouter.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Image.asset(
            "assets/images/Element.png",
            height: 220,
            fit: BoxFit.cover,
          ),
        ),

        Center(
          child: Image.asset(
            "assets/images/splash.png",
            width: 130,
            fit: BoxFit.contain,
          ),
        ),

        Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Center(
            child: CircularProgressIndicator(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
