import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class NameVideo extends StatelessWidget {
  const NameVideo({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 4),
        Row(
          children: const [
            Text(
              '0 views',
              textAlign: TextAlign.start,
              maxLines: 2,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.dGreyLightColor),
            ),
          ],
        ),
      ],
    );
  }
}
