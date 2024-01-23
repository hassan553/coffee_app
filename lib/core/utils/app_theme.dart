import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() => ThemeData(
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
    ));
