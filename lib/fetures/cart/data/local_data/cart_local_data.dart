import 'package:hive_flutter/hive_flutter.dart';

import '../../../home/data/model/coffee_model.dart';
import '../model/cart_model.dart';

class CartLocalDatabase {
 
  var notesBox = Hive.box<CartModel>('cart');
  void addToCart(CartModel cartModel) async {
    try {
      await notesBox.put(cartModel.coffeeModel.id, cartModel);
      print('add successfully');
      getAllCoffeeInCart();
    } catch (error) {
      print(error.toString());
    }
  }

  List<CartModel> getAllCoffeeInCart() {
    final allData = notesBox.values.toList();
    return allData;
  }

  void delete(int? id) async {
    try {
      await notesBox.delete(id).then((value) {
        print('delete success');
      });
    } catch (error) {
      print(error.toString());
    }
  }

  bool isInCart(int? id) {
    var result = notesBox.get(
      id,
    );
    return result == null ? false : true;
  }
}
