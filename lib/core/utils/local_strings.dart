import 'package:flutter_localization/flutter_localization.dart';

// ─── How to use ───────────────────────────────────────────────────────────────
// Write your string key between single quotes and add .tr at the end.
// Example:  'appName'.tr  →  returns "Funeral App" (en) or "واجب" (ar)
//
// To add a new string:
//   1. Add the English text to the EN map below.
//   2. Add the Arabic text to the AR map below.
//   3. Use it anywhere as 'yourKey'.tr
// ─────────────────────────────────────────────────────────────────────────────

extension StringTrExtension on String {
  String get tr {
    final lang =
        FlutterLocalization.instance.currentLocale?.languageCode ?? 'en';
    final map = lang == 'ar' ? arStrings : enStrings;
    return map[this]?.toString() ?? this;
  }
}

// ── English strings ──────────────────────────────────────────────────────────
// Public maps — only needed for FlutterLocalization.init() in main.dart.
// You never need to reference these directly anywhere else; just use 'key'.tr
const Map<String, String> enStrings = {
  'appName': 'Funeral App',
  'noData': 'There is no data',
  'english': 'Proceed With English',
  'arabic': 'Proceed With Arabic',
  'loadingMore': 'Loading more...',
  'refresh': 'Retry',
  'somethingWentWrong': 'Something went wrong',
  'pleaseTryAgain': 'Please try again',
  'reloadScreen': 'Reload screen',
  'loading': 'Loading',
  'pleaseWait': 'Please wait'
};

// ── Arabic strings ───────────────────────────────────────────────────────────
const Map<String, String> arStrings = {
  'appName': 'واجب',
  'noData': 'لا توجد بيانات',
  'english': 'المتابعة بالإنجليزية',
  'arabic': 'المتابعة بالعربية',
  'loadingMore': 'جاري تحميل المزيد...',
  'refresh': 'إعادة المحاولة',
  'somethingWentWrong': 'حدث خطأ ما',
  'pleaseTryAgain': 'يرجى المحاولة مرة أخرى',
  'reloadScreen': 'إعادة تحميل الشاشة',
  'loading': 'جاري التحميل',
  'pleaseWait': 'يرجى الانتظار'
};
