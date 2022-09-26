import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';

class VideoCardSmall extends StatelessWidget {
  const VideoCardSmall({
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
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
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
                        image: NetworkImage(video != null &&
                                video.coverImage != null
                            ? video.coverImage!
                            : 'https://toquoc.mediacdn.vn/280518851207290880/2022/7/3/photo-1-16564884870661953523091-1656818526769-1656818526969356939449.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video != null && video.name != null
                            ? video.name!
                            : "Unknow",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        video.name!,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.dGreyLightColor,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.remove_red_eye_rounded,
                            size: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '0',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.dGreyLightColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
