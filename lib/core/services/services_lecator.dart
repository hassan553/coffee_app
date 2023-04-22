import '../../fetures/home/data/repository/home_repo.dart';

import '../../fetures/auth/data/repository/auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt gitIt = GetIt.instance;

class ServicesLector {
  static init() {
    gitIt.registerLazySingleton(() => AuthRepo());
  }
}

// class MyBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<HomeRepository>(() => HomeRepository());

//     Get.lazyPut<HomeController>(
//       ()=>HomeController(),
//     );
//     Get.lazyPut<CartController>(() => CartController());
//   }
// }
