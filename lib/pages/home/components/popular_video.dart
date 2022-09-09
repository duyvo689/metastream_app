import 'package:flutter/material.dart';
import '../../../components/skeleton.dart';
import '../../../models/video.dart';
import '../../../services/api_video_service.dart';
import '../../video_detail/video_page.dart';
import 'section_title.dart';
import 'video_card.dart';
import 'package:skeletons/skeletons.dart';

class PopularVideos extends StatelessWidget {
  const PopularVideos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 30,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SectionTitle(
          title_1: "Videos",
          title_2: "we think you’ll like",
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      FutureBuilder<List<Video>>(
        future: ApiVideoServices().fetchVideos(),
        builder: (context, snapshot) {
          if ((snapshot.hasError) || (!snapshot.hasData))
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: VideoCardSkelton(),
              ),
            );
          List<Video>? videos = snapshot.data!.sublist(0, 6);
          return (SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...List.generate(
                  videos.length,
                  (index) => VideoCard(
                    video: videos[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoPage(
                                  video: videos[index],
                                ))),
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    ]);
  }
}

class VideoCardSkelton extends StatelessWidget {
  const VideoCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
        child: Column(
      children: [
        SquareSkeleton(height: 5),
        SizedBox(height: 8),
        Row(
          children: [
            CircleSkeleton(size: 50),
            SizedBox(width: 8),
            ParagraphSkeleton(line: 2, height: 16)
          ],
        ),
      ],
    ));
  }
}
