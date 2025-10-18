
import 'package:flutter/material.dart';
import 'package:shoely_app/core/utils/app_color.dart' show AppColor;

import '../../Features/auth/presentation/views/widgets/custom_text_field.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({super.key});

  @override
  State<CustomPasswordTextField> createState() => _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = false;
  TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      hintText: 'Enter your password',
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppColor.kprimaryColor,
        ),
      ),
    );
  }
}