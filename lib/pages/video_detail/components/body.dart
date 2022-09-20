import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'default_player.dart';
import 'info_user_video.dart';
import 'video_states.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(child: DefaultPlayer(videoId: video.id!)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.name!,
                textAlign: TextAlign.start,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    '0 views',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.textSecondColor),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const VideoStates(),
              const SizedBox(height: 10),
              InfoUserVideo(video: video),
              const SizedBox(height: 20),
              // const NFTList(),
              // const CommentContainer(),
            ],
          ),
        ),
      ],
    ));
  }
}
