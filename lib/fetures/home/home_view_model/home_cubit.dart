import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/coffee_model.dart';
import '../data/repository/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  void getHomeData() async {
    emit(HomeLoadingState());
    try {
      final list = await homeRepository.getData();
      emit(HomeSuccessState(coffeeModel: list));
    } catch (error) {
      emit(HomeErrorState(error: error.toString()));
    }
  }
}
