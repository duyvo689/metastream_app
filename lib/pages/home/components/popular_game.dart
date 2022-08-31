import 'package:flutter/material.dart';
import '../../../models/game.dart';
import '../../../values/app_size.dart';
import '../../game/components/game_card.dart';
import '../../game_detail/game_detail.dart';
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
            height: 30,
          ),
          const SectionTitle(
            title_1: "Games",
            title_2: "we think you’ll like",
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  games.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.only(right: getProportionateScreenWidth(20)),
                    child: GameCard(
                      game: games[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameDetail(
                                    game: games[index],
                                  ))),
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
