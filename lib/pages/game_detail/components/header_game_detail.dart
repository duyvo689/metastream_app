import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

class HeaderGameDetail extends StatefulWidget {
  const HeaderGameDetail({Key? key, required this.gameId}) : super(key: key);
  final String gameId;

  @override
  State<HeaderGameDetail> createState() => _HeaderGameDetailState();
}

class _HeaderGameDetailState extends State<HeaderGameDetail> {
  bool isFollow = true;

  void FollowGame(String id, String gameId, bool isFollow) async {
    await ApiGameServices().ApiFollowGame(id, gameId, isFollow);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifications',
              style: TextStyle(color: dPrimaryColor)),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('You need a wallet connection to login.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',
                  style: TextStyle(color: dGreyLightColor, fontSize: 16)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Agree',
                  style: TextStyle(color: dPrimaryColor, fontSize: 16)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WalletPhanTom()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<Game>(
            future: ApiGameServices().fetchGameById(widget.gameId),
            builder: (context, snapshot) {
              if ((snapshot.hasError) || (!snapshot.hasData))
                // ignore: curly_braces_in_flow_control_structures
                return Container(
                  child: const Center(
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
                    top: 0,
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
                                onPressed: () {
                                  if (context.read<UserInfo>().userInfo !=
                                      null) {
                                    setState(() {
                                      isFollow = !isFollow;
                                    });
                                    FollowGame(
                                        context
                                            .read<UserInfo>()
                                            .userInfo!
                                            .id
                                            .toString(),
                                        widget.gameId.toString(),
                                        isFollow);
                                  } else {
                                    _showMyDialog();
                                  }
                                },
                                child: Text(isFollow ? "Follow" : "Unfollow"),
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
