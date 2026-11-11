import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/local_strings.dart';

class SkipWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;

  const SkipWidget({
    super.key,
    required this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Text(
          text ?? 'skip'.tr,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
