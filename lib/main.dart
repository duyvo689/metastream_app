import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserInfo()),
        ],
        child: DevicePreview(builder: (context) => const MyApp()),
      ),
    );

class UserInfo extends ChangeNotifier {
  User? _userInfo;

  User? get userInfo => _userInfo;

  void increment(User user) {
    _userInfo = user;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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

// void main() => runApp(
//       MultiProvider(providers: [
//         ChangeNotifierProvider(create: (_) => UserInfo()),
//       ], child: const MyApp()),
//     );

// class UserInfo extends ChangeNotifier {
//   User? _userInfo;

//   User? get userInfo => _userInfo;

//   void increment(User user) {
//     _userInfo = user;
//     notifyListeners();
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       home: SplashPage(),
//     );
//   }
// }
