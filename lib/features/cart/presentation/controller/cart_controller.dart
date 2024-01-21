// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../../../../core/widget/show_awesomeDialog.dart';
import '../../data/local_data_source/cart_local_data.dart';
import '../../data/model/cart_model.dart';

class CartController extends GetxController {
  CartLocalDatabase localData;

  CartController({required this.localData});
  double totalPrice = 0;
  double calculate() {
    final result = getAllCartProducts();
    double sum = 0;
    for (int i = 0; i < result.length; i++) {
      sum += (result[i].price * result[i].counter);
      totalPrice = sum;
      update();
    }

    return sum;
  }

  void addToCart(CartModel cartModel) async {
    final result = await localData.addToCart(cartModel);
    result.fold((l) {
      Get.snackbar('Warning', l.message);
    }, (_) {});
    update();
  }

  List<CartModel> getAllCartProducts() {
    final result = localData.getAllCoffeeInCart();
    return result;
  }

  void delete(int id) {
    localData.delete(id);
    update();
  }

  bool isInCart(int id) {
    final result = localData.isInCart(id);
    return result;
  }

  void incrementCounter(CartModel cartModel) {
    ++cartModel.counter;
    update();
  }

  void decrementCounter(CartModel cartModel) {
    if (cartModel.counter > 1) {
      --cartModel.counter;
      update();
    }
  }
}
