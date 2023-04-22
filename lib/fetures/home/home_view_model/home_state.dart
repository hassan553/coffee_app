// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

// class GetCoffeeState extends HomeState {
//   bool? isLoading;
//   String? error;
//   List<CoffeeModel>? coffeeList;

//   GetCoffeeState({
//     bool? isLoading,
//     String? error,
//     List<CoffeeModel>? coffeeList,
//   });

//     GetCoffeeState copyWith({
//     bool? isLoading,
//     String? error,
//     List<CoffeeModel>? coffeeList,
//   }) {
//     return GetCoffeeState(
//       isLoading: isLoading ?? this.isLoading,
//       error: error ?? this.error,
//       coffeeList: coffeeList ?? this.coffeeList,
//     );
//   }

//    @override
//   // TODO: implement props
//   List<Object?> get props => [isLoading,error, coffeeList];

// }

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String? error;
  HomeErrorState({
    this.error,
  });
}

class HomeSuccessState extends HomeState {
  final List<CoffeeModel>? coffeeList;
  HomeSuccessState({
    this.coffeeList,
  });
}

class ChangeBottomNavigationCurrentIndexState extends HomeState {}

class AddToFavoriteState extends HomeState {}

class CheckIsFavoriteState extends HomeState {}

class DeleteFromFavoriteState extends HomeState {}

class GetAllFavoritesState extends HomeState {}

class HomeSearchState extends HomeState {}

class HomeSearchLoadingState extends HomeState {}
