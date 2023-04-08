// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState({
    required this.error,
  });
}

class HomeSuccessState extends HomeState {
  final List<CoffeeModel> coffeeModel;
  HomeSuccessState({
    required this.coffeeModel,
  });
}
