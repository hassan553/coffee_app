import 'package:coffee_app/binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/utils/app_colors.dart';
import '../features/onboarding/view/splash_view.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: AppColors.orange,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.whiteGray,
        ),
      )),
      initialBinding: MyBinding(),
      home: const SplashView(),
    );
  }
}
