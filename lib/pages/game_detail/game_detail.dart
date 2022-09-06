import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import '../../models/game.dart';
import './components/body.dart';

class GameDetail extends StatelessWidget {
  const GameDetail({Key? key, required this.game}) : super(key: key);
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: Body(gameId: game.id!),
    );
  }
}
