import 'package:coffee_app/features/auth/data/repository/auth_repo.dart';
import 'package:coffee_app/features/auth/presentation/controller/login_controller.dart';
import 'package:coffee_app/features/cart/data/local_data_source/cart_local_data.dart';
import 'package:coffee_app/features/favorite/data/local_data_soucre/local_database.dart';
import 'package:coffee_app/features/favorite/presenstation/controller/favorite_controller.dart';
import 'package:coffee_app/features/home/data/repository/home_repo.dart';
import 'package:coffee_app/features/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';
import 'features/auth/presentation/controller/register_controller.dart';
import 'features/cart/presentation/controller/cart_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(authRepo: AuthRepo()));
    Get.lazyPut(() => RegisterController(authRepo: AuthRepo()));
    Get.lazyPut(() => CartController(localData: CartLocalDatabase()));
    Get.lazyPut(
        () => FavoriteController(localDatabase: FavoriteLocalDatabase()));
    Get.lazyPut(() => HomeController(
        homeRepository: HomeRepository(),
        localDatabase: FavoriteLocalDatabase()));
        
  }
}
