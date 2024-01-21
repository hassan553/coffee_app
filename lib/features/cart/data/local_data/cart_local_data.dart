import 'package:coffee_app/core/networking/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/constants/constants.dart';
import '../model/cart_model.dart';

class CartLocalDatabase {
  final _notesBox = Hive.box<CartModel>(cartBox);
  Future<Either<Failure, Unit>> addToCart(CartModel cartModel) async {
    try {
      await _notesBox.put(cartModel.coffeeModel.id, cartModel);

      getAllCoffeeInCart();
      return right(unit);
    } catch (error) {
      return left(CacheFailure(error.toString()));
    }
  }

  List<CartModel> getAllCoffeeInCart() {
    final allData = _notesBox.values.toList();
    return allData;
  }

  Future<Either<Failure, Unit>> delete(int? id) async {
    try {
      await _notesBox.delete(id);
      return right(unit);
    } catch (error) {
      return left(CacheFailure(error.toString()));
    }
  }

  bool isInCart(int? id) {
    var result = _notesBox.get(
      id,
    );
    return result == null ? false : true;
  }
}
