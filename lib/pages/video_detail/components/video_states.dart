import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class VideoStates extends StatelessWidget {
  const VideoStates({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
