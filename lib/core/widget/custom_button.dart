import '../utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? function;
  double? fontSize;
  Color? color;
  CustomButton({
    super.key,
    required this.function,
    required this.title,
    this.color,
    this.fontSize,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 50,
      color: AppColors.brownLite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: function,
      child: CustomText(
        title: title,
        fontSize: fontSize,
        color: Colors.white,
      ),
    );
  }
}
