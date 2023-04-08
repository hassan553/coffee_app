import '../fetures/onboarding/view/splash_view.dart';
import 'package:flutter/material.dart';

import '../fetures/onboarding/view/onboarding_view.dart';

class AppRoute {
  static String splashRoute = '/splash';
  static String onboardingRoute = '/onboarding';
  static String loginRoute = '/login';
  static String homeRoute = '/home';
}

Map<String, Widget Function(BuildContext)> route = {
  AppRoute.splashRoute: (context) => const SplashView(),
  AppRoute.onboardingRoute: (context) => const OnboardingView(),
};
