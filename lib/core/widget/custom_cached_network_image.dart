import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/app_colors.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String image;
  final double width;
  double? height;
  BoxFit? fit;
  CustomCachedNetworkImage({
    super.key,
    required this.image,
    required this.width,
    this.height,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: AppColors.orange,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
