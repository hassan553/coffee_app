// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../../../home/data/model/coffee_model.dart';
import '../../data/local_data_soucre/local_database.dart';

class FavoriteController extends GetxController {
  FavoriteLocalDatabase localDatabase;
  FavoriteController({required this.localDatabase});

  void addToFavorite(CoffeeModel coffeeModel) async {
    final result = await localDatabase.addToFavorite(coffeeModel);
    result.fold((l) {
      Get.snackbar('Warning', l.message);
    }, (_) {});
    update();
  }

  bool isFavorite(int id) {
    final result = localDatabase.itemIsFavorite(id);
    update();
    return result;
  }

  //delete favorite product to database
  void deleteFromFavorite(int id) async {
    final result = await localDatabase.delete(id);
    result.fold((l) {
      Get.snackbar('Warning', l.message);
    }, (_) {});
  }

  //get all  favorites product to database
  List<CoffeeModel> getAllFavorite() {
    final result = localDatabase.getAllFavoriteCoffee();
    update();
    return result;
  }
}
