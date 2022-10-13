// ignore_for_file: sort_child_properties_last

import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'comment_box.dart';
import 'default_player.dart';
import 'info_user_video.dart';
import 'name_video.dart';
import 'video_states.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(child: DefaultPlayer(videoSlug: video.slug!)),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameVideo(video: video),
              const VideoStates(),
              const SizedBox(height: 10),
              InfoUserVideo(video: video),
              const SizedBox(height: 10),
            ],
          ),
        ),
        CommentContainer(video: video)
      ],
    );
  }
}
