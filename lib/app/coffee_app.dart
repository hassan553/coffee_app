import 'package:coffee_app/fetures/onboarding/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_route.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SplashView(),
      routes: route,
    );
  }
}
