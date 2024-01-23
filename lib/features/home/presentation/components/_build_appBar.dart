import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_image.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: AppColors.black,
    leading: InkWell(
      onTap: () {},
      child: CustomAssetsImage(path: 'assets/menu.png'),
    ),
    actions: [
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: AppColors.whiteGray)),
            child: Image.asset(
              'assets/coffee_image.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      )
    ],
  );
}
