// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable, use_build_context_synchronously, unnecessary_null_comparison

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';

class HeaderGameDetail extends StatefulWidget {
  const HeaderGameDetail({Key? key, required this.gameId}) : super(key: key);
  final String gameId;

  @override
  State<HeaderGameDetail> createState() => _HeaderGameDetailState();
}

class _HeaderGameDetailState extends State<HeaderGameDetail> {
  bool isFollow = false;
  bool isLoadFollow = false;
  User? userInfoMe;
  int count = 0;
  Game? game;

  @override
  void initState() {
    fetchGameById(widget.gameId);
    super.initState();
  }

  Future followGame(String id, String gameId, bool isFollow) async {
    setState(() {
      isLoadFollow = true;
    });
    User response = await ApiGameServices().ApiFollowGame(id, gameId, isFollow);
    context.read<UserInfo>().GetUserInfoProvider(null, response);
    setState(() {
      isLoadFollow = false;
      isFollow ? count-- : count++;
    });
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<Game?> fetchGameById(String id) async {
    Game response = await ApiGameServices().fetchGameById(widget.gameId);
    if (context.read<UserInfo>().userInfo != null && response != null) {
      userInfoMe = context.read<UserInfo>().userInfo;
      print(userInfoMe);
      checkFollower(userInfoMe!.followGame!.toList(), response.id.toString());
    }
    setState(() {
      game = response;
    });
  }

  int checkFollower(List followGameMe, String idUser) {
    int flag = 0;
    for (var i = 0; i < followGameMe.length; i++) {
      if (followGameMe[i] == idUser) {
        flag = 1;
        setState(() {
          isFollow = true;
        });
        break;
      }
    }

    return flag;
  }

  Future<void> _showMyDialog() async {
    return Dialogs.materialDialog(
      color: Colors.white,
      msg: 'You need to log in to your account before you can do this!',
      msgAlign: TextAlign.center,
      msgStyle: const TextStyle(color: Colors.black),
      title: 'notification',
      titleStyle: TextStyle(
          color: Colors.grey[500], fontWeight: FontWeight.bold, fontSize: 18),
      // lottieBuilder: Lottie.asset(
      //   'assets/images/cong_example.json',
      //   fit: BoxFit.contain,
      // ),
      dialogWidth: kIsWeb ? 0.3 : null,
      context: context,
      actions: [
        IconsButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'Cancel',
          iconData: Icons.done,
          color: Colors.grey[400],
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
        IconsButton(
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WalletPhanTom()))
                .then((_) => Navigator.of(context).pop())
                .then((_) => fetchGameById(widget.gameId))
                .then((_) => setState(() {}));
          },
          text: 'Login',
          iconData: Icons.done,
          color: AppColors.dPrimaryDarkColor,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return game != null
        ? Container(
            child: Stack(
            children: [
              AspectRatio(
                aspectRatio: orientation == Orientation.portrait ? 1 : 3,
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
                top: getProportionateScreenHeight(
                    orientation == Orientation.portrait ? 200 : 30),
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          orientation == Orientation.portrait ? 20 : 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            game!.name!,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.dWhileColor,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: userInfoMe != null
                                    ? AppColors.dPrimaryColor
                                    : Colors.grey[400],
                                onPrimary: AppColors.dBlackColor,
                                textStyle: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            onPressed: () {
                              if (context.read<UserInfo>().userInfo != null) {
                                setState(() {
                                  isFollow = !isFollow;
                                });
                                followGame(
                                    context
                                        .read<UserInfo>()
                                        .userInfo!
                                        .id
                                        .toString(),
                                    widget.gameId.toString(),
                                    !isFollow);
                              } else {
                                _showMyDialog();
                              }
                            },
                            child: Text(isFollow
                                ? isLoadFollow
                                    ? 'Following...'
                                    : 'Unfollow'
                                : isLoadFollow
                                    ? 'Unfollowing...'
                                    : 'Follow'),
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
                                text: '${game!.follows! + count}',
                                style: const TextStyle(
                                    color: AppColors.dPrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: ' Followers',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.dWhileColor,
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
                                    text: game!.views.toString(),
                                    style: const TextStyle(
                                        color: AppColors.dPrimaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: ' viewers',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.dWhileColor,
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
          ))
        : const Loading(scale: 8);
  }
}
