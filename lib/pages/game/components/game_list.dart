import 'package:flutter/material.dart';
import '../../../models/game.dart';
import '../../game_detail/game_detail.dart';
import 'game_card.dart';

class GameList extends StatelessWidget {
  const GameList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          childAspectRatio: 0.66,
        ),
        itemCount: games.length,
        itemBuilder: (BuildContext context, int index) {
          return GameCard(
            game: games[index],
            press: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameDetail(
                          game: games[index],
                        ))),
          );
        },
      ),
    );
  }
}
