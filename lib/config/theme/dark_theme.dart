import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_constant.dart';

class DarkTheme {
  const DarkTheme._();

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    dividerColor: AppColors.darkBorder,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkCard,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondColor,
      surface: AppColors.darkSurface,
      error: AppColors.darkError,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.darkTextPrimary,
      onError: AppColors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        side: const BorderSide(color: AppColors.darkBorder),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.hPadding,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.darkError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        borderSide: const BorderSide(color: AppColors.darkError, width: 1.5),
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
      color: AppColors.darkTextPrimary,
    ),

    dividerTheme: const DividerThemeData(
      color: AppColors.darkBorder,
      thickness: 0.5,
    ),
  );
}
