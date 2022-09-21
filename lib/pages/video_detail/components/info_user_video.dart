import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class InfoUserVideo extends StatelessWidget {
  const InfoUserVideo({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(video.userId!.avatar!),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${video.userId!.lastName!} ${video.userId!.firstName!}",
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
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}