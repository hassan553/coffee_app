import 'package:coffee_app/fetures/auth/data/repository/auth_repo.dart';
import 'package:coffee_app/fetures/auth/presentation/controller/login_controller.dart';
import 'package:coffee_app/fetures/auth/presentation/controller/register_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(authRepo: AuthRepo()));
    Get.lazyPut(() => RegisterController(authRepo: AuthRepo()));
  }
}
