import 'package:flutter/material.dart';
import 'package:sample_ny_time/app_entry.dart';
import 'package:sample_ny_time/features/dashboard/presentation/pages/dashboard.dart';
import 'package:sample_ny_time/features/dashboard/presentation/pages/popular_news_details.dart';
import 'package:sample_ny_time/route/app_pages.dart';

Route<dynamic> controller(RouteSettings settings) {
  //use settings.arguments to pass arguments in pages
  switch (settings.name) {
    case AppPages.PAGE_APP_ENTRY:
      return MaterialPageRoute(builder: (context) => AppEntryWidget());
    case AppPages.PAGE_DASHBOARD:
      return MaterialPageRoute(builder: (context) => const DashboardPage());
    case AppPages.PAGE_POPULAR_NEWS_DETAILS:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => PopularNewsDetails(),
      );
    default:
      throw ('This route name does not exit');
  }
}
