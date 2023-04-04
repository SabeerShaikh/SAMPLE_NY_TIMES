import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sample_ny_time/app_entry.dart';
import 'package:sample_ny_time/app_localizations.dart';
import 'package:sample_ny_time/core/helper/utils.dart';
import 'package:sample_ny_time/route/app_pages.dart';
import 'package:sample_ny_time/route/app_routes.dart' as route;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // final routesArg =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return ScreenUtilInit(
      designSize: Size(376, 812),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Utils.getAppName(),
        //themeMode: ThemeMode.system,
        // To pick the dark/ligt from the phone settings
        //darkTheme: AppThemes.darkTheme,
        // List all the app supported locales here
        supportedLocales: [
          Locale('en', ''),
        ],
        // These delegates make sure that the localization for the proper language is loaded
        localizationsDelegates: [
          // Class that loads the transalations from JSON file
          AppLocalizations.delegate,
          // Built in localizations of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,
          // Built in localizations for text direction - LTR/RTL
          GlobalWidgetsLocalizations.delegate
        ],
        // Returns a locale which will be used by the app
        localeListResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported - NEED TO CHECK
          /*for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }*/

          // If the locale of the device is not supported, use the first one
          return supportedLocales.first;
        },
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        home: AppEntryWidget(),
        initialRoute: AppPages.PAGE_APP_ENTRY,
        onGenerateRoute: route.controller,
      ),
    );
  }
}
