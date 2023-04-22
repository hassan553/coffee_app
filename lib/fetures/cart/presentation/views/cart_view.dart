import '../../../../core/functions/navigation.dart';
import '../cart_view_model.dart/cart_cubit.dart';
import '../../../home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_text.dart';
import '../../data/model/cart_model.dart';
import 'order_message.dart';

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
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final cartList = CartCubit.get(context).getAllCartProducts();
                  if (cartList.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            CartProductWidget(cartModel: cartList[index]),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildDisplayPrice(),
                  _orderNowButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// show product price
Widget _buildDisplayPrice() {
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
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return CustomText(
                  title: CartCubit.get(context).totalPrice.toString(),
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

///buy now button implementation
Widget _orderNowButton() {
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
            child: Image.network(
              cartModel.coffeeModel.image!,
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
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) => FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          CartCubit.get(context).decrementCounter(cartModel);
                          CartCubit.get(context).calculate();
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
                          CartCubit.get(context).incrementCounter(cartModel);
                          CartCubit.get(context).calculate();
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
