import 'package:flutter/material.dart';
import 'pages/splash_page/splash_page.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SplashPage(),
    );
  }
}
