import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import './components/body.dart';

class GameDetail extends StatelessWidget {
  const GameDetail({Key? key, this.game, this.gameId, this.collection})
      : super(key: key);
  final Game? game;
  final String? gameId, collection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: Body(gameId: gameId.toString(), collection: collection.toString()),
    );
  }
}
