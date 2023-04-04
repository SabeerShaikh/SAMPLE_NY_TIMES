import 'package:sample_ny_time/app_imports.dart';
import 'package:sample_ny_time/features/dashboard/data/models/popular_news_model.dart';

abstract class NyTimesDataSource {
  Future<PopularNewsModel> getPopularNews();
}

class NyTimesDataSourceImpl implements NyTimesDataSource {
  final CustomHttpClient apiClient;
  NyTimesDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<PopularNewsModel> getPopularNews() async {
    var response;
    try {
      response = await apiClient
          .get(Uri.parse(URL_POPULAR_NEWS + AppStrings.STRING_API_KEY));
    } on Exception {
      throw ServerException();
    }
    Utils.printLogs(URL_POPULAR_NEWS + AppStrings.STRING_API_KEY);

    if (response.statusCode == 200 || response.statusCode == 400) {
      Utils.printLogs(" Response" + response.body);

      final popularNewsModel =
          PopularNewsModel.fromJson(json.decode(response.body));
      Utils.printLogs(" @@@@@");

      Utils.printLogs(popularNewsModel.numResults);
      Utils.printLogs(" &&&&&&");

      return popularNewsModel;
    } else if (response.statusCode == 404) {
      throw ApiException(message: AppStrings.STRING_GENERAL_FAILURE);
    } else {
      throw ServerException();
    }
  }
}
