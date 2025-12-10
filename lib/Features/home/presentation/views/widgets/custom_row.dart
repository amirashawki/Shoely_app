import 'package:flutter/material.dart';
import 'package:shoely_app/core/utils/app_color.dart';

class CustomSeeMore extends StatelessWidget {
  const CustomSeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Styles',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                color: AppColor.kOrangeColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
