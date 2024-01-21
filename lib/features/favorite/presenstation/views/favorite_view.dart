import 'package:coffee_app/features/favorite/presenstation/controller/favorite_controller.dart';
import 'package:get/get.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/data/model/coffee_model.dart';
import '../../../home/presentation/views/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/home_view_model/home_cubit.dart';
import '../../../home/presentation/components/_build_product_item.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final list = favoriteController.getAllFavorite();
            if (list.isNotEmpty) {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    navigatedTo(
                      DetailsView(
                        coffeeModel: list[index],
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ProductItemWidget(
                      coffeeModel: CoffeeModel(
                        description: list[index].description,
                        id: list[index].id,
                        image: list[index].image,
                        ingredients: [],
                        title: list[index].title,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const Text('EMPTY');
            }
          },
        ),
      ),
    );
  }
}
