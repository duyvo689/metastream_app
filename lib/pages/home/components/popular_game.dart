import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
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
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) => CardSkeleton(),
                  ),
                );
              List<Game>? games = snapshot.data;
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
                                        gameId: games[index].id,
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
