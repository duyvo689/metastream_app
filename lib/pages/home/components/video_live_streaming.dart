// ignore_for_file: unnecessary_null_comparison

import 'package:app_metastream/models/live_streaming_model.dart';
import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/utils/utils.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'section_title.dart';

class VideoLiveStreaming extends StatefulWidget {
  const VideoLiveStreaming({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoLiveStreaming> createState() => _VideoLiveStreamingState();
}

class _VideoLiveStreamingState extends State<VideoLiveStreaming> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<LiveStreamingProvider>(
        builder: (context, videoLiveConsumer, child) {
      return videoLiveConsumer.videoLiving != null &&
              videoLiveConsumer.videoLiving!.length > 0
          ? Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SectionTitle(
                    title_1: "Live Stream",
                    title_2: "",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width < 600 ? 0 : 20),
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
                    itemCount: videoLiveConsumer.videoLiving!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _VideoCard(
                          video: videoLiveConsumer.videoLiving![index],
                          isUserLive: videoLiveConsumer.videoLiving![index]
                                      .streamWithProfileGame ==
                                  false
                              ? true
                              : false,
                          press: () {});
                    },
                  ),
                )
              ],
            )
          : const SizedBox.shrink();
    });
  }
}

class _VideoCard extends StatelessWidget {
  const _VideoCard({
    Key? key,
    required this.video,
    required this.press,
    required this.isUserLive,
  }) : super(key: key);

  final LiveStream video;
  final bool isUserLive;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isUserLive
          ? () {
              phantomLaunchURLApp('live/${video.userId!.userName}');
            }
          : () {
              phantomLaunchURLApp('game/${video.gameStream!.slug}');
            },
      child: Column(
        children: [
          Stack(
            alignment: Alignment(0.9, -0.8),
            children: [
              AspectRatio(
                aspectRatio: 2.01,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 24, 24, 24),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(video != null &&
                              video.userId!.avatar != null
                          ? isUserLive
                              ? video.userId!.avatar!
                              : video.gameStream!.logo.toString()
                          : 'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(0, 0),
                height: 26,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: const Icon(
                  Icons.sensors,
                  size: 26,
                ),
                // child: Lottie.asset('assets/images/85430-wave.json'),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, left: 2, right: 2),
            child: Row(
              children: [
                Stack(alignment: const Alignment(0, 1), children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: CachedNetworkImageProvider(video !=
                                  null &&
                              video.userId!.avatar != null
                          ? isUserLive
                              ? video.userId!.avatar!
                              : video.gameStream!.logo.toString()
                          : 'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 15,
                    width: 36,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Live',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ]),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(video.userId!.title!,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.dWhileColor)),
                      const SizedBox(height: 6),
                      Text(video.userId!.title!,
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
