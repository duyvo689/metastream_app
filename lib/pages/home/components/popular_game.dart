import 'package:flutter/material.dart';
import '../../../models/game.dart';
import '../../../values/app_size.dart';
import 'game_card.dart';
import 'section_title.dart';

class PopularGames extends StatelessWidget {
  const PopularGames({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SectionTitle(
            title_1: "Games",
            title_2: "we think you’ll like",
          ),
          const SizedBox(
            height: 26,
          ),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  travelSpots.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.only(right: getProportionateScreenWidth(20)),
                    child: GameCard(
                      travelSport: travelSpots[index],
                      press: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
