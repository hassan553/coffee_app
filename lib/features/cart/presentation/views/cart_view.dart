import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/app_colors.dart';
import '../controller/cart_controller.dart';
import '../widget/cart_product_item.dart';
import '../widget/display_price.dart';
import '../widget/order_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GetBuilder<CartController>(
                builder: (controller) {
                  final cartList = controller.getAllCartProducts();
                  if (cartList.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: CartProductWidget(cartModel: cartList[index]),
                        ),
                        itemCount: cartList.length,
                      ),
                    );
                  } else {
                    return Center(
                      child: Lottie.asset('assets/coffee_loading.json'),
                    );
                  }
                },
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DisplayPriceWidget(),
                  OrderNowButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
