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
  int countLike = 0;
  int countDisLike = 0;

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
                    isLike ? countLike++ : countLike--;
                  });
                },
                icon: Icon(
                  isLike ? Icons.thumb_up_alt : Icons.thumb_up_off_alt,
                  size: 24,
                )),
            const SizedBox(height: 5),
            Text(
              '${countLike} like',
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.dWhileColor,
                  height: -0.01),
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
                  isDisLike ? countDisLike++ : countDisLike--;
                });
              },
              icon: Icon(
                isDisLike ? Icons.thumb_down_alt : Icons.thumb_down_off_alt,
                size: 24,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${countDisLike} Dislike',
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.dWhileColor,
                  height: -0.01),
            ),
          ],
        ),
      ],
    );
  }
}
