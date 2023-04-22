import 'package:hive_flutter/hive_flutter.dart';

import '../../../home/data/model/coffee_model.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel extends HiveObject{
  @HiveField(0)
  final CoffeeModel coffeeModel;
  @HiveField(1)
  int counter;
  @HiveField(2)
  final int price;

   CartModel({
    required this.coffeeModel,
    required this.counter,
    required this.price,
  });
}
