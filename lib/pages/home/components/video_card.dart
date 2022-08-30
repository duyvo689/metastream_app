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
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(470),
        child: GestureDetector(
          child: Column(
            children: [
              const SizedBox(
                height: 26,
              ),
              AspectRatio(
                aspectRatio: 2.01,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                    image: DecorationImage(
                      image: AssetImage(videosItem.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(videosItem.avatar),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            videosItem.nameVideo,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            videosItem.nameVideo,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.textSecondColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
