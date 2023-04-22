import '../data/model/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart/presentation/views/cart_view.dart';
import '../../favorite/views/favorite_view.dart';
import '../data/repository/home_repo.dart';
import '../presentation/views/home_view.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository = HomeRepository();
  HomeController() {}

  final coffeeList = [].obs;
  bool isLoading = false;
  Future getHomeData() async {
    try {
      isLoading = true;
      coffeeList.value = await homeRepository.getData();
      print(coffeeList);
      isLoading = false;
      update();
    } catch (error) {
      print(error);
      isLoading = false;
    }
  }

  int bottomNavigationCurrentIndex = 0;

  List<Widget> screens = const [
    HomeView(),
    CartView(),
    FavoriteView(),
  ];

  void changeBottomNavigationCurrentIndex(int index) {
    bottomNavigationCurrentIndex = index;
    update();
  }

  List<BottomNavigationBarItem> listBottomBar = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.house,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.card_travel,
      ),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.heart_broken,
      ),
      label: 'favorite',
    ),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHomeData();
  }
}
