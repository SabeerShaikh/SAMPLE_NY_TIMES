import 'package:dartz/dartz.dart';
import 'package:sample_ny_time/app_imports.dart';
import 'package:sample_ny_time/core/usecases/usecase.dart';
import 'package:sample_ny_time/features/dashboard/data/models/popular_news_model.dart';
import 'package:sample_ny_time/features/dashboard/domain/repositories/ny_times_repository.dart';

class GetPoplularNewsUseCase implements UseCase<PopularNewsModel, NoParams> {
  GetPoplularNewsUseCase(this.repository);

  final NyTimesRepository repository;

  @override
  Future<Either<Failure, PopularNewsModel>> call(NoParams params) async {
    return await repository.getPopularNews();
  }
}
