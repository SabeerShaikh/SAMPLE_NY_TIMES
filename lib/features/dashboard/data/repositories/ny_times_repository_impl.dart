import 'package:dartz/dartz.dart';
import 'package:sample_ny_time/app_imports.dart';
import 'package:sample_ny_time/features/dashboard/data/datasources/ny_times_datasource.dart';
import 'package:sample_ny_time/features/dashboard/data/models/popular_news_model.dart';

import 'package:sample_ny_time/features/dashboard/domain/repositories/ny_times_repository.dart';

class NyTimesRepositoryImpl implements NyTimesRepository {
  final NyTimesDataSource dataSource;
  final NetworkInfo networkInfo;
  NyTimesRepositoryImpl({required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, PopularNewsModel>> getPopularNews() async {
    if (await networkInfo.isConnected) {
      try {
        final PopularNewsModel popularNewsModel =
            await dataSource.getPopularNews();
        return Right(popularNewsModel);
      } on ServerException {
        return Left(ServerFailure());
      } on ApiException catch (e) {
        return Left(ApiFailure(message: e.message));
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
