import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/local_strings.dart';
import 'loading_item.dart';

class LoadingOverlayWidget extends StatelessWidget {
  final String? message;
  final bool isModal;

  const LoadingOverlayWidget({
    super.key,
    this.message,
    this.isModal = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final content = Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LoadingItem(size: 40),
            SizedBox(height: 16.h),
            Text(
              message ?? 'pleaseWait'.tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
              ),
            ),
          ],
        ),
      ),
    );

    if (!isModal) return content;

    return Container(
      color: Colors.black.withOpacity(0.4),
      width: double.infinity,
      height: double.infinity,
      child: content,
    );
  }
}
