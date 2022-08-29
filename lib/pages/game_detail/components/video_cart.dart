import 'package:app_metastream/values/app_assets.dart';
import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/video_full.dart';
import '../../../values/app_size.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.videosItem,
    required this.press,
  }) : super(key: key);

  final VideosItem videosItem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 180,
              child: AspectRatio(
                aspectRatio: 2.01,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(videosItem.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videosItem.nameVideo,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    videosItem.nameVideo,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.textSecondColor,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye_rounded,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        videosItem.views.toString(),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textSecondColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
