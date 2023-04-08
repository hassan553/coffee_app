import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  Color? color;
  double? size;
   CustomIcon({super.key,required this.iconData,this.size,this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
