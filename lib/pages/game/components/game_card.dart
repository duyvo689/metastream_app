import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';

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
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(color: AppColors.textSecondColor),
            color: AppColors.bgrCardColor),
        child: SizedBox(
          width: getProportionateScreenWidth(160),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.98,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage(travelSport.image),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                width: getProportionateScreenWidth(160),
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      travelSport.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(20),
                              right: getProportionateScreenWidth(20)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: AppColors.bgrButtonColor,
                          onPrimary: AppColors.textPrimaryColor,
                          shadowColor: AppColors.textSecondColor,
                          textStyle: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400)),
                      onPressed: () {},
                      child: const Text('Discover this game'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
