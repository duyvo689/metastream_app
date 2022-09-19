import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.video,
    required this.press,
  }) : super(key: key);

  final Video video;
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
                      image: NetworkImage(video != null &&
                              video.coverImage != null
                          ? video.coverImage!
                          : 'https://toquoc.mediacdn.vn/280518851207290880/2022/7/3/photo-1-16564884870661953523091-1656818526769-1656818526969356939449.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 2, right: 2),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(video != null &&
                                video.userId != null &&
                                video.userId!.avatar != null
                            ? video.userId!.avatar!
                            : 'https://ecdn.game4v.com/g4v-content/uploads/2016/07/lmht_kute-1-480x480.jpg'),
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
                            video.name!,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            video.name!,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.textSecondColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
