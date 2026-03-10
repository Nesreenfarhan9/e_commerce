import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int selectedIndex = -1;

  List sizes = ["S", "M", "L"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        sizes.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },

            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),

              backgroundColor: selectedIndex == index
                  ? AppColors.black
                  : AppColors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: AppColors.gray200),
              ),
            ),

            child: TextHome(
              text: sizes[index],
              textStyle: AppTextStyles.body2Medium.copyWith(
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
