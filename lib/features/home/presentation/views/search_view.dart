import 'package:coffee_app/core/functions/navigation.dart';
import 'package:coffee_app/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/app_colors.dart';
import '../components/_build_product_item.dart';
import 'details.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(flex: 3, child: _buildSearchFormWidget()),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      height: 60,
                      color: AppColors.orange,
                      onPressed: () {},
                      child: const FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GetBuilder<HomeController>(
                  builder: (controller) {
                    final result = controller.searchList;
                    if (result.isEmpty) {
                      return Center(
                        child: Lottie.asset('assets/no_items.json'),
                      );
                    } else {
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => navigatedTo(DetailsView(
                            coffeeModel: result[index],
                          )),
                          child: ProductItemWidget(
                            coffeeModel: result[index],
                          ),
                        ),
                        itemCount: result.length,
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchFormWidget() {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return TextFormField(
          onChanged: (value) {
            if (value.isNotEmpty) {
              controller.search(value);
            }
          },
          onSaved: (value) {
            if (value != null) {
              controller.search(value);
            }
          },
          autofocus: true,
          cursorColor: AppColors.white,
          style: const TextStyle(color: AppColors.white),
          decoration: const InputDecoration(
            labelText: 'search',
            labelStyle: TextStyle(color: AppColors.orange),
            focusColor: AppColors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
