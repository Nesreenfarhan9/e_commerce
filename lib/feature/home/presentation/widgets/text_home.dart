import 'package:flutter/material.dart';

class TextHome extends StatelessWidget {
  TextHome({required this.text, required this.textStyle, this.textAlign});
  String text;
  TextStyle textStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle);
  }
}