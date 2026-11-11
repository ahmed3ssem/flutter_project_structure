import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class TextFieldWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final String? hintText;
  final bool isPasswordTextField;
  final TextInputType keyboardType;

  const TextFieldWidget({
    super.key,
    this.height,
    this.width,
    required this.controller,
    this.prefixIcon,
    this.hintText,
    required this.isPasswordTextField,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: hintText,
      prefixIcon: prefixIcon,
      isPassword: isPasswordTextField,
      keyboardType: keyboardType,
      padding: 0,
    );
  }
}
