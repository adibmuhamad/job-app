import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_app/pages/home_page.dart';
import 'package:job_app/pages/splash_page.dart';
import 'package:job_app/providers/job_provider.dart';
import 'package:job_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: whiteColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness:Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JobProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
