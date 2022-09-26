import 'package:app_metastream/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'funtions/user_info_provider.dart';

// void main() => runApp(
//       MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => UserInfo()),
//         ],
//         child: DevicePreview(builder: (context) => const MyApp()),
//       ),
//     );

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       home: SplashPage(),
//     );
//   }
// }

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => UserInfo()),
      ], child: const MyApp()),
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
      // home: GameDetail2(),
    );
  }
}
