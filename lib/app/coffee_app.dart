import 'package:coffee_app/binding.dart';
import 'package:coffee_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/onboarding/view/splash_view.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialBinding: MyBinding(),
      home: const SplashView(),
    );
  }
}
