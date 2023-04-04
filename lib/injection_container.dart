import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sample_ny_time/core/api_client/custom_http_client.dart';
import 'package:sample_ny_time/core/network/network_info.dart';
import 'package:sample_ny_time/features/dashboard/data/datasources/ny_times_datasource.dart';
import 'package:sample_ny_time/features/dashboard/data/repositories/ny_times_repository_impl.dart';
import 'package:sample_ny_time/features/dashboard/domain/repositories/ny_times_repository.dart';
import 'package:sample_ny_time/features/dashboard/domain/usecases/get_popular_news_usecase.dart';
import 'package:sample_ny_time/features/dashboard/presentation/bloc/ny_times_bloc.dart';

final sl = GetIt.instance;

init() async {
  general();

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => CustomHttpClient());
  sl.registerLazySingleton(() => http.Client());
}

void general() {
  sl.registerFactory(() => NyTimesBloc(getPoplularNewsUseCase: sl()));

  sl.registerLazySingleton(() => GetPoplularNewsUseCase(sl()));

  sl.registerLazySingleton<NyTimesRepository>(
      () => NyTimesRepositoryImpl(dataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<NyTimesDataSource>(
      () => NyTimesDataSourceImpl(apiClient: sl()));
}
