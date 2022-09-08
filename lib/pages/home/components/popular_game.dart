import 'package:flutter/material.dart';
import '../../../models/game.dart';
import '../../../services/api_game_service.dart';
import '../../../values/app_size.dart';
import '../../../components/game_card.dart';
import '../../game_detail/game_detail.dart';
import 'section_title.dart';

class PopularGames extends StatefulWidget {
  const PopularGames({Key? key}) : super(key: key);

  @override
  State<PopularGames> createState() => _PopularGamesState();
}

class _PopularGamesState extends State<PopularGames> {
  @override
  void initState() {
    super.initState();
  }

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
          FutureBuilder<List<Game>>(
            future: ApiGameServices().fetchGame(),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              List<Game>? games = snapshot.data!.sublist(0, 6);
              return SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      games!.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                            right: getProportionateScreenWidth(20)),
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
              );
            },
          ),
        ],
      ),
    );
  }
}
