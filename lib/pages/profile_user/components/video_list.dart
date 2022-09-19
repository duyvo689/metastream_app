import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

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
                return CircleLoading();
              List<Video>? videos = snapshot.data;
              return videos!.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      itemCount: videos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
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
                        );
                      },
                    )
                  : const NoContentProfile(title: "You don't have video!");
            },
          ),
        ),
      ),
    );
  }
}
