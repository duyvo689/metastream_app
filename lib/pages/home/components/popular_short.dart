import 'package:flutter/material.dart';
import '../../../models/video.dart';
import '../../../services/api_video_service.dart';
import '../../short_video_page/short_page.dart';
import 'section_title.dart';
import 'short_card.dart';

class PopularShorts extends StatelessWidget {
  const PopularShorts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const SectionTitle(
            title_1: "Videos",
            title_2: "Short",
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
              List<Video>? videos = snapshot.data;
              return (SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      videos!.length,
                      (index) => ShortCard(
                        video: videos[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShortVideo(
                                      video: videos[index],
                                    ))),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}
