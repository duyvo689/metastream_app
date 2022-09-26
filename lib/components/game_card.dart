import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.game,
    this.isFullCard = false,
    required this.press,
  }) : super(key: key);

  final Game game;
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
            border: Border.all(
                width: 2, color: const Color.fromARGB(255, 35, 35, 35)),
            color: AppColors.bgrCardColor),
        child: SizedBox(
          width: getProportionateScreenWidth(160),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.06,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(game.logo!), fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(15)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      game.name!,
                      textAlign: TextAlign.center,
                      style: PrimaryFont.medium(14).copyWith(
                        color: AppColors.dWhileColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenWidth(10)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: AppColors.dBlackColor,
                          onPrimary: AppColors.dWhileColor,
                          shadowColor: AppColors.dGreyLightColor,
                          textStyle: PrimaryFont.light(13)
                              .copyWith(color: AppColors.dWhileColor)),
                      onPressed: () {},
                      child: const Text('Discover this game'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
