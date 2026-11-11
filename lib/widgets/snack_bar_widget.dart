import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';
import 'message_widget.dart';

class SnackBarService {
  static void show(String message, {Color color = AppColors.primaryColor, VoidCallback? onTap}) {
    MessageWidget.showSnackBar(message, color, onTap);
  }

  static void showSuccess(String message) {
    MessageWidget.showSuccess(message);
  }

  static void showError(String message) {
    MessageWidget.showError(message);
  }
}
