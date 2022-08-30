import 'package:flutter/material.dart';

import '../../../values/app_size.dart';
import 'carousel_slider.dart';
import 'game_list.dart';
import 'section_title.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: const [
          CarouselWithIndicatorDemo(),
          SizedBox(height: 20),
          SectionTitle(
            title: "Trending Games",
          ),
          SizedBox(height: 20),
          GameList(),
        ],
      ),
    );
  }
}
