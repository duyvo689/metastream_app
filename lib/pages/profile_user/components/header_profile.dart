import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/api_user_service.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';

class HeaderProflie extends StatefulWidget {
  const HeaderProflie({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<HeaderProflie> createState() => _HeaderProflieState();
}

class _HeaderProflieState extends State<HeaderProflie> {
  bool isFollow = false;
  bool isLoadFollow = false;
  User? userInfoMe;
  int count = 0;
  User? userNewFetch;

  @override
  void initState() {
    fetchUser(widget.user.id.toString());
    super.initState();
  }

  Future fetchUser(String id) async {
    User userAsync = await ApiUserServices().fetchUserById(id);
    if (!mounted) return;
    if (context.read<UserInfo>().userInfo != null) {
      userInfoMe = context.read<UserInfo>().userInfo;
      checkFollower(userInfoMe!.follower!.toList(), userAsync.id.toString());
    }

    setState(() {
      userNewFetch = userAsync;
    });
  }

  Future followUser(String id, String userId, bool isFollow) async {
    if (!mounted) return;

    setState(() {
      isLoadFollow = true;
    });
    User response = await ApiUserServices().ApiFollowUser(id, userId, isFollow);
    context.read<UserInfo>().GetUserInfoProvider(null, response);
    if (!mounted) return;

    setState(() {
      isLoadFollow = false;
      isFollow ? count-- : count++;
    });
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _showMyDialog() async {
    return Dialogs.materialDialog(
      color: Colors.white,
      msg: 'You need to log in to your account before you can do this!',
      msgAlign: TextAlign.center,
      msgStyle: const TextStyle(color: Colors.black),
      title: 'Notification',
      titleStyle: TextStyle(
          color: Colors.grey[500], fontWeight: FontWeight.bold, fontSize: 18),
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
                .then((_) => userInfoMe = context.read<UserInfo>().userInfo)
                .then((_) => checkFollower(
                    userInfoMe!.follower!.toList(), widget.user.id.toString()))
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

  int checkFollower(List followerMe, String idUser) {
    int flag = 0;
    for (var i = 0; i < followerMe.length; i++) {
      if (followerMe[i] == idUser) {
        flag = 1;
        setState(() {
          isFollow = true;
        });
        break;
      }
    }
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    String name = widget.user.firstName != null && widget.user.lastName != null
        ? "${widget.user.firstName!} ${widget.user.lastName!}"
        : 'Unknow';
    return Container(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: orientation == Orientation.portrait ? 1 : 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(widget.user != null &&
                          widget.user.avatar != null
                      ? widget.user.avatar!
                      : 'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png'),
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
                orientation == Orientation.portrait ? 200 : 50),
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: orientation == Orientation.portrait ? 20 : 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name.length > 20 ? name.split(' ')[0] + '...' : name,
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
                        // onPressed: () {},
                        onPressed: () {
                          if (context.read<UserInfo>().userInfo != null) {
                            setState(() {
                              isFollow = !isFollow;
                            });
                            followUser(
                                context
                                    .read<UserInfo>()
                                    .userInfo!
                                    .id
                                    .toString(),
                                userNewFetch!.id.toString(),
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
                            text:
                                '${userNewFetch != null ? userNewFetch!.follow! + count : 0}',
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
                              text: const TextSpan(
                                text: '0',
                                style: TextStyle(
                                    color: AppColors.dPrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                children: <TextSpan>[
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
      ),
    );
  }
}
