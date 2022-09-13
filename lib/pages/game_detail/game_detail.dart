import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import '../../models/game.dart';
import './components/body.dart';

class GameDetail extends StatelessWidget {
  const GameDetail({Key? key, this.game, this.gameId}) : super(key: key);
  final Game? game;
  final String? gameId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: Body(gameId: gameId.toString()),
    );
  }
}
