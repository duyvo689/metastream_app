import 'package:flutter/material.dart';
import '../../../components/game_card.dart';
import '../../../models/game.dart';
import '../../../services/api_service.dart';

class GameUpcomingList extends StatelessWidget {
  const GameUpcomingList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          FutureBuilder<List<Game>>(
            future: ApiServices().fetchGame(),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              List<Game>? games = snapshot.data;
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                    press: () {},
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
