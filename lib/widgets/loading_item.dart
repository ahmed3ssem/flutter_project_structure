import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../core/utils/app_colors.dart';

class LoadingItem extends StatelessWidget {
  final double? size;
  final Color? color;

  const LoadingItem({
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? 36.r;
    final effectiveColor = color ?? AppColors.primaryColor;

    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: effectiveColor,
        size: effectiveSize,
      ),
    );
  }
}
