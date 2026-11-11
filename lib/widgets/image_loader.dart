import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'loading_item.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? errorWidget;
  final Widget? placeholder;

  const ImageLoader({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.errorWidget,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? 100.h;
    final effectiveWidth = width ?? 100.w;

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: imageUrl.isEmpty
          ? _buildErrorWidget(effectiveWidth, effectiveHeight)
          : CachedNetworkImage(
              imageUrl: imageUrl,
              height: effectiveHeight,
              width: effectiveWidth,
              fit: fit,
              placeholder: (context, url) =>
                  placeholder ??
                  Center(
                    child: LoadingItem(
                      size: (effectiveHeight > 40 ? 30.r : effectiveHeight * 0.5),
                    ),
                  ),
              errorWidget: (context, url, error) =>
                  errorWidget ?? _buildErrorWidget(effectiveWidth, effectiveHeight),
            ),
    );
  }

  Widget _buildErrorWidget(double w, double h) {
    return Container(
      width: w,
      height: h,
      color: Colors.grey.withOpacity(0.1),
      child: Icon(
        Icons.image_not_supported_outlined,
        size: (h > 40 ? 28.r : h * 0.6),
        color: Colors.grey,
      ),
    );
  }
}
