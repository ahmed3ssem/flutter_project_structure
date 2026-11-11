import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_colors.dart';
import 'theme_cubit.dart';

class ThemeHelper {
  const ThemeHelper._();

  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;

  static Color primaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static Color secondaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;

  static Color backgroundColor(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color surfaceColor(BuildContext context) =>
      Theme.of(context).colorScheme.surface;

  static Color cardColor(BuildContext context) =>
      Theme.of(context).cardColor;

  static Color borderColor(BuildContext context) =>
      isDarkMode(context) ? AppColors.darkBorder : AppColors.lightBorder;

  static Color textPrimaryColor(BuildContext context) =>
      isDarkMode(context)
          ? AppColors.darkTextPrimary
          : AppColors.lightTextPrimary;

  static Color textSecondaryColor(BuildContext context) =>
      isDarkMode(context)
          ? AppColors.darkTextSecondary
          : AppColors.lightTextSecondary;

  static Color errorColor(BuildContext context) =>
      Theme.of(context).colorScheme.error;

  static Color successColor(BuildContext context) => AppColors.green;
  static Color warningColor(BuildContext context) => AppColors.orange;
  static Color whiteColor(BuildContext context) => AppColors.white;
  static Color blackColor(BuildContext context) => AppColors.black;
  static Color redColor(BuildContext context) => AppColors.red;
  static Color hyperlinkColor(BuildContext context) => AppColors.hyperLink;

  static void toggleThemeMode(BuildContext context) {
    context.read<ThemeCubit>().toggleTheme();
  }
}
