import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/functions/get_size.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widget/custom_sized_box.dart';
import '../../../core/widget/custom_text.dart';
import '../../auth/data/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/widget/custom_icon.dart';
import '../../../core/widget/custom_image.dart';
import '../data/model/coffee_model.dart';
import '../data/repository/home_repo.dart';
import '../home_view_model/home_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // AuthRepo().userLogin(email: 'omer@gmail.com',password: '123456');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepository())..getHomeData(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: _homeAppBar(),
        body: _homeBody(),
      ),
    );
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
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeSuccessState) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return _productsWidget(
                          coffeeModel: state.coffeeModel[index + 4]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: state.coffeeModel.length,
                  );
                } else if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.orange,
                    ),
                  );
                } else {
                  return Center(
                    child: CustomText(
                      title: 'Oops An Error',
                      color: AppColors.orange,
                      fontSize: 18,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  AppBar _homeAppBar() {
    return AppBar(
      backgroundColor: AppColors.black,
      leading: InkWell(
        onTap: () {},
        child: CustomAssetsImage(path: 'assets/menu.png'),
      ),
      actions: const [
        InkWell(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 25,
            ),
          ),
        )
      ],
    );
  }

  Container _productsWidget({required CoffeeModel coffeeModel}) {
    return Container(
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
                child: Image.network(
                  coffeeModel.image ??
                      "https://upload.wikimedia.org/wikipedia/commons/f/f6/Mocaccino-Coffee.jpg",
                  width: p1.maxWidth / 2,
                  height: p1.maxHeight,
                  fit: BoxFit.fill,
                ),),
            const SizedBox(width: 10),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    coffeeModel.title ?? 'Mocha',
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
                    coffeeModel.description ??
                        'For all you chocolate lovers out there, you’ll fall in love with a mocha (or maybe you already have). ',
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
    );
  }

  Container _searchBar() {
    return Container(
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
