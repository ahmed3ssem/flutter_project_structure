import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_constant.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final bool? isFocused;
  final TextInputType? keyboardType;
  final String? iconAsset;
  final String? activeIconAsset;
  final bool obscureText;
  final bool isPassword;
  final bool isEnabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? padding;
  final Color? borderColor;
  final int? maxLines;
  final String? Function(String? value)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.isFocused = false,
    this.keyboardType,
    this.iconAsset,
    this.activeIconAsset,
    this.obscureText = false,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isEnabled = true,
    this.padding,
    this.borderColor,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscured;

  @override
  void initState() {
    super.initState();
    _obscured = widget.obscureText || widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Widget? effectivePrefix = widget.prefixIcon;
    if (effectivePrefix == null && widget.iconAsset != null && widget.iconAsset!.isNotEmpty) {
      final assetPath = (widget.isFocused == true && widget.activeIconAsset != null)
          ? widget.activeIconAsset!
          : widget.iconAsset!;
      effectivePrefix = Padding(
        padding: EdgeInsets.all(12.w),
        child: SvgPicture.asset(
          assetPath,
          width: 20.r,
          height: 20.r,
        ),
      );
    }

    Widget? effectiveSuffix = widget.suffixIcon;
    if (widget.isPassword && effectiveSuffix == null) {
      effectiveSuffix = IconButton(
        icon: Icon(
          _obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          size: 20.r,
        ),
        onPressed: () {
          setState(() {
            _obscured = !_obscured;
          });
        },
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (widget.padding ?? AppConstants.hPadding).w,
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        obscureText: _obscured,
        enabled: widget.isEnabled,
        validator: widget.validator,
        onChanged: widget.onChanged,
        maxLines: widget.obscureText || widget.isPassword ? 1 : widget.maxLines,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: effectivePrefix,
          suffixIcon: effectiveSuffix,
          border: widget.borderColor != null
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall.r),
                  borderSide: BorderSide(color: widget.borderColor!),
                )
              : null,
        ),
      ),
    );
  }
}
