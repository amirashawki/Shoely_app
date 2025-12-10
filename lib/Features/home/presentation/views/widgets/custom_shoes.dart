import 'package:flutter/material.dart';
import 'package:shoely_app/core/utils/app_color.dart';
import 'package:shoely_app/core/utils/app_images.dart';

class ShoeCard extends StatelessWidget {
  final Map item;

  const ShoeCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF112032),
        borderRadius: BorderRadius.circular(20),
        border: BoxBorder.all(
          color: AppColor.kGrayText.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    Assets.imagesShoesBanner,
                    fit: BoxFit.cover,
                    height: 220,
                    width: 280,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Text(
              'name shoes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 6),

            Text(
              'price shoes',
              style: TextStyle(
                color: Color(0xFFF2A900),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
