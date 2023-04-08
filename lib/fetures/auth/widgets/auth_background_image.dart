import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/functions/get_size.dart';
import '../../../core/utils/app_colors.dart';

class AuthBackgroundImage extends StatelessWidget {
  final Widget child;
  const AuthBackgroundImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize(context).width,
      height: screenSize(context).height,
      decoration: BoxDecoration(
        color: AppColors.brownLite.withOpacity(.6),
        image: const DecorationImage(
          image: AssetImage('assets/login.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
