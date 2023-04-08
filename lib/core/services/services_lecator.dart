import '../../fetures/auth/data/repository/auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt gitIt = GetIt.instance;

class ServicesLector {
  static init() {
    gitIt.registerLazySingleton(() => AuthRepo());
  }
}
