part of 'ny_times_bloc.dart';

abstract class NyTimesState extends Equatable {
  const NyTimesState();

  @override
  List<Object> get props => [];
}

class NyTimesInitial extends NyTimesState {}

class LoadingState extends NyTimesState {}

class GetPopularNewsResponseState extends NyTimesState {
  final PopularNewsModel popularNewsModel;

  const GetPopularNewsResponseState({required this.popularNewsModel});
}

class NyTimesErrorState extends NyTimesState {
  final String errorMessage;

  const NyTimesErrorState({required this.errorMessage});
}
