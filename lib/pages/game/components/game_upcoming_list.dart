import 'package:flutter/material.dart';
import '../../../models/game.dart';
import 'game_card.dart';

class GameUpcomingList extends StatelessWidget {
  const GameUpcomingList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          childAspectRatio: 0.66,
        ),
        itemCount: travelSpots.length,
        itemBuilder: (BuildContext context, int index) {
          return GameCard(
            travelSport: travelSpots[index],
            press: () {},
          );
        },
      ),
    );
  }
}
