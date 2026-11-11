import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/config/PrefHelper/prefs.dart';
import 'package:flutter_project_structure/core/utils/app_strings.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _initTheme();
  }

  void _initTheme() {
    final isDark = Prefs.getBool(AppStrings.theme, false);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleTheme() async {
    final newIsDark = state != ThemeMode.dark;
    await Prefs.setBool(AppStrings.theme, newIsDark);
    emit(newIsDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> setTheme(ThemeMode mode) async {
    await Prefs.setBool(AppStrings.theme, mode == ThemeMode.dark);
    emit(mode);
  }
}
