import 'package:flutter/material.dart';
import 'package:shoely_app/core/utils/app_color.dart';
import 'package:shoely_app/core/utils/app_images.dart';

class AnimatedShoeBanner extends StatelessWidget {
  const AnimatedShoeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1C2733)),
      height: 380,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 55),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 200, end: 0),
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(value, 0),
                      child: Transform.rotate(angle: -0.42, child: child),
                    );
                  },
                  child: Image.asset(
                    Assets.imagesShoesBanner,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            Positioned(
              left: 6,
              top: 80,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: Duration(milliseconds: 900),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, (1 - value) * 40),
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Midnight \n Elite  \n Collection",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "  Where luxury meets street style",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.kOrangeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 12.0,
                          ),
                          child: const Text(
                            "Discover Now",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
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
