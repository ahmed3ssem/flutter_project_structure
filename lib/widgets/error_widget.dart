import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/local_strings.dart';

class ErrorWidgetItem extends StatelessWidget {
  final VoidCallback onTap;
  final String? errorMessage;
  final bool showBackButton;

  const ErrorWidgetItem({
    super.key,
    required this.onTap,
    this.errorMessage,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showBackButton && Navigator.of(context).canPop())
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.secondColor),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              SizedBox(height: 20.h),
              Icon(
                Icons.warning_amber_rounded,
                size: 80.r,
                color: AppColors.secondColor,
              ),
              SizedBox(height: 16.h),
              Text(
                'somethingWentWrong'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                errorMessage ?? 'pleaseTryAgain'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: 200.w,
                height: 48.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondColor,
                    foregroundColor: AppColors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  onPressed: onTap,
                  child: Text(
                    'reloadScreen'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
