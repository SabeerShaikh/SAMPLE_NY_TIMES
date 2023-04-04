
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Helper {
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
}