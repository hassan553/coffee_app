import '../../../app/app_route.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widget/custom_image.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashNavigateFunction();
  }

  void _splashNavigateFunction() {
    Future.delayed(const Duration(seconds: 1),
        () => Navigator.pushNamed(context, AppRoute.onboardingRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brownWhite,
      body: Center(
        child: CustomAssetsImage(path: 'assets/logo.png'),
      ),
    );
  }
}
