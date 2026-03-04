import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.textError});
  final String textError;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(textError));
  }
}
