// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_app/core/functions/navigation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../core/functions/get_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_text.dart';
import '../../../cart/data/model/cart_model.dart';
import '../../../cart/presentation/cart_view_model.dart/cart_cubit.dart';
import '../../../favorite/views/favorite_view.dart';
import '../../data/model/coffee_model.dart';
import '../components/_build_details_description.dart';
import '../components/_build_icon_button.dart';
import '../components/_build_select_coffe_size.dart';
import 'package:coffee_app/fetures/home/home_view_model/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatefulWidget {
  final CoffeeModel? coffeeModel;
  const DetailsView({super.key, this.coffeeModel});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 450,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Shimmer(
                            duration: const Duration(seconds: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                widget.coffeeModel!.image!,
                                fit: BoxFit.fill,
                                height: 450,
                                width: MediaQuery.of(context).size.width * .8,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 60,
                            child: DetailsIconButton(
                              iconData: Icons.arrow_back_ios,
                              onTap: () {
                                pop(context);
                              },
                            ),
                          ),
                          BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              if (HomeCubit.get(context)
                                  .isFavorite(widget.coffeeModel!.id!)) {
                                return Positioned(
                                  top: 25,
                                  right: 60,
                                  child: InkWell(
                                    onTap: () {
                                      HomeCubit.get(context).deleteFromFavorite(
                                          widget.coffeeModel!.id!);
                                    },
                                    child: Image.asset(
                                      'assets/favourites.png',
                                      fit: BoxFit.fill,
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                );
                              } else {
                                return Positioned(
                                  top: 30,
                                  right: 60,
                                  child: DetailsIconButton(
                                    iconData: Icons.heart_broken,
                                    onTap: () {
                                      HomeCubit.get(context)
                                          .addToFavorite(widget.coffeeModel!);
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * .8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xffA99A97).withOpacity(.7),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 15),
                        DetailsDescription(
                          description: widget.coffeeModel!.description!,
                        ),
                        const SizedBox(height: 30),
                        const SelectCoffeeSize(),
                        const SizedBox(height: 20),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildDisplayPrice(),
                  _buyNowButton(widget.coffeeModel!),
                ],
              )
            ],
          ),
        ),
      ),
    );
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
              CustomText(
                title: '20',
                color: Colors.white,
                fontSize: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  ///buy now button implementation
  Widget _buyNowButton(CoffeeModel coffeeModel) {
    return Expanded(
      flex: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return MaterialButton(
              onPressed: () {
                CartCubit.get(context).addToCart(CartModel(coffeeModel: coffeeModel,counter: 1,price: 20));
              },
              height: 60,
              color: AppColors.orange,
              child: const Text(
                'Add To Cart',
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
