import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';

class DigitCodeTextField extends StatelessWidget {
  const DigitCodeTextField({this.controller,required this.hintText,required this.validation});
    final TextEditingController? controller;
  final String hintText;
     final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 80,
      child: TextFormField(
        controller: controller,
         
        validator:validation ,
        style: AppTextStyles.body1Regular.copyWith(color: AppColors.gray400),
        keyboardType: TextInputType.number,
        //maxLength: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
      
        decoration: InputDecoration(
          hintText: hintText,
          
        
      
          hintStyle: AppTextStyles.body1Regular,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.gray100),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.gray100),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
       
  }
}