import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';

class DetailsIconButton extends StatelessWidget {
  final void Function()? onTap;
 final IconData iconData;
 const  DetailsIconButton({
    Key? key,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          iconData,
          size: 30,
          color: AppColors.gray,
        ),
      ),
    );
  }
}
