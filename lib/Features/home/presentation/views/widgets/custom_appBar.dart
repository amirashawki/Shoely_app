import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoely_app/core/utils/app_color.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.kOrangeColor,
              ),
              height: 40,
              width: 5,
            ),
            SizedBox(width: 15),
            Text(
              'S H O E L Y',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  color: AppColor.kGrayText.withOpacity(0.3),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(17),
              ),

              child: Center(
                child: Icon(Iconsax.notification, color: Colors.white),
              ),
            ),

            Positioned(
              top: -4,
              right: -2,

              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: AppColor.kOrangeColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
