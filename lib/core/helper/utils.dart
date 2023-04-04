import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sample_ny_time/app_imports.dart';
import 'package:sample_ny_time/core/constants/string_contants.dart';

class Utils {
  static EdgeInsets getStatusBarSize(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Brightness getCurrentAppTheme(context) {
    return SchedulerBinding.instance.window.platformBrightness;
  }

  static TextTheme getAppTextTheme(context) {
    return Theme.of(context).textTheme;
  }

  static void dismissKeypad(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static String getAppName() {
    return STRING_APP_NAME;
  }

  // Print only in debug builds
  static printLogs(dynamic strData) {
    if (kDebugMode) {
      print(strData);
    }
  }

  static String getAssetName(String fileName) {
    return ImageConstant.STRING_BASE_IMG_PATH + fileName;
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case InternetFailure:
        return AppStrings.STRING_INTERNET_FAILURE;
      case ServerFailure:
        return AppStrings.STRING_SERVER_FAILURE;
      default:
        return AppStrings.STRING_GENERAL_FAILURE;
    }
  }
}
