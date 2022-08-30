import 'package:flutter/material.dart';

import '../../../values/app_size.dart';
import '../../nft_detail/components/table_nft.dart';
import 'carousel_slider.dart';
import 'game_list.dart';
import 'game_upcoming_list.dart';
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
          SizedBox(height: 20),
          SectionTitle(
            title: "Current and Upcoming Mints",
          ),
          SizedBox(height: 20),
          GameUpcomingList(),
          SizedBox(height: 20),
          SectionTitle(
            title: "Current and Upcoming Mints",
          ),
          SizedBox(height: 20),
          TableNFT(),
        ],
      ),
    );
  }
}
