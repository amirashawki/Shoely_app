
import 'package:flutter/material.dart';
import 'package:shoely_app/core/utils/app_color.dart';

class ScaffoldAuth extends StatelessWidget {
  const ScaffoldAuth({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 31,
            color: AppColor.kprimaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: child,
      ),
    );
  }
}
