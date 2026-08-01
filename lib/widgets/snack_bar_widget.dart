import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/utils/app_colors.dart'; // change your import

class SnackBarService {
  static void show(String message) {
    Get.snackbar(
      message,
      "",
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.white,
      backgroundColor: AppColors.primaryColor,
      titleText: null, // removes title area
      messageText: Text(
        message,
        style: TextStyle(color: AppColors.white, fontFamily: 'Tajawal'),
      ),
    );
  }
}
