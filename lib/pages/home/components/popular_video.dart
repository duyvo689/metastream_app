import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'section_title.dart';
import 'package:skeletons/skeletons.dart';

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
                itemCount: 3,
                // ignore: prefer_const_constructors
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const VideoCardSkelton(),
                ),
              );
            List<Video>? videos = snapshot.data!.sublist(0, 6);
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
                  childAspectRatio: 1.51,
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

class VideoCardSkelton extends StatelessWidget {
  const VideoCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
        child: Column(
      children: [
        const SquareSkeleton(height: 4),
        const SizedBox(height: 8),
        Row(
          children: const [
            CircleSkeleton(size: 50),
            SizedBox(width: 8),
            ParagraphSkeleton(line: 2, height: 16)
          ],
        ),
      ],
    ));
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
                    radius: 22,
                    backgroundImage: NetworkImage(video != null &&
                            video.userId != null &&
                            video.userId!.avatar != null
                        ? video.userId!.avatar!
                        : 'https://ecdn.game4v.com/g4v-content/uploads/2016/07/lmht_kute-1-480x480.jpg'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.name!,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        video.name!,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textSecondColor,
                        ),
                      ),
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
