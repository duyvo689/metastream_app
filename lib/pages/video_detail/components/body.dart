// ignore_for_file: sort_child_properties_last

import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'comment_box.dart';
import 'default_player.dart';
import 'info_user_video.dart';
import 'name_video.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            DefaultPlayer(videoSlug: video.slug!),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameVideo(video: video),
                  // const VideoStates(),
                  const SizedBox(height: 15),
                  InfoUserVideo(video: video),
                  const SizedBox(height: 18),
                  const Text(
                    'Comment:',
                    style: TextStyle(
                        color: AppColors.dPrimaryDarkColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
        Flexible(child: CommentContainer(video: video))
      ],
    );
  }
}
