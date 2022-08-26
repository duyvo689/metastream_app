import 'package:flutter/material.dart';
import '../../../models/video_full.dart';
import '../../../values/app_size.dart';
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
          height: 20,
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
                  press: () {},
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
