import 'package:app_metastream/pages/phantom_wallet/phantom.dart';
import 'package:flutter/material.dart';

import 'pages/phantom_wallet/phantom2.dart';
import 'pages/splash_page/splash_page.dart';

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
