import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class VideoList extends StatefulWidget {
  VideoList({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<Video>? videos;

  @override
  void initState() {
    fetchVideosOfUser(widget.userId);
    super.initState();
  }

  Future<void> fetchVideosOfUser(String id) async {
    List<Video>? response = await ApiVideoServices().fetchVideosOfUser(id);
    setState(() {
      videos = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
          height: getProportionateScreenHeight(450),
          child: videos != null
              ? videos!.length > 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      itemCount: videos!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Center(
                            child: VideoCardSmall(
                              video: videos![index],
                              press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoPage(
                                            video: videos![index],
                                          ))),
                            ),
                          ),
                        );
                      },
                    )
                  : const NoContentProfile(title: "User don't have video!")
              : const Loading(scale: 6)),
    );
  }
}
