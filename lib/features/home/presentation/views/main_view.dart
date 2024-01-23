import 'package:coffee_app/features/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../components/_build_appBar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.black,
          appBar: homeAppBar(),
          body: controller.screens[controller.bottomNavigationCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.bottomNavigationCurrentIndex,
            onTap: (value) {
              controller.changeBottomNavigationCurrentIndex(value);
            },
            iconSize: 40,
            items: controller.listBottomBar,
          ),
        );
      },
    );
  }
}
