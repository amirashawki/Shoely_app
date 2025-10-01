import 'package:flutter/material.dart';
import 'package:shoely_app/core/utils/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xffB0B0B0))),
        SizedBox(width: 8),
        Text(
          'OR',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.kprimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 8),
        Expanded(child: Divider(color: Color(0xffB0B0B0))),
      ],
    );
  }
}
