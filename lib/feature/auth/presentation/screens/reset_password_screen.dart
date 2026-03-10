import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/reset_password_screen_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResetPasswordScreenBody(email: email));
  }
}
