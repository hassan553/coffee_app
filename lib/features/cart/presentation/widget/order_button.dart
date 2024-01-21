import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../views/order_message.dart';


class OrderNowButton extends StatelessWidget {
  const OrderNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: MaterialButton(
          onPressed: () {
            navigatedTo(const OrderMessage());
          },
          height: 60,
          color: AppColors.orange,
          child: const Text(
            'Order Now',
            style: TextStyle(
              fontSize: 25,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
