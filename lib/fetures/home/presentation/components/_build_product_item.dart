import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../../core/widget/custom_cached_network_image.dart';
import '../../data/model/coffee_model.dart';
import '../../../../core/utils/app_colors.dart';

class ProductItemWidget extends StatelessWidget {
  final CoffeeModel coffeeModel;
  const ProductItemWidget({
    Key? key,
    required this.coffeeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      interval: const Duration(seconds: 3),
      child: Container(
        padding: const EdgeInsets.all(3),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            color: AppColors.whiteGray,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.orange)),
        child: LayoutBuilder(
          builder: (p0, p1) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CustomCachedNetworkImage(
                  image: coffeeModel.image!,
                  fit: BoxFit.cover,
                  width: p1.maxWidth / 2,
                  height: p1.maxHeight,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      coffeeModel.title!.isEmpty ? 'Mocha' : coffeeModel.title!,
                      style: const TextStyle(
                        fontSize: 30,
                        color: AppColors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      coffeeModel.description!.isEmpty
                          ? 'For all you chocolate lovers out there, you’ll fall in love with a mocha (or maybe you already have). '
                          : coffeeModel.description!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.gray,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(
                        4,
                        (index) =>
                            const Icon(Icons.star, color: AppColors.orange),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
