import 'package:flutter/material.dart';
import 'package:shoely_app/core/utils/app_color.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.onSaved,
    this.validator,
  });
  String hintText;
  TextInputType? keyboardType;
  Widget? suffixIcon;
  bool? obscureText;
  TextEditingController? controller;
  Function(String)? onChanged;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.kprimaryColor,
      keyboardType: keyboardType,

      validator: validator,
      controller: controller,
      obscureText: obscureText!,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: AppColor.kprimaryColor,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kprimaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.kprimaryColor, width: 2),
        ),
      ),
    );
  }
}
