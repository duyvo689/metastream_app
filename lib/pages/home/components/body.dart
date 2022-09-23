import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'popular_video.dart';
import 'popular_game.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 20,
          ),
          _ListUser(),
          SizedBox(height: 20),
          // CarouselWithIndicator(
          //     viewport: 1, width: 30, height: 3, style: 'start'),
          SizedBox(height: 20),
          PopularVideos(),
          SizedBox(height: 20),
          PopularGames(),
          SizedBox(
            height: 30,
          ),
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
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(0)),
      child: FutureBuilder<List<User>>(
        future: ApiUserServices().fetchUsers(),
        builder: (context, snapshot) {
          if ((snapshot.hasError) || (!snapshot.hasData))
            // ignore: curly_braces_in_flow_control_structures
            return Padding(
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
          List<User>? users = snapshot.data!;
          return (SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  users.length,
                  (index) => _CircleVideoCard(
                    user: users[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile(
                                  user: users[index],
                                ))),
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
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
                : 'https://ecdn.game4v.com/g4v-content/uploads/2016/07/lmht_kute-1-480x480.jpg'),
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
