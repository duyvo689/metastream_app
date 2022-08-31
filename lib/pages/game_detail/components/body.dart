import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../models/game.dart';
import 'categories.dart';
import 'header_game_detail.dart';
import 'nft_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.game}) : super(key: key);
  final Game game;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              HeaderGameDetail(game: game),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.4),
                decoration: const BoxDecoration(
                  color: AppColors.bgrCardColor, // video
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: const <Widget>[
                    Categories(),
                    // VideoList(),
                    NFTList(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
