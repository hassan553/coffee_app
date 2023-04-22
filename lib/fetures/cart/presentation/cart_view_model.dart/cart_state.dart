part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartIncrement extends CartState {}

class CartDecrement extends CartState {}

class CartCalculateTotalPriceState extends CartState {}

class AddToCartState extends CartState {}

class CheckIsInCartState extends CartState {}

class DeleteFromCartState extends CartState {}

class GetAllCartsState extends CartState {}
