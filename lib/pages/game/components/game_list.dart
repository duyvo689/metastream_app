import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class GameList extends StatelessWidget {
  const GameList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        FutureBuilder<List<Game>>(
          future: ApiGameServices().fetchGame(),
          builder: (context, snapshot) {
            if ((snapshot.hasError) || (!snapshot.hasData))
              // ignore: curly_braces_in_flow_control_structures
              return ListGameSkeleton(
                columnCount: size.width < 600 ? 2 : 3,
              );
            List<Game>? games = snapshot.data;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: size.width < 600 ? 2 : 3,
                childAspectRatio: 0.66,
              ),
              itemCount: games!.length,
              itemBuilder: (BuildContext context, int index) {
                return GameCard(
                    game: games[index],
                    press: () => pushNewScreen(
                          context,
                          screen: GameDetail(
                              gameId: games[index].id,
                              collection: games[index].addressCollection),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        ));
              },
            );
          },
        ),
      ]),
    );
  }
}
