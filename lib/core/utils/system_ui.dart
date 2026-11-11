import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class SystemUiStyle {
  static void setOverlayStyle({bool isDark = false}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor:
            isDark ? AppColors.darkBackground : AppColors.white,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  static Future<void> lockPortraitOrientation() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
