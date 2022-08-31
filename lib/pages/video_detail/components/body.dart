import 'package:flutter/material.dart';
import '../../../models/video.dart';
import '../../../values/app_colors.dart';
import 'default_player.dart';
import 'nft_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(child: DefaultPlayer(video: video)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.nameVideo,
                textAlign: TextAlign.start,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '${video.views.toString()} views',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.textSecondColor),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.thumb_up_off_alt,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '542 like',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: AppColors.textPrimaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: const [
                      Icon(
                        Icons.thumb_down_off_alt,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Dislike',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: AppColors.textPrimaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: const [
                      Icon(
                        Icons.share_outlined,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Share',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: AppColors.textPrimaryColor),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(video.avatar),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            video.nameChannel,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: AppColors.textPrimaryColor),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            '0 followers',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: AppColors.textSecondColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Respond to button press
                    },
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 20,
                    ),
                    label: const Text("Following"),
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.secondColor,
                        onPrimary: AppColors.textSecondColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const NFTList(),
            ],
          ),
        ),
      ],
    ));
  }
}
