// ignore_for_file: prefer_is_empty, curly_braces_in_flow_control_structures

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideoList extends StatelessWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<UserInfo>(builder: (context, userInfoConsumer, child) {
      return userInfoConsumer.userInfo != null
          ? SizedBox(
              height: 500,
              child: FutureBuilder<List<Video>>(
                future: ApiVideoServices().fetchVideosOfUser(
                    userInfoConsumer.userInfo!.id.toString()),
                builder: (context, snapshot) {
                  if ((snapshot.hasError) || (!snapshot.hasData))
                    return const Loading(scale: 6);
                  List<Video>? videos = snapshot.data;
                  return videos!.length > 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
            )
          : const Loading(scale: 6);
    });
  }
}
