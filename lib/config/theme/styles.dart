import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../PrefHelper/helper.dart';

class TextStyles {
  static String get fontFamily {
    final lang = Helper.getLanguage();
    return lang == 'en' ? 'Cambay' : 'Tajawal';
  }

  // ==========================================
  // Semantic Material 3 Typography Scale
  // ==========================================

  static TextStyle displayLarge({Color? color}) => TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        height: 1.3,
        fontFamily: fontFamily,
        color: color,
      );

  static TextStyle headlineMedium({Color? color}) => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        height: 1.3,
        fontFamily: fontFamily,
        color: color,
      );

  static TextStyle titleLarge({Color? color}) => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        height: 1.4,
        fontFamily: fontFamily,
        color: color,
      );

  static TextStyle titleMedium({Color? color}) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: 1.4,
        fontFamily: fontFamily,
        color: color,
      );

  static TextStyle bodyLarge({Color? color}) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontFamily: fontFamily,
        color: color,
      );

  static TextStyle bodyMedium({Color? color}) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
        fontFamily: fontFamily,
        color: color,
      );

  static TextStyle bodySmall({Color? color}) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.4,
        fontFamily: fontFamily,
        color: color,
      );

  static TextStyle labelLarge({Color? color}) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: color,
      );

  // ==========================================
  // Backwards Compatible Legacy Getters
  // ==========================================

  static TextStyle get textXLarge => displayLarge(color: AppColors.lightTextPrimary);
  static TextStyle get textLarge => headlineMedium(color: AppColors.lightTextPrimary);
  static TextStyle get textLarge2 => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w800,
        fontFamily: fontFamily,
        color: AppColors.lightTextPrimary,
      );
  static TextStyle get textLarge3 => titleLarge(color: AppColors.lightTextPrimary);
  static TextStyle get textMedium => titleMedium(color: AppColors.lightTextPrimary);
  static TextStyle get textMedium2 => titleLarge(color: AppColors.lightTextPrimary);
  static TextStyle get textMedium3 => bodyLarge(color: AppColors.lightTextPrimary);
  static TextStyle get textMedium4 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: AppColors.lightTextPrimary,
      );
  static TextStyle get textMedium5 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: AppColors.lightTextPrimary,
      );
  static TextStyle get textMedium6 => headlineMedium(color: AppColors.lightTextPrimary);
  static TextStyle get textMediumPrimary => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: AppColors.darkGreen,
      );
  static TextStyle get textSmall => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        color: AppColors.lightTextPrimary,
      );
  static TextStyle get textXSmall => bodyLarge(color: AppColors.lightTextPrimary);
  static TextStyle get textXXSmall => bodyMedium(color: AppColors.lightTextPrimary);
  static TextStyle get textXXXSmall => bodyMedium(color: AppColors.lightTextSecondary);
  static TextStyle get textXXXXSmall => bodyMedium(color: AppColors.lightTextSecondary);
  static TextStyle get textExtraSmall => bodySmall(color: AppColors.lightTextSecondary);
  static TextStyle get textExtraSmall2 => bodySmall(color: AppColors.lightTextSecondary);
  static TextStyle get textExtraSmall3 => TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: AppColors.lightTextSecondary,
      );
  static TextStyle get textExtraSmall4 => TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
        color: AppColors.lightTextPrimary,
      );
  static TextStyle get textExtraSmall5 => bodyMedium(color: AppColors.lightTextPrimary);
}
