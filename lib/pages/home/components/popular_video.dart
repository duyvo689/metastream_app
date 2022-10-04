// ignore_for_file: prefer_const_constructors

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'section_title.dart';

class PopularVideos extends StatelessWidget {
  const PopularVideos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title_1: "Videos",
            title_2: "we think you’ll like",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<List<Video>>(
          future: ApiVideoServices().fetchVideos(),
          builder: (context, snapshot) {
            if ((snapshot.hasError) || (!snapshot.hasData))
              // ignore: curly_braces_in_flow_control_structures
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                // ignore: prefer_const_constructors
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const VideoCardSkelton(),
                ),
              );
            List<Video>? videos = snapshot.data!;
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: size.width < 600 ? 0 : 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // padding: const EdgeInsets.only(top: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: size.width < 600 ? 1 : 2,
                  childAspectRatio: 1.4,
                ),
                itemCount: videos.length,
                itemBuilder: (BuildContext context, int index) {
                  return _VideoCard(
                      video: videos[index],
                      press: () => pushNewScreen(
                            context,
                            screen: VideoPage(video: videos[index]),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          ));
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _VideoCard extends StatelessWidget {
  const _VideoCard({
    Key? key,
    required this.video,
    required this.press,
  }) : super(key: key);

  final Video video;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2.01,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 24, 24, 24),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                image: DecorationImage(
                  image: NetworkImage(video != null && video.coverImage != null
                      ? video.coverImage!
                      : 'https://toquoc.mediacdn.vn/280518851207290880/2022/7/3/photo-1-16564884870661953523091-1656818526769-1656818526969356939449.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 2, right: 2),
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage(video != null &&
                            video.userId != null &&
                            video.userId!.avatar != null
                        ? video.userId!.avatar!
                        : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(video.name!,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.dWhileColor)),
                      const SizedBox(height: 6),
                      Text(video.name!,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: PrimaryFont.light(15).copyWith(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.dGreyLightColor,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
