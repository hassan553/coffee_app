// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'data_bloc.dart';

class DataState extends Equatable {
   bool isLoading;
   String error;
   List<CoffeeModel> coffeeList;
   DataState({
    required this.isLoading,
    required this.error,
    required this.coffeeList,
  });

  DataState copyWith({
    bool? isLoading,
    String? error,
    List<CoffeeModel>? coffeeList,
  }) {
    return DataState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      coffeeList: coffeeList ?? this.coffeeList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, error, coffeeList];
}
