import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_project_structure/config/PrefHelper/prefs.dart';
import '../../core/utils/app_strings.dart';

class Helper {
  static Future<void> getDefaultLanguage() async {
    final localization = FlutterLocalization.instance;
    if (Prefs.isContain(AppStrings.local)) {
      final savedLocale = Prefs.getString(AppStrings.local);
      final langCode = (savedLocale == AppStrings.enCountryCode ||
              savedLocale == 'en' ||
              savedLocale == 'EN')
          ? 'en'
          : 'ar';
      localization.translate(langCode);
      AppStrings.appLocal = langCode;
    } else {
      localization.translate('en');
      AppStrings.appLocal = 'en';
      await setDefaultLang(AppStrings.enCountryCode);
    }
  }

  static Future<void> setLanguage(String langCode) async {
    final localization = FlutterLocalization.instance;
    localization.translate(langCode);
    AppStrings.appLocal = langCode;
    final countryCode =
        (langCode == 'en') ? AppStrings.enCountryCode : AppStrings.arCountryCode;
    await setDefaultLang(countryCode);
  }

  static Future<bool> setDefaultLang(String lang) async =>
      Prefs.setString(AppStrings.local, lang);

  static String getLanguage() {
    return getCurrentLocal() == AppStrings.enCountryCode ? 'en' : 'ar';
  }

  static String getCurrentLocal() {
    final currentLocal = FlutterLocalization.instance.currentLocale;

    if (currentLocal?.countryCode != null) {
      return currentLocal!.countryCode!;
    }

    if (Prefs.isContain(AppStrings.local)) {
      return Prefs.getString(AppStrings.local);
    }

    return AppStrings.enCountryCode;
  }

  static String getUserEmail() {
    return Prefs.getString(AppStrings.email);
  }
}
