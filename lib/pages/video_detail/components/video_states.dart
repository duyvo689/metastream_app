import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class VideoStates extends StatefulWidget {
  const VideoStates({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoStates> createState() => _VideoStatesState();
}

class _VideoStatesState extends State<VideoStates> {
  bool isLike = false;
  bool isDisLike = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isLike = !isLike;
                  });
                },
                icon:
                    Icon(isLike ? Icons.thumb_up_alt : Icons.thumb_up_off_alt)),
            const Text(
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
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isDisLike = !isDisLike;
                });
              },
              icon: Icon(
                isDisLike ? Icons.thumb_down_alt : Icons.thumb_down_off_alt,
              ),
            ),
            const Text(
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
        // const SizedBox(width: 30),
        // Column(
        //   children: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.share_outlined),
        //     ),
        //     const Text(
        //       'Share',
        //       textAlign: TextAlign.start,
        //       maxLines: 2,
        //       style: TextStyle(
        //           overflow: TextOverflow.ellipsis,
        //           fontWeight: FontWeight.w400,
        //           fontSize: 13,
        //           color: AppColors.textPrimaryColor),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
