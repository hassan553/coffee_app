import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function(String?)? onSave;
  const CustomTextField({super.key, required this.hintText,required this.onSave});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.brown,
      onSaved: onSave,
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
