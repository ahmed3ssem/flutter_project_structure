import 'package:get/get.dart';

class LocalStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar_AR': {
      "noData": "لا يوجد بيانات",
      "english": "Proceed With English",
      "arabic": "المتابعة باللغة العربية",
      "loadingMore": "جاري تحميل المزيد...",
      "refresh": "إعادة المحاولة",
    },
    'en_US': {
      "noData": "There is no data",
      "english": "Proceed With English",
      "arabic": "Proceed With Arabic",
      "loadingMore": "Loading more...",
      "refresh": "Retry",
    },
  };
}
