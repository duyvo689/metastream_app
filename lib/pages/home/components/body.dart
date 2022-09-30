import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import 'popular_game.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    fetchGameList();
    fetchUserList();
    super.initState();
  }

  Future fetchGameList() async {
    await context.read<GameListProvider>().GetGameListProvider();
  }

  Future fetchUserList() async {
    await context.read<UserList>().GetUserListProvider();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RefreshIndicator(
        color: Colors.white,
        backgroundColor: AppColors.dPrimaryDarkColor,
        onRefresh: () async {
          await fetchUserList();
          await fetchGameList();
        },
        // notificationPredicate: (ScrollNotification notification) {
        //   return notification.depth == 1;
        // },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(
              height: 20,
            ),
            _ListUser(),
            SizedBox(height: 20),
            CarouselWithIndicator(
                viewport: 1, width: 30, height: 3, style: 'start'),
            SizedBox(height: 20),
            // PopularVideos(),
            // SizedBox(height: 20),
            PopularGames(),
            SizedBox(
              height: 30,
            ),
          ],
        ));
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
                        (index) => _CircleVideoCard(
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

class _CircleVideoCard extends StatelessWidget {
  const _CircleVideoCard({
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
