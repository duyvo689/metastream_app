// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/video_provider.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'section_title.dart';

class PopularVideos extends StatefulWidget {
  const PopularVideos({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularVideos> createState() => _PopularVideosState();
}

class _PopularVideosState extends State<PopularVideos> {
  @override
  void initState() {
    fetchVideos();
    super.initState();
  }

  Future fetchVideos() async {
    await context.read<VideoListProvider>().GetVideoListProvider();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SectionTitle(
          title_1: "Videos",
          title_2: "we think you’ll like",
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Consumer<VideoListProvider>(builder: ((context, videosConSumer, child) {
        List<Video>? videos = videosConSumer.videoList;
        return videos != null
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: size.width < 600 ? 0 : 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const VideoCardSkelton(),
                ),
              );
      }))
    ]);
  }
}
// .reversed.toList().sublist(0, 10)

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
            aspectRatio: 1.9,
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
                  image: CachedNetworkImageProvider(video != null &&
                          video.coverImage != null
                      ? video.coverImage!
                      : 'https://haiquanonline.com.vn/stores/news_dataimages/baohaiquan/072017/17/11/pho-tong-giam-doc-viettel-lan-dau-song-ca-em-cua-ngay-hom-qua-cung-son-tung-m-tp-33-.5569.png'),
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
                    backgroundImage: CachedNetworkImageProvider(video != null &&
                            video.userId != null &&
                            video.userId!.avatar != null
                        ? video.userId!.avatar!
                        : 'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png'),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.dWhileColor)),
                      const SizedBox(height: 6),
                      Text(
                          video.userId != null &&
                                  video.userId!.firstName != null &&
                                  video.userId!.lastName != null
                              ? '${video.userId!.firstName} ${video.userId!.lastName}'
                              : 'Unknow',
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: PrimaryFont.light(14).copyWith(
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
