import 'package:flutter/material.dart';
import 'package:app_metastream/values/app_colors.dart';
import '../../../models/game.dart';
import '../../../services/api_game_service.dart';
import '../../../values/app_size.dart';

class HeaderGameDetail extends StatelessWidget {
  const HeaderGameDetail({Key? key, required this.gameId}) : super(key: key);
  final String gameId;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<Game>(
            future: ApiGameServices().fetchGameById(gameId),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              Game? game = snapshot.data;
              return Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(game!.featureImg!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(0.01)
                        ])),
                  ),
                  Positioned(
                    top: 40,
                    left: 0,
                    child: IconButton(
                      iconSize: 36,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.navigate_before),
                    ),
                  ),
                  Positioned(
                    top: getProportionateScreenHeight(220),
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                game.name!,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.textPrimaryColor,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    primary: AppColors.primaryColor,
                                    onPrimary: AppColors.firstColor,
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                onPressed: () {},
                                child: const Text('following'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: game.follows.toString(),
                                    style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: ' Followers',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textPrimaryColor,
                                              fontSize: 15)),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_rounded,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: game.views.toString(),
                                        style: const TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        children: const <TextSpan>[
                                          TextSpan(
                                              text: ' viewers',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .textPrimaryColor,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
