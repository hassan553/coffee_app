import 'package:coffee_app/fetures/home/home_view_model/bloc/data_bloc.dart';
import 'package:coffee_app/fetures/home/presentation/views/details.dart';
import 'package:coffee_app/fetures/home/presentation/views/search_view.dart';

import '../../../../core/functions/navigation.dart';
import '../../home_view_model/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_icon.dart';
import '../../../../core/widget/custom_sized_box.dart';
import '../../../../core/widget/custom_text.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DataBloc>(context).add(const GetHomeDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return _homeBody();
  }

  Padding _homeBody() {
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
          BlocBuilder<DataBloc, DataState>(
            buildWhen: (previous, current) => current.coffeeList.isNotEmpty,
            builder: (context, state) {
              final coffeeList = BlocProvider.of<DataBloc>(context).coffeeList;
              if (coffeeList.isNotEmpty) {
                return _buildHomeData(state, context);
              } else if (state.isLoading = true) {
                print('data loading');
                return _buildHomeLoading();
              } else if (state.error.isEmpty) {
                return _buildHomeErrorWidget(state, context);
              } else {
                return TextButton(
                  onPressed: () {
                    BlocProvider.of<DataBloc>(context)
                        .add(const GetHomeDataEvent());
                  },
                  child: CustomText(
                    title: 'Try Again',
                    color: AppColors.orange,
                    fontSize: 18,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Center _buildHomeErrorWidget(DataState state, context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            title: state.error.toString(),
            color: AppColors.orange,
            fontSize: 18,
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<DataBloc>(context).add(const GetHomeDataEvent());
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

  Expanded _buildHomeData(DataState state, context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 10.0, // Space between rows
          crossAxisSpacing: 10.0, // Space between columns
          childAspectRatio:
              1.0, // Ratio between the width and height of each child widget
        ),
        itemCount: HomeCubit.get(context)
            .coffeeList
            .length, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              navigatedTo(DetailsView(coffeeModel: state.coffeeList[index]));
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
                            child: Image.network(
                              state.coffeeList[index].image!.isEmpty ||
                                      state.coffeeList[index].image == null
                                  ? "https://upload.wikimedia.org/wikipedia/commons/f/f6/Mocaccino-Coffee.jpg"
                                  : state.coffeeList[index].image!,
                              width: p1.maxWidth,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          state.coffeeList[index].title!.isEmpty
                              ? 'Mocha'
                              : state.coffeeList[index].title!,
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
