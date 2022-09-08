import 'package:flutter/material.dart';
import '../../../models/user.dart';
import '../../../services/api_user_service.dart';
import '../../../values/app_size.dart';
import '../../profile/profile.dart';
import './carousel_slider.dart';
import 'popular_short.dart';
import 'popular_video.dart';
import 'categories.dart';
import 'popular_game.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(0)),
              child: FutureBuilder<List<User>>(
                future: ApiUserServices().fetchUsers(),
                builder: (context, snapshot) {
                  if ((snapshot.hasError) || (!snapshot.hasData))
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  List<User>? users = snapshot.data;
                  return (SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          users!.length,
                          (index) => CircleVideoCard(
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
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: CarouselWithIndicatorDemo(),
            ),
            Categories(),
            const PopularShorts(),
            const PopularVideos(),
            const PopularGames(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class CircleVideoCard extends StatelessWidget {
  const CircleVideoCard({
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
