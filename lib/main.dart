import 'package:app_metastream/pages/pages.dart';
import 'package:flutter/material.dart';

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

// class WalletAddressProvider extends ChangeNotifier {
//   String _walletAddress = '';

//   String get walletAddress => _walletAddress;

//   void assignValue(String address) {
//     _walletAddress = address;
//     notifyListeners();
//   }
// }
