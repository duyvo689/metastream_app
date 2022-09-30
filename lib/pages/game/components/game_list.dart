import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/games_provider.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class GameList extends StatelessWidget {
  const GameList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<GameListProvider>(
      builder: ((context, gameListConsumer, child) {
        return gameListConsumer.gameList != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: size.width < 600 ? 2 : 3,
                    childAspectRatio: 0.66,
                  ),
                  itemCount: gameListConsumer.gameList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GameCard(
                        game: gameListConsumer.gameList![index],
                        press: () => pushNewScreen(
                              context,
                              screen: GameDetail(
                                  gameId: gameListConsumer.gameList![index].id,
                                  collection: gameListConsumer
                                      .gameList![index].addressCollection),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            ));
                  },
                ))
            : ListGameSkeleton(
                columnCount: size.width < 600 ? 2 : 3,
              );
      }),
    );
  }
}
