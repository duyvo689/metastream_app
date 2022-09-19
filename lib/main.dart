import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/splash_page/splash_page.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WalletAddressProvider()),
        ],
        child: const MyApp(),
      ),
    );

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
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => SplashPage(),
      //   'GameDetail': (context) => GameDetail(),
      // },
    );
  }
}

class WalletAddressProvider extends ChangeNotifier {
  String _walletAddress = '';

  String get walletAddress => _walletAddress;

  void assignValue(String address) {
    _walletAddress = address;
    notifyListeners();
  }
}
