import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatoni_calender/splash_screen.dart';

import 'flutterclder.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: false,
        // ),
        // home: FlutterCalender(),
        home: SplashScreen());
  }
}
