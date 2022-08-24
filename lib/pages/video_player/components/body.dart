import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../components/chewie_list_item.dart';

class PlayerVideo extends StatelessWidget {
  const PlayerVideo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ChewieListItem(
          videoPlayerController: VideoPlayerController.asset(
            'videos/IntroVideo.mp4',
          ),
          looping: true,
        ),
        // ChewieListItem(
        //   videoPlayerController: VideoPlayerController.network(
        //     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        //   ),
        //   looping: false,
        // ),
        // ChewieListItem(
        //   // This URL doesn't exist - will display an error
        //   videoPlayerController: VideoPlayerController.network(
        //     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/error.mp4',
        //   ),
        //   looping: false,
        // ),
      ],
    );
  }
}
