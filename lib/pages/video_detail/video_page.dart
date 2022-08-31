import 'package:app_metastream/models/video.dart';
import 'package:flutter/material.dart';
import '../../values/app_colors.dart';
import 'components/body.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({
    Key? key,
    required this.video,
  }) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: Body(video: video),
    );
  }
}
