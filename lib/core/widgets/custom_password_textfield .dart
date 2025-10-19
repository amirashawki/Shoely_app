import 'package:flutter/material.dart';
import 'package:shoely_app/core/utils/app_color.dart' show AppColor;

import '../../Features/auth/presentation/views/widgets/custom_text_field.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({super.key,this.passwordController});
  final TextEditingController? passwordController;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = false;


  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
     
      obscureText: obscureText,
      hintText: 'Enter your password',
      controller: widget.passwordController,
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
