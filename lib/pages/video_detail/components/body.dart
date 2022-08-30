import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';
import 'comment_box.dart';
import 'default_player.dart';
import 'nft_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SafeArea(child: DefaultPlayer()),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sınıfında en iyisi | Yeni Macbook Air M2 inceleme',
                textAlign: TextAlign.start,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Row(
                children: const [
                  Text(
                    '4.2K viewers',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    ' Axies Infinity',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: AppColors.primaryColor),
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
                        '542',
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
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avt3.jpeg'),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Kevin Duong',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: AppColors.textPrimaryColor),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '314K followers',
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
