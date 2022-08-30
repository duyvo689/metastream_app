import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/game.dart';
import '../../../values/app_size.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.travelSport,
    this.isFullCard = false,
    required this.press,
  }) : super(key: key);

  final TravelSpot travelSport;
  final bool isFullCard;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(150),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 0.8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: AssetImage(travelSport.image), fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              width: getProportionateScreenWidth(150),
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    travelSport.name,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.fiber_manual_record,
                        color: AppColors.primaryColor,
                        size: 13,
                      ),
                      Text(
                        "${travelSport.follower.toString()} Followers",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.textSecondColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
