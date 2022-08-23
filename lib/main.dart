import 'package:flutter/material.dart';
import './pages/home_page/home_page.dart';
import 'values/app_colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgrColor,
        brightness: Brightness.dark,
        // primarySwatch: Color.red,
      ),
      home: MyHomePage(),
    );
  }
}
