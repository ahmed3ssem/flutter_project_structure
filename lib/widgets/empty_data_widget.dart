import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project_structure/widgets/svg_image_widget.dart';

import '../core/utils/app_colors.dart';

class EmptyDataWidget extends StatelessWidget {
  final String text;
  final String? imageAsset;
  final IconData fallbackIcon;
  final VoidCallback? onRetry;
  final String? retryText;

  const EmptyDataWidget({
    super.key,
    required this.text,
    this.imageAsset,
    this.fallbackIcon = Icons.inbox_outlined,
    this.onRetry,
    this.retryText,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imageAsset != null && imageAsset!.isNotEmpty)
              SVGImageWidget(image: imageAsset!, width: 125.w, height: 115.h)
            else
              Icon(
                fallbackIcon,
                size: 80.r,
                color: textColor.withOpacity(0.5),
              ),
            SizedBox(height: 20.h),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            if (onRetry != null) ...[
              SizedBox(height: 16.h),
              TextButton(
                onPressed: onRetry,
                child: Text(retryText ?? 'Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
