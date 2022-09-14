import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import '../../../components/skeleton.dart';
import '../../../components/video_cart.dart';
import '../../../models/video.dart';
import '../../../services/api_video_service.dart';
import '../../video_detail/video_page.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 500,
          child: FutureBuilder<List<Video>>(
            future: ApiVideoServices().fetchVideosOfUser(userId),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                return Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (context, index) => VideoSmallCardSkeleton(),
                  ),
                );
              List<Video>? videos = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: videos!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: VideoCard(
                        video: videos[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPage(
                                      video: videos[index],
                                    ))),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class VideoSmallCardSkeleton extends StatelessWidget {
  const VideoSmallCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 190,
        height: 100,
        margin: const EdgeInsets.only(bottom: 20),
        child: SkeletonItem(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: SquareSkeleton(
                  height: 8,
                ),
              ),
              ParagraphSkeleton(
                height: 16,
                width: 100,
                line: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
