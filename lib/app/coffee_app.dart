import 'package:coffee_app/binding.dart';
import 'package:coffee_app/fetures/home/home_view_model/bloc/data_bloc.dart';

import '../fetures/cart/presentation/cart_view_model.dart/cart_cubit.dart';
import '../fetures/onboarding/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../core/utils/app_colors.dart';
import '../fetures/home/data/repository/home_repo.dart';
import '../fetures/home/home_view_model/home_cubit.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getHomeData(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => DataBloc(HomeRepository()),
        ),
      ],
      child: GetMaterialApp(
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
      ),
    );
  }
}
