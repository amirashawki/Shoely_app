import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shoely_app/core/services/shared_preferences_singleton.dart';
import 'package:shoely_app/core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesSingleton.init();
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
      ),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
