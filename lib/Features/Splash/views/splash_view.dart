import 'package:flutter/material.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:shoely_app/Features/Splash/views/widgets/loading_dots.dart';
import 'package:shoely_app/Features/Splash/views/widgets/logo_widget.dart';
import 'package:shoely_app/core/utils/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // Navigate to login after 3 seconds
    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.kLoginView);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF000000), Color(0xFF1A1A1A), Color(0xFF000000)],
          ),
        ),
        child: Stack(
          children: [
            // Animated Background Blobs
            Positioned(
              top: 200,
              left: -80,
              child: _AnimatedBlob(
                size: 256,
                color: const Color(0xFFFF7A00).withOpacity(0.2),
              ),
            ),
            Positioned(
              bottom: 200,
              right: -80,
              child: _AnimatedBlob(
                size: 320,
                color: const Color(0xFFE4A100).withOpacity(0.2),
                delay: 1.0,
              ),
            ),

            // Logo Content
            Center(
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      LogoWidget(),
                      const SizedBox(height: 32),

                      // Brand Name
                      const Text(
                        'SHOELY',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 12,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tagline
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 32,
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  const Color(0xFFFF7A00),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'LUXURY FOOTWEAR',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF9CA3AF),
                              letterSpacing: 4,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 32,
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  const Color(0xFFE4A100),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 64),

                      // Loading Animation
                      LoadingDots(),
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

class _AnimatedBlob extends StatefulWidget {
  final double size;
  final Color color;
  final double delay;

  const _AnimatedBlob({
    required this.size,
    required this.color,
    this.delay = 0,
  });

  @override
  State<_AnimatedBlob> createState() => _AnimatedBlobState();
}

class _AnimatedBlobState extends State<_AnimatedBlob>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.delay > 0) {
      Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [widget.color, widget.color.withOpacity(0)],
          ),
        ),
      ),
    );
  }
}
