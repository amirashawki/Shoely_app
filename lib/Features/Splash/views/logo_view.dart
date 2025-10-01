import 'package:flutter/material.dart';
import 'package:shoely_app/core/utils/app_images.dart';
import 'package:shoely_app/core/utils/app_router.dart';

class LogoView extends StatefulWidget {
  const LogoView({super.key});

  @override
  State<LogoView> createState() => _LogoViewState();
}

void excuteNavigation(BuildContext context) {
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.pushReplacementNamed(context, AppRouter.kLoginView);
  });
}

class _LogoViewState extends State<LogoView> {
  @override
  void initState() {
    super.initState();
    excuteNavigation(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(Assets.imagesShoelyLogo)));
  }
}
