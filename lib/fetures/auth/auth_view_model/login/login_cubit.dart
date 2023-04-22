import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    try {
      authRepo.userLogin(
        email: email,
        password: password,
      );
      emit(LoginSuccessfullyState());
    } catch (error) {
      emit(LoginErrorState());
    }
  }
}
