import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class ShortCard extends StatelessWidget {
  const ShortCard({
    Key? key,
    required this.video,
    this.isFullCard = false,
    required this.press,
  }) : super(key: key);

  final Video video;
  final bool isFullCard;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: getProportionateScreenWidth(160),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(2),
                        bottomLeft: Radius.circular(2),
                        bottomRight: Radius.circular(2),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(video.coverImage!),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 0.0,
                  bottom: getProportionateScreenHeight(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.name!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      const Text(
                        '#short#minecaft#minecrafthacks',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "160 views",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.textPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
