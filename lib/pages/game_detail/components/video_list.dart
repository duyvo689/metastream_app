import 'package:flutter/material.dart';
import '../../../models/video_full.dart';
import '../../../values/app_size.dart';
import 'video_cart.dart';

class VideoList extends StatelessWidget {
  const VideoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 500,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8),
              itemCount: videosItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: VideoCard(
                      videosItem: videosItem[index],
                      press: () {},
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
