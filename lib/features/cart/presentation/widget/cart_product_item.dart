import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_cached_network_image.dart';
import '../../../../core/widget/custom_text.dart';
import '../../data/model/cart_model.dart';
import '../controller/cart_controller.dart';

class CartProductWidget extends StatelessWidget {
  final CartModel cartModel;

  const CartProductWidget({Key? key, required this.cartModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomCachedNetworkImage(
              image: cartModel.coffeeModel.image!,
              fit: BoxFit.cover,
              width: 150,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.fill,
                child: CustomText(
                  title: cartModel.coffeeModel.title!,
                  fontSize: 30,
                  color: AppColors.orange,
                ),
              ),
              const SizedBox(height: 5),
              GetBuilder<CartController>(
                builder: (controller) => FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.decrementCounter(cartModel);
                          controller.calculate();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.orange)),
                          child: CustomText(
                            title: '-',
                            fontSize: 30,
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      CustomText(
                        title: cartModel.counter.toString(),
                        fontSize: 30,
                        color: AppColors.orange,
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          controller.incrementCounter(cartModel);
                          controller.calculate();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.orange)),
                          child: CustomText(
                            title: '+',
                            fontSize: 30,
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              CustomText(
                title: (cartModel.price * cartModel.counter).toString(),
                fontSize: 30,
                color: AppColors.whiteGray,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
