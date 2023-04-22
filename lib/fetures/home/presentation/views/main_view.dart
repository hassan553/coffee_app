import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home_view_model/home_cubit.dart';
import '../components/_build_appBar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.black,
          appBar: homeAppBar(),
          body: cubit.screens[cubit.bottomNavigationCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.bottomNavigationCurrentIndex,
            onTap: (value) {
              cubit.changeBottomNavigationCurrentIndex(value);
            },
            iconSize: 40,
            items: cubit.listBottomBar,
          ),
        );
      },
    );
  }
}
