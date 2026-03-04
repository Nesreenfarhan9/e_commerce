import 'package:flutter/material.dart';

class TextAuthScreen extends StatelessWidget {
  TextAuthScreen({required this.text, required this.textStyle, this.textAlign});
  String text;
  TextStyle textStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle);
  }
}
