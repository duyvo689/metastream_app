import 'package:app_metastream/values/app_assets.dart';
import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_metastream/models/video.dart';

import '../../../values/app_size.dart';
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
        color: AppColors.bgrMainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(0)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ...List.generate(
                      topTravelers.length,
                      (index) => CircleVideoCard(
                        video: topTravelers[index],
                      ),
                    ),
                  ],
                ),
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
            const PopularGames()
          ],
        ),
      ),
    );
  }
}

class CircleVideoCard extends StatelessWidget {
  const CircleVideoCard({
    required this.video,
    Key? key,
  }) : super(key: key);

  final Video video;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(right: 20)),
        ClipOval(
          child: Image.asset(
            video.image,
            height: getProportionateScreenHeight(60),
            width: getProportionateScreenWidth(60),
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
