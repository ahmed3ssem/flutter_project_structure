import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/local_strings.dart';

class MessageWidget {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(
    String message,
    Color color,
    VoidCallback onTap, {
    String? labelText,
  }) {
    final context = scaffoldMessengerKey.currentContext;
    final defaultOk = context != null
        ? AppLocale.ok.getString(context)
        : 'OK';

    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
      ),
      duration: const Duration(seconds: 4),
      backgroundColor: color,
      action: SnackBarAction(
        textColor: Colors.white,
        label: (labelText != null && labelText.isNotEmpty)
            ? labelText
            : defaultOk,
        onPressed: onTap,
      ),
    );
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
