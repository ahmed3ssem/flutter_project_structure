import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/local_strings.dart';

class MessageWidget {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(
    String message,
    Color color,
    VoidCallback? onTap, {
    String? labelText,
    Duration duration = const Duration(seconds: 4),
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      duration: duration,
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      action: onTap != null
          ? SnackBarAction(
              textColor: Colors.white,
              label: (labelText != null && labelText.isNotEmpty)
                  ? labelText
                  : 'ok'.tr,
              onPressed: onTap,
            )
          : null,
    );

    scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showSuccess(String message, [VoidCallback? onTap]) {
    showSnackBar(message, AppColors.green, onTap);
  }

  static void showError(String message, [VoidCallback? onTap]) {
    showSnackBar(message, AppColors.redAlert, onTap);
  }

  static void showWarning(String message, [VoidCallback? onTap]) {
    showSnackBar(message, AppColors.orange, onTap);
  }
}
