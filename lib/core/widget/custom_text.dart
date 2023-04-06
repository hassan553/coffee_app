import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomText extends StatelessWidget {
  final String title;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  CustomText(
      {super.key,
      required this.title,
      this.fontWeight,
      this.color,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
