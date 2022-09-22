import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

import 'game_list.dart';
import 'section_title.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: const <Widget>[
            CarouselWithIndicator(
                viewport: 0.82, width: 36, height: 3, style: 'center'),
            SizedBox(height: 20),
            SectionTitle(
              title: "Trending Games",
            ),
            SizedBox(height: 20),
            GameList(),
            SizedBox(height: 20),
            // SectionTitle(
            //   title: "Current and Upcoming Mints",
            // ),
            SizedBox(height: 20),
            // GameUpcomingList(),
            // SizedBox(height: 20),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
