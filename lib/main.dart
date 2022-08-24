import 'package:flutter/material.dart';
import './pages/home/home_page.dart';
import 'components/chewie_list_item.dart';
import 'package:video_player/video_player.dart';
import 'values/app_colors.dart';
import 'package:flick_video_player/flick_video_player.dart';

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

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: ListView(
//         children: <Widget>[
//           ChewieListItem(
//             videoPlayerController: VideoPlayerController.asset(
//               'videos/IntroVideo.mp4',
//             ),
//             looping: true,
//           ),
//           // ChewieListItem(
//           //   videoPlayerController: VideoPlayerController.network(
//           //     'https://www.youtube.com/watch?v=oWld-WlGvMI',
//           //   ),
//           //   looping: false,
//           // ),
//         ],
//       ),
//     );
//   }
// }
