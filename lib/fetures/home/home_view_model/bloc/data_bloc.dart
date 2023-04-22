import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/coffee_model.dart';
import '../../data/repository/home_repo.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  HomeRepository homeRepository;
    List<CoffeeModel> coffeeList = [];
  DataBloc(this.homeRepository)
      : super( DataState(coffeeList: [], error: '',isLoading: false)) {
  
    on<DataEvent>((event, emit) async {
      if (event is GetHomeDataEvent) {
        try {
          print('i in');
          emit(state.copyWith(isLoading: true));
          print('i inside');
          final list = await homeRepository.getData();
          coffeeList = list;
          emit(state.copyWith(isLoading: false, coffeeList: list));
          print('i end');
        } catch (error) {
          print(error.toString());
          emit(state.copyWith(isLoading: false, error: error.toString()));
        }
      }
    });
  }
}
