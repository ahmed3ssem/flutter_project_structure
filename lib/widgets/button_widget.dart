import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_constant.dart';

class ButtonWidget extends StatelessWidget {
  final String btName;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final Widget? icon;
  final EdgeInsetsGeometry? margin;

  const ButtonWidget({
    super.key,
    required this.btName,
    required this.onTap,
    this.isLoading = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.height,
    this.width,
    this.icon,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBgColor = isEnabled
        ? (backgroundColor ?? AppColors.primaryColor)
        : Colors.grey.shade400;

    return Padding(
      padding: margin ?? EdgeInsets.symmetric(horizontal: AppConstants.hPadding.w),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? AppConstants.buttonHeight.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: effectiveBgColor,
            foregroundColor: textColor ?? AppColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusCircular.r),
              side: borderColor != null
                  ? BorderSide(color: borderColor!, width: 1.w)
                  : BorderSide.none,
            ),
          ),
          onPressed: (isEnabled && !isLoading) ? onTap : null,
          child: isLoading
              ? SizedBox(
                  width: 22.r,
                  height: 22.r,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      icon!,
                      SizedBox(width: 8.w),
                    ],
                    Text(
                      btName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: textColor ?? AppColors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
