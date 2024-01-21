import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/presentation/views/cart_view.dart';
import '../../favorite/data/local_data_soucre/local_database.dart';
import '../../favorite/presenstation/views/favorite_view.dart';
import '../data/model/coffee_model.dart';
import '../data/repository/home_repo.dart';
import 'package:meta/meta.dart';

import '../presentation/views/home_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository = HomeRepository();
  FavoriteLocalDatabase localDatabase = FavoriteLocalDatabase();
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<CoffeeModel> coffeeList = [];
  // GetCoffeeState homeState =
  //     GetCoffeeState(coffeeList: [], error: '', isLoading: false);

  void getHomeData() async {
    try {
      print('i in');
      emit(HomeLoadingState());
      print('i inside');
      final list = await homeRepository.getData();
      coffeeList = list;
      emit(HomeSuccessState(coffeeList: coffeeList));
      print('i end');
    } catch (error) {
      print(error.toString());
      emit(HomeErrorState(error: error.toString()));
    }
  }

  int bottomNavigationCurrentIndex = 0;

  List<Widget> screens = const [
    HomeView(),
    CartView(),
    FavoriteView(),
    //SettingView(),
  ];

  void changeBottomNavigationCurrentIndex(int index) {
    bottomNavigationCurrentIndex = index;
    // if (bottomNavigationCurrentIndex == 0) {
    //   getHomeData();
    // }
    emit(ChangeBottomNavigationCurrentIndexState());
  }

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

  //add favorite product to database
  void addToFavorite(CoffeeModel coffeeModel) {
    localDatabase.addToFavorite(coffeeModel);
    emit(AddToFavoriteState());
  }

  //get favorite product to database
  bool isFavorite(int id) {
    final result = localDatabase.itemIsFavorite(id);
    emit(CheckIsFavoriteState());
    return result;
  }

  //delete favorite product to database
  void deleteFromFavorite(int id) {
    localDatabase.delete(id);
    emit(DeleteFromFavoriteState());
  }

  //get all  favorites product to database
  List<CoffeeModel> getAllFavorite() {
    final result = localDatabase.getAllFavoriteCoffee();
    emit(GetAllFavoritesState());
    return result;
  }

  List<CoffeeModel> searchList = [];
  void search(String name) {
    emit(HomeSearchLoadingState());
    searchList = coffeeList.where((element) {
      return element.title!.toLowerCase().startsWith(name.toLowerCase());
    }).toList();

    emit(HomeSearchState());
  }
}
