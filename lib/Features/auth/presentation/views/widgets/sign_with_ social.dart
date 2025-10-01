import 'package:flutter/material.dart';

class SignWithSocialButton extends StatelessWidget {
  const SignWithSocialButton({
    super.key,

    this.onTap,
    this.borderRadius,
    this.verticalPadding,
    required this.title,
    required this.image,
  });

  final double? verticalPadding;
  final String title, image;
  @override
  final double? borderRadius;
  final void Function()? onTap;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 22),
          border: Border.all(color: Color(0xffB0B0B0)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 10,
            horizontal: 72,
          ),
          child: Row(
            children: [
              Image.asset(image, height: 20, width: 20),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
