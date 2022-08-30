import 'package:flutter/material.dart';
import '../../../models/video_full.dart';
import '../../../values/app_size.dart';
import '../../video_detail/watch_page.dart';
import 'section_title.dart';
import 'video_card.dart';

class PopularVideos extends StatelessWidget {
  const PopularVideos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title_1: "Videos",
            title_2: "we think you’ll like",
          ),
        ),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ...List.generate(
                videosItem.length,
                (index) => VideoCard(
                  videosItem: videosItem[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StreamPage(
                                videosItem: videosItem[index],
                              ))),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
