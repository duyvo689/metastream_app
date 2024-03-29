import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() => runApp(
//       MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => UserList()),
//           ChangeNotifierProvider(create: (_) => UserInfo()),
//           ChangeNotifierProvider(create: (_) => UserProvider()),
//           ChangeNotifierProvider(create: (_) => BannerProvider()),
//           ChangeNotifierProvider(create: (_) => GameListProvider()),
//           ChangeNotifierProvider(create: (_) => VideoListProvider()),
//           ChangeNotifierProvider(create: (_) => CollectionProvider()),
//           ChangeNotifierProvider(create: (_) => ListActivitieProvider()),
//           ChangeNotifierProvider(create: (_) => LiveStreamingProvider()),
//         ],
//         child:
//             DevicePreview(enabled: false, builder: (context) => const MyApp()),
//       ),
//     );

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         useInheritedMediaQuery: true,
//         locale: DevicePreview.locale(context),
//         builder: DevicePreview.appBuilder,
//         debugShowCheckedModeBanner: false,
//         title: 'Metastream',
//         theme: ThemeData(
//           brightness: Brightness.dark,
//         ),
//         home: SplashPage());
//   }
// }

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => UserList()),
        ChangeNotifierProvider(create: (_) => UserInfo()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BannerProvider()),
        ChangeNotifierProvider(create: (_) => GameListProvider()),
        ChangeNotifierProvider(create: (_) => VideoListProvider()),
        ChangeNotifierProvider(create: (_) => CollectionProvider()),
        ChangeNotifierProvider(create: (_) => ListActivitieProvider()),
        ChangeNotifierProvider(create: (_) => LiveStreamingProvider()),
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
        home: SplashPage());
  }
}
