import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_ny_time/core/helper/utils.dart';
import 'package:sample_ny_time/core/usecases/usecase.dart';
import 'package:sample_ny_time/features/dashboard/data/models/popular_news_model.dart';
import 'package:sample_ny_time/features/dashboard/domain/usecases/get_popular_news_usecase.dart';

part 'ny_times_event.dart';
part 'ny_times_state.dart';

class NyTimesBloc extends Bloc<NyTimesEvent, NyTimesState> {
  final GetPoplularNewsUseCase getPoplularNewsUseCase;

  NyTimesBloc({
    required this.getPoplularNewsUseCase,
  }) : super(NyTimesInitial()) {
    on<GetPopularNewsEvent>((event, emit) async {
      emit(LoadingState());
      final result = await getPoplularNewsUseCase(NoParams());
      await result.fold((failure) {
        emit(NyTimesErrorState(
            errorMessage: Utils.mapFailureToMessage(failure)));
      }, (popularNewsModel) async {
        emit(
          GetPopularNewsResponseState(popularNewsModel: popularNewsModel),
        );
      });
    });
  }
}
