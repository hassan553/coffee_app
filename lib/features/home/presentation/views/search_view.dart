import 'package:coffee_app/core/functions/navigation.dart';
import 'package:coffee_app/fetures/home/home_view_model/home_cubit.dart';
import 'package:coffee_app/fetures/home/presentation/views/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_button.dart';
import '../components/_build_product_item.dart';

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
                      child:const  FittedBox(
                        fit: BoxFit.fill,
                        child:  Text(
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
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final result = HomeCubit.get(context).searchList;
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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) {
            if (value.isNotEmpty) {
              HomeCubit.get(context).search(value);
            }
          },
          onSaved: (value) {
            if (value != null) {
              HomeCubit.get(context).search(value);
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
