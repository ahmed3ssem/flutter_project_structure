import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_constant.dart';

class LightTheme {
  const LightTheme._();

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    dividerColor: AppColors.lightBorder,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackground,
    cardColor: AppColors.lightCard,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondColor,
      surface: AppColors.lightSurface,
      error: AppColors.lightError,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.lightTextPrimary,
      onError: AppColors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        side: const BorderSide(color: AppColors.lightBorder),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.hPadding,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.lightError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.lightError, width: 1.5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, AppConstants.buttonHeight),
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.vPadding,
          horizontal: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusCircular),
        ),
      ),
    ),

    iconTheme: const IconThemeData(
      color: AppColors.lightTextPrimary,
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.lightBorder,
      thickness: 0.5,
    ),
  );
}
