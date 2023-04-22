import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../favorite/data/local_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/local_data/cart_local_data.dart';
import '../../data/model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  CartLocalDatabase localData = CartLocalDatabase();
  int totalPrice = 0;
  int calculate() {
    final result = getAllCartProducts();
    int sum = 0;
    for (int i = 0; i < result.length; i++) {
      sum += (result[i].price * result[i].counter);
      totalPrice = sum;
      emit(CartCalculateTotalPriceState());
    }

    return sum;
  }

  void addToCart(CartModel cartModel) {
    localData.addToCart(cartModel);
    emit(AddToCartState());
  }

  List<CartModel> getAllCartProducts() {
    final result = localData.getAllCoffeeInCart();
    emit(GetAllCartsState());
    return result;
  }

  void delete(int id) {
    localData.delete(id);
    emit(DeleteFromCartState());
  }

  bool isInCart(int id) {
    final result = localData.isInCart(id);
    emit(CheckIsInCartState());
    return result;
  }

  void incrementCounter(CartModel cartModel) {
    ++cartModel.counter;
    emit(CartIncrement());
  }

  void decrementCounter(CartModel cartModel) {
    if (cartModel.counter > 1) {
      --cartModel.counter;
      emit(CartDecrement());
    }
  }
}
