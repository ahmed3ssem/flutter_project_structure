import 'package:flutter/material.dart';
import 'package:flutter_project_structure/config/PrefHelper/prefs.dart';
import 'package:get/get.dart';
import '../../core/utils/app_strings.dart';

class Helper {
  static Future<void> getDefaultLanguage() async {
    if (Prefs.isContain(AppStrings.local)) {
      String savedLocale = Prefs.getString(AppStrings.local);
      Locale locale = (savedLocale == AppStrings.enCountryCode)
          ? const Locale('en', 'US')
          : const Locale('ar', 'AR');
      Get.updateLocale(locale);
    } else {
      // Default to Arabic if no language is chosen
      Locale locale = const Locale('ar', 'AR');
      Get.updateLocale(locale);
      // Save Arabic as default
      await setDefaultLang(AppStrings.arCountryCode);
    }
  }

  static setDefaultLang(String lang) async =>
      Prefs.setString(AppStrings.local, lang);

  static String getLanguage() {
    String local = '';
    if (Helper.getCurrentLocal() == 'US') {
      local = 'en';
    } else {
      local = 'ar';
    }
    return local;
  }

  static String getCurrentLocal() {
    String local = AppStrings.enCountryCode;
    final currentLocal = Get.locale;

    if (currentLocal != null && currentLocal.countryCode != null) {
      local = currentLocal.countryCode!;
    } else {
      // Fallback to saved preference if Get.locale is null
      if (Prefs.isContain(AppStrings.local)) {
        local = Prefs.getString(AppStrings.local);
      }
    }

    if (local == 'US') {
      AppStrings.appLocal = 'en';
    } else {
      AppStrings.appLocal = 'ar';
    }
    return local;
  }

  static String getUserEmail() {
    String email = '';
    if (Prefs.isContain(AppStrings.email)) {
      email = Prefs.getString(AppStrings.email);
    }
    return email;
  }
}
