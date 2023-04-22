import '../../fetures/cart/data/model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../fetures/home/data/model/coffee_model.dart';

class LocalDatabaseHelper {
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CoffeeModelAdapter());
    Hive.registerAdapter(CartModelAdapter());
    await Hive.openBox<CoffeeModel>('favorites');
    await Hive.openBox<CartModel>('cart');
  }
}
