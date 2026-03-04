import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginScreenBody());
  }
}
