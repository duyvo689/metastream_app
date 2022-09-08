import 'package:app_metastream/models/user.dart';
import 'package:flutter/material.dart';
import '../../../components/video_cart.dart';
import '../../../models/video2.dart';
import '../../../services/api_video_service.dart';
import '../../video_detail/video_page.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 500,
          child: FutureBuilder<List<Video>>(
            future: ApiVideoServices().fetchVideosOfUser(user.id!),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              List<Video>? videos = snapshot.data;
              return ListView.builder(
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
