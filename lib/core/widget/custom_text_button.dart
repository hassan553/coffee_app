import 'custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function function;
  double? fontSize;
  Color? color;
  CustomTextButton({
    super.key,
    required this.function,
    required this.title,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        function();
      },
      child: CustomText(
        title: title,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
