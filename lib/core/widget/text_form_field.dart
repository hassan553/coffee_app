import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.brown,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: const TextStyle(color: AppColors.brown),
        focusColor: AppColors.brown,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.brown,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.brown,
          ),
        ),
      ),
    );
  }
}
