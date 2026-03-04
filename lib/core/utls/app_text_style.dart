import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Poppins';

  // ===== Headers =====
  static const TextStyle header = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.black,
    fontFamily: fontFamily,
  );
  static const TextStyle header1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.black,
    fontFamily: fontFamily,
  );

  static const TextStyle header2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: fontFamily,
  );

  static const TextStyle header3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: fontFamily,
  );

  static const TextStyle header4SemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: fontFamily,
  );

  static const TextStyle header4Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: fontFamily,
  );

  // ===== Body 1 =====
  static const TextStyle body1Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGray,
    fontFamily: fontFamily,
  );

  static const TextStyle body1Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
    fontFamily: fontFamily,
  );
  static const TextStyle body8SemiBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGray,
    fontFamily: fontFamily,
  );

  static const TextStyle body1SemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGray,
    fontFamily: fontFamily,
  );

  // ===== Body 2 =====
  static const TextStyle body2Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.gray600,
    fontFamily: fontFamily,
  );
  static const TextStyle body6Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.gray400,
    fontFamily: fontFamily,
  );

  static const TextStyle body2Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.gray600,
    fontFamily: fontFamily,
  );
  static const TextStyle body9Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: fontFamily,
  );

  static const TextStyle body2SemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.gray600,
    fontFamily: fontFamily,
  );

  // ===== Body 3 =====
  static const TextStyle body3Regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.gray500,
    fontFamily: fontFamily,
  );

  static const TextStyle body3Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.gray500,
    fontFamily: fontFamily,
  );

  static const TextStyle body3SemiBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.gray500,
    fontFamily: fontFamily,
  );
}
