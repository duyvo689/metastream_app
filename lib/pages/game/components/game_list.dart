import 'package:app_metastream/components/card_skeleton.dart';
import 'package:flutter/material.dart';
import '../../../components/game_card.dart';
import '../../../components/list_game_skeleton.dart';
import '../../../models/game.dart';
import '../../../services/api_game_service.dart';
import '../../game_detail/game_detail.dart';

class GameList extends StatelessWidget {
  const GameList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(children: [
        FutureBuilder<List<Game>>(
          future: ApiGameServices().fetchGame(),
          builder: (context, snapshot) {
            if ((snapshot.hasError) || (!snapshot.hasData))
              return ListGameSkeleton();
            List<Game>? games = snapshot.data;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: 0.66,
              ),
              itemCount: games!.length,
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
            );
          },
        ),
      ]),
    );
  }
}
