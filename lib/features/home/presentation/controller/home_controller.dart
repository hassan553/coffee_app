// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cart/presentation/views/cart_view.dart';
import '../../../favorite/data/local_data_soucre/local_database.dart';
import '../../../favorite/presenstation/views/favorite_view.dart';
import '../../data/model/coffee_model.dart';
import '../../data/repository/home_repo.dart';
import '../views/home_view.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository;
  FavoriteLocalDatabase localDatabase;
  HomeController({required this.homeRepository, required this.localDatabase});
  List<CoffeeModel> coffeeList = [];
  bool isLoading = false;
  void getHomeData() async {
    isLoading = true;
    update();
    final result = await homeRepository.getData();
    result.fold((l) {
      Get.snackbar('Warning', l.message);
    }, (r) => coffeeList = r);
  }

  int bottomNavigationCurrentIndex = 0;
  void changeBottomNavigationCurrentIndex(int index) {
    bottomNavigationCurrentIndex = index;
    update();
  }

  List<Widget> screens = const [
    HomeView(),
    CartView(),
    FavoriteView(),
  ];
  List<BottomNavigationBarItem> listBottomBar = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      tooltip: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_mall),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'favorite',
    ),
  ];
  bool searchIsLoading = false;
  List<CoffeeModel> searchList = [];
  void search(String name) {
    searchIsLoading = true;
    update();
    searchList = coffeeList.where((element) {
      return element.title!.toLowerCase().startsWith(name.toLowerCase());
    }).toList();
    searchIsLoading = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }
}
