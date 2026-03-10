import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/digit_code_screen_body.dart';

class DigitCodeScreen extends StatelessWidget {
  const DigitCodeScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DigitCodeScreenBody(email: email));
  }
}
