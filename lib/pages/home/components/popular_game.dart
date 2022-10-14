// ignore_for_file: sized_box_for_whitespace

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
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
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer<GameListProvider>(
          builder: ((context, gamelistConsumer, child) {
        return gamelistConsumer.gameList != null &&
                gamelistConsumer.gameList!.length > 0
            ? Column(children: [
                const SectionTitle(
                  title_1: "Games",
                  title_2: "we think you’ll like",
                ),
                const SizedBox(
                  height: 20,
                ),
                size.width < 600
                    ? SingleChildScrollView(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              gamelistConsumer.gameList!.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(
                                    right: getProportionateScreenWidth(20)),
                                child: GameCard(
                                    game: gamelistConsumer.gameList![index],
                                    press: () => pushNewScreen(
                                          context,
                                          screen: GameDetail(
                                              gameId: gamelistConsumer
                                                  .gameList![index].id),
                                          withNavBar: false,
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        )),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          crossAxisCount: 3,
                          childAspectRatio: 0.66,
                        ),
                        itemCount: gamelistConsumer.gameList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GameCard(
                            game: gamelistConsumer.gameList![index],
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameDetail(
                                        gameId: gamelistConsumer
                                            .gameList![index].id,
                                        collection: gamelistConsumer
                                            .gameList![index]
                                            .addressCollection))),
                          );
                        },
                      )
              ])
            : Container(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => const CardSkeleton(),
                ),
              );
        ;
      })),
    );
  }
}
