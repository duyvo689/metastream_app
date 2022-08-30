import 'package:app_metastream/models/short.dart';
import 'package:app_metastream/models/video_full.dart';
import 'package:flutter/material.dart';
import '../../values/app_colors.dart';
import 'components/body.dart';

class StreamPage extends StatelessWidget {
  const StreamPage({
    Key? key,
    required VideosItem videosItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: Body(),
    );
  }
}
