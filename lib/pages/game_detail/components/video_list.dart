import 'package:flutter/material.dart';
import '../../../components/no_content_profile.dart';
import '../../../models/video.dart';
import '../../../components/video_cart.dart';
import '../../../services/api_video_service.dart';
import '../../video_detail/video_page.dart';

class VideoList extends StatelessWidget {
  const VideoList({
    Key? key,
    required this.gameId,
  }) : super(key: key);
  final String gameId;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 500,
          child: FutureBuilder<List<Video>>(
            future: ApiVideoServices().fetchVideosOfGame(gameId),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              List<Video>? videos = snapshot.data;

              return videos!.length > 0
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      itemCount: videos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
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
                            ),
                          ],
                        );
                      },
                    )
                  : const NoContentProfile(title: "Game don't have video!");
            },
          ),
        ),
      ),
    );
  }
}
