import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_text.dart';
import '../controller/cart_controller.dart';

class DisplayPriceWidget extends StatelessWidget {
  const DisplayPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: 'Price',
            color: AppColors.gray,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                title: '\$',
                color: Colors.orange,
                fontSize: 23,
              ),
              const SizedBox(width: 5),
              GetBuilder<CartController>(
                builder: (controller) {
                  return CustomText(
                    title: controller.totalPrice.toString(),
                    color: Colors.white,
                    fontSize: 30,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
