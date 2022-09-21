import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

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
            future: gameId != null
                ? ApiVideoServices().fetchVideosOfGame(gameId)
                : null,
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData)) {
                return const CircleLoading();
              }
              // ignore: curly_braces_in_flow_control_structures
              List<Video>? videos = snapshot.data;
              return videos != null && videos.length > 0
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
                                child: VideoCardSmall(
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
