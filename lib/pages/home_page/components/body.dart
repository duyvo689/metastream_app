import 'package:app_metastream/components/title_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';
import '../../../values/app_size.dart';
import '../../home/components/game_slide.dart';
import '../../home/components/stream_slide.dart';
// import './video_player.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/236x/5c/bc/f3/5cbcf343182841e05774f9999b333624.jpg"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.search),
                          Icon(Icons.question_answer),
                          Icon(Icons.video_call),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SafeArea(
                  child: SingleChildScrollView(
                child: Column(children: const [
                  SizedBox(
                    height: 30,
                  ),
                  StreamSlide(),
                  SizedBox(
                    height: 30,
                  ),
                  GameSlide()
                ]),
              ))),
        ],
      ),
    );
  }
}
