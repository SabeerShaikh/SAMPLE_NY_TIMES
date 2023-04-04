import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_ny_time/app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.green[700], // status bar color
  ));
  runApp(MyApp());
}
