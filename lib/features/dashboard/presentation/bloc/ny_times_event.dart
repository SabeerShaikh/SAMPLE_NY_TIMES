part of 'ny_times_bloc.dart';

abstract class NyTimesEvent extends Equatable {
  const NyTimesEvent();

  @override
  List<Object> get props => [];
}

class GetPopularNewsEvent extends NyTimesEvent {
  const GetPopularNewsEvent();
}

