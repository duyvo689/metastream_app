import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/comment_box.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({
    Key? key,
    required this.video,
  }) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dBlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.dBlackColor,
      ),
      // body: SafeArea(child: CommentContainer(video: video)),
      body: SafeArea(child: Body(video: video)),
    );
  }
}
