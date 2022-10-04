import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/live_streaming_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/home/components/popular_video.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'popular_game.dart';
import 'video_live_streaming.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    fetchUserLiveStreaming();
    fetchUserList();
    fetchGameList();
    super.initState();
  }

  Future fetchGameList() async {
    await context.read<GameListProvider>().GetGameListProvider();
  }

  Future fetchUserList() async {
    await context.read<UserList>().GetUserListProvider();
  }

  Future fetchUserLiveStreaming() async {
    await context
        .read<LiveStreamingProvider>()
        .GetUserListProvider(1); //Không cần truyền tham số
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    SizeConfig().init(context);
    return RefreshIndicator(
        color: Colors.white,
        backgroundColor: AppColors.dPrimaryDarkColor,
        onRefresh: () async {
          await fetchUserLiveStreaming();
          await fetchGameList();
        },
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(
                height: 20,
              ),
              context.watch<LiveStreamingProvider>().liveStreamList != null &&
                      // ignore: prefer_is_empty
                      context
                              .watch<LiveStreamingProvider>()
                              .liveStreamList!
                              .length >
                          0
                  ? const _ListStreamer()
                  : const _ListUser(),
              const SizedBox(height: 20),
              const CarouselWithIndicator(
                  viewport: 1, width: 30, height: 3, style: 'start'),
              const SizedBox(height: 20),
              const VideoLiveStreaming(),
              const SizedBox(height: 20),
              const PopularVideos(),
              const SizedBox(height: 20),
              const PopularGames(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}

class _ListStreamer extends StatelessWidget {
  const _ListStreamer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _launchURLApp(String label, String slug) async {
      var url =
          'https://phantom.app/ul/browse/https://staging.metastream.network/${label}/${slug}';
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
        child: Consumer<LiveStreamingProvider>(
            builder: ((context, liveStreamsConsumer, child) {
          return liveStreamsConsumer.liveStreamList != null &&
                  liveStreamsConsumer.liveStreamList!.length > 0
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        liveStreamsConsumer.liveStreamList!.length,
                        (index) => _CircleUserLiveCard(
                          data: liveStreamsConsumer.liveStreamList![index],
                          isLive: liveStreamsConsumer
                                      .liveStreamList![index].status ==
                                  1
                              ? true
                              : false,
                          isUserLive: liveStreamsConsumer.liveStreamList![index]
                                      .streamWithProfileGame ==
                                  true
                              ? false
                              : true,
                          press: liveStreamsConsumer
                                      .liveStreamList![index].status ==
                                  1
                              ? liveStreamsConsumer.liveStreamList![index]
                                          .streamWithProfileGame ==
                                      false
                                  ? () => _launchURLApp(
                                      'live',
                                      liveStreamsConsumer.liveStreamList![index]
                                          .userId!.userName
                                          .toString())
                                  : () => _launchURLApp(
                                      'game',
                                      liveStreamsConsumer.liveStreamList![index]
                                          .gameStream!.slug
                                          .toString()
                                          .toString())
                              : () => pushNewScreen(
                                    context,
                                    screen: ProfileStreamer(
                                        liveStream: liveStreamsConsumer
                                            .liveStreamList![index]),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  ),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) => const _UserCardSkelton(),
                    ),
                  ),
                );
        })));
  }
}

class _CircleUserLiveCard extends StatelessWidget {
  const _CircleUserLiveCard({
    required this.data,
    Key? key,
    required this.press,
    required this.isLive,
    required this.isUserLive,
  }) : super(key: key);
  final LiveStream data;
  final bool isLive;
  final bool isUserLive;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(right: 10)),
          Stack(alignment: Alignment(0, 1), children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: Colors.red,
              child: CircleAvatar(
                radius: isLive ? 32 : 34,
                backgroundImage: NetworkImage(data != null &&
                        data.userId!.avatar != null
                    ? isUserLive
                        ? data.userId!.avatar!
                        : data.gameStream!.logo.toString()
                    : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg'),
              ),
            ),
            isLive
                ? Container(
                    alignment: Alignment.center,
                    height: 16,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Live',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ]),
        ],
      ),
    );
  }
}

class _ListUser extends StatelessWidget {
  const _ListUser({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
        child: Consumer<UserList>(builder: ((context, userListConsumer, child) {
          return userListConsumer.userList != null &&
                  userListConsumer.userList!.length > 0
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        userListConsumer.userList!.length,
                        (index) => _CircleUserCard(
                          user: userListConsumer.userList![index],
                          press: (() => pushNewScreen(
                                context,
                                screen: Profile(
                                    user: userListConsumer.userList![index]),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) => const _UserCardSkelton(),
                    ),
                  ),
                );
        })));
  }
}

class _CircleUserCard extends StatelessWidget {
  const _CircleUserCard({
    required this.user,
    Key? key,
    required this.press,
  }) : super(key: key);
  final User user;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(right: 15)),
          CircleAvatar(
            radius: 34,
            backgroundImage: NetworkImage(user != null && user.avatar != null
                ? user.avatar!
                : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg'),
          ),
        ],
      ),
    );
  }
}

class _UserCardSkelton extends StatelessWidget {
  const _UserCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 70,
      child: const SkeletonItem(
        child: CircleSkeleton(
          size: 70,
        ),
      ),
    );
  }
}
