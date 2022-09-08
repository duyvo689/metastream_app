import 'package:flutter/material.dart';
import '../../../models/video.dart';
import '../../../services/api_video_service.dart';
import '../../video_detail/video_page.dart';
import 'section_title.dart';
import 'video_card.dart';

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
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          List<Video>? videos = snapshot.data!.sublist(0, 6);
          return (SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...List.generate(
                  videos!.length,
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
