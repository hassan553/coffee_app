import 'package:coffee_app/features/home/presentation/controller/home_controller.dart';
import 'package:coffee_app/features/home/presentation/views/details.dart';
import 'package:coffee_app/features/home/presentation/views/search_view.dart';
import 'package:get/get.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/widget/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_icon.dart';
import '../../../../core/widget/custom_sized_box.dart';
import '../../../../core/widget/custom_text.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return _homeBody(context);
  }

  Padding _homeBody(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSizedBox(value: .02),
          _topText(),
          const CustomSizedBox(value: .02),
          _searchBar(),
          const CustomSizedBox(value: .04),
          GetBuilder<HomeController>(
            builder: (controller) {
              final coffeeList = controller.coffeeList;
              if (coffeeList.isNotEmpty) {
                return _buildHomeData(context);
              } else if (controller.isLoading = true) {
                return _buildHomeLoading();
              } else {
                return TextButton(
                  onPressed: () => controller.getHomeData(),
                  child: CustomText(
                      title: 'Try Again',
                      color: AppColors.orange,
                      fontSize: 18),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Center _buildHomeErrorWidget(context) {
    final controller = Get.find<HomeController>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            title: 'Something wrong please try later',
            color: AppColors.orange,
            fontSize: 18,
          ),
          TextButton(
            onPressed: () {
              controller.getHomeData();
            },
            child: CustomText(
              title: 'Try Again',
              color: AppColors.orange,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Center _buildHomeLoading() {
    return Center(
      child: Lottie.asset('assets/coffee_loading.json'),
    );
  }

  Expanded _buildHomeData(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 10.0, // Space between rows
          crossAxisSpacing: 10.0, // Space between columns
          childAspectRatio:
              1.0, // Ratio between the width and height of each child widget
        ),
        itemCount: controller.coffeeList.length, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              navigatedTo(
                  DetailsView(coffeeModel: controller.coffeeList[index]));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Card(
                color: AppColors.whiteGray,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LayoutBuilder(
                    builder: (p0, p1) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CustomCachedNetworkImage(
                              image: controller.coffeeList[index].image!,
                              width: p1.maxWidth,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          controller.coffeeList[index].title!.isEmpty
                              ? 'Mocha'
                              : controller.coffeeList[index].title!,
                          style: const TextStyle(
                            fontSize: 25,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: const TextSpan(
                            text: '\$ ',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '20',
                                style: TextStyle(
                                  color: AppColors.gray,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _searchBar() {
    return InkWell(
      onTap: () => navigatedTo(const SearchView()),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.gray,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: CustomIcon(
                  iconData: Icons.search, size: 35, color: AppColors.whiteGray),
            ),
            const SizedBox(width: 20),
            CustomText(
              title: 'Find your coffee',
              color: AppColors.whiteGray,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }

  CustomText _topText() {
    return CustomText(
      title: 'Find the best\nCoffee for you',
      color: Colors.white,
      fontSize: 35,
      fontWeight: FontWeight.w500,
    );
  }
}
