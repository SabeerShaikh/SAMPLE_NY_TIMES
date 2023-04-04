import 'package:flutter/material.dart';
import 'package:sample_ny_time/app_imports.dart';
import 'package:sample_ny_time/route/app_pages.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashWidget> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Utils.printLogs('Splash for few seconds !!!');
      CustomNavigator.pushReplace(context, AppPages.PAGE_DASHBOARD);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String strTitle = "Splash Screen NY Times";

    return Scaffold(
        backgroundColor: ColorsConstants.SPLASH_BG,
        body: Center(
          child: Text(
            strTitle,
            style: const TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
