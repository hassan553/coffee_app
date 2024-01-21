part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class GetHomeDataEvent extends DataEvent {
  const GetHomeDataEvent();

  @override
  List<Object> get props => [];
}
