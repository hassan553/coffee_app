import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  AuthRepo authRepo;

  RegisterCubit(this.authRepo) : super(RegisterInitial());

  Future userRegister({
    var name,
    var phone,
    var password,
    var email,
  }) async {
    emit(RegisterLoadingState());
    try {
      authRepo.userRegister(
        email: email,
        password: password,
        phone: phone,
        name: name,
      );
      emit(RegisterSuccessfullyState());
    } catch (error) {
      emit(RegisterErrorState());
    }
  }
}