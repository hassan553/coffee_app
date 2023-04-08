// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAssetsImage extends StatelessWidget {
  final String path;
  double? width;
  double? height;
  BoxFit? boxFit;
  CustomAssetsImage({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: boxFit,
    );
  }
}
