import 'package:app_metastream/models/models.dart';
import 'package:flutter/material.dart';

class NameVideo extends StatelessWidget {
  const NameVideo({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.name!,
            textAlign: TextAlign.start,
            maxLines: 2,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          // Row(
          //   children: const [
          //     Text(
          //       '0 views',
          //       textAlign: TextAlign.start,
          //       maxLines: 2,
          //       style: TextStyle(
          //           overflow: TextOverflow.ellipsis,
          //           fontWeight: FontWeight.w400,
          //           fontSize: 14,
          //           color: AppColors.dGreyLightColor),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
