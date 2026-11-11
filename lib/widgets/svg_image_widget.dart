import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGImageWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final Color? color;

  const SVGImageWidget({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.color,
    this.boxFit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return SizedBox(width: width, height: height);
    }

    return SvgPicture.asset(
      image,
      height: height,
      width: width,
      fit: boxFit,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
