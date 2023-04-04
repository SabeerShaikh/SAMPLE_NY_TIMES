import 'package:dartz/dartz.dart';
import 'package:sample_ny_time/app_imports.dart';
import 'package:sample_ny_time/features/dashboard/data/models/popular_news_model.dart';

abstract class NyTimesRepository {
  Future<Either<Failure, PopularNewsModel>> getPopularNews();
}
