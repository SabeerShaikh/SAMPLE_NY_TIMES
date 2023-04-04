import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavUtils {
  static pushToRoute(BuildContext context, String strPageName,
      {var arguments}) async {
    var result = await Navigator.of(context, rootNavigator: true)
        .pushNamed(strPageName, arguments: arguments);
    return result;
  }

  // Pop the top view
  static pop(BuildContext context, {var result}) {
    Navigator.pop(context, result);
  }

  // Pops to a particular view
  static popTo(BuildContext context, String strPageName) {
    Navigator.popAndPushNamed(context, strPageName);
  }

  static pushReplace(BuildContext context, String strPageName,
      {var arguments}) {
    Navigator.pushReplacementNamed(context, strPageName, arguments: arguments);
  }

  static popAndPushReplace(BuildContext context, strPageName, {var arguments}) {
    Navigator.pushNamedAndRemoveUntil(context, strPageName, (route) => false,
        arguments: arguments);
  }

  static Future goto(BuildContext context, Widget page,
      {bool replace = false}) {
    // print("the screen is : ${page.toString()}");

    if (replace) {
      return Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (_) => page),
      );
    }

    // return Navigator.push(context, ScaleRotateRoute(page));

    return Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => page),
    );
  }
}