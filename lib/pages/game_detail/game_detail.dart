import 'package:app_metastream/values/app_assets.dart';
import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import './components/body.dart';
import '../../models/game.dart';

class GameDetail extends StatelessWidget {
  const GameDetail({Key? key, required TravelSpot travelSport})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: Body(),
    );
  }
}
