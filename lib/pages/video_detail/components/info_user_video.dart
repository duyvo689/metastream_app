import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class InfoUserVideo extends StatefulWidget {
  const InfoUserVideo({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  State<InfoUserVideo> createState() => _InfoUserVideoState();
}

class _InfoUserVideoState extends State<InfoUserVideo> {
  bool isFollow = false;
  bool isLoadFollow = false;
  User? userInfoMe;
  int count = 0;
  int countFollow = 0;
  User? user;

  @override
  void initState() {
    if (context.read<UserInfo>().userInfo != null) {
      userInfoMe = context.read<UserInfo>().userInfo;
      checkFollower(
          userInfoMe!.follower!.toList(), widget.video.userId!.id.toString());
    }
    context
        .read<UserProvider>()
        .GetUserProvider(widget.video.userId!.id.toString());

    getUserById(widget.video.userId!.id.toString());
    super.initState();
  }

  Future<User?> getUserById(String id) async {
    User response = await ApiUserServices().fetchUserById(id);
    setState(() {
      user = response;
    });
  }

  Future followUser(String id, String userId, bool isFollow) async {
    setState(() {
      isLoadFollow = true;
    });
    User response = await ApiUserServices().ApiFollowUser(id, userId, isFollow);
    // ignore: use_build_context_synchronously
    context.read<UserInfo>().GetUserInfoProvider(null, response);
    // ignore: use_build_context_synchronously
    setState(() {
      isLoadFollow = false;
      isFollow ? count-- : count++;
    });
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  int checkFollower(List followerMe, String idUser) {
    // ignore: unused_local_variable
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
    context
        .read<UserProvider>()
        .GetUserProvider(widget.video.userId!.id.toString());
    return flag;
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
                .then((_) => userInfoMe = context.read<UserInfo>().userInfo)
                .then((_) => checkFollower(userInfoMe!.follower!.toList(),
                    widget.video.userId!.id.toString()))
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            pushNewScreen(
              context,
              screen: Profile(user: user as User),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.video.userId!.avatar!),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.video.userId!.lastName!} ${widget.video.userId!.firstName!}",
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: AppColors.dWhileColor),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${(context.read<UserProvider>().user != null ? context.read<UserProvider>().user!.follow! : 0) + count} followers',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.dGreyLightColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            if (context.read<UserInfo>().userInfo != null) {
              setState(() {
                isFollow = !isFollow;
              });
              followUser(context.read<UserInfo>().userInfo!.id.toString(),
                  widget.video.userId!.id.toString(), !isFollow);
            } else {
              _showMyDialog();
            }
          },
          // onPressed: () {
          //   if (context.read<UserInfo>().userInfo != null) {
          //     setState(() {
          //       isFollow = !isFollow;
          //     });
          //     followUser(context.read<UserInfo>().userInfo!.id.toString(),
          //         widget.video.userId!.id.toString(), isFollow);
          //   } else {
          //     // _showMyDialog();
          //     Dialogs.bottomMaterialDialog(
          //       color: Colors.white,
          //       lottieBuilder: Lottie.asset(
          //         'assets/images/cong_example.json',
          //         fit: BoxFit.contain,
          //       ),
          //       msg: 'Congratulations, you won 500 points',
          //       title: 'Congratulations',
          //       context: context,
          //       actions: [
          //         IconsButton(
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //           text: 'Claim',
          //           iconData: Icons.done,
          //           color: AppColors.dPrimaryDarkColor,
          //           textStyle: TextStyle(color: Colors.white),
          //           iconColor: Colors.white,
          //         ),
          //       ],
          //     );
          //   }
          // },
          icon: Icon(
            isFollow
                ? Icons.notifications_active
                : Icons.notifications_outlined,
            size: 18,
          ),
          label: Text(isFollow
              ? isLoadFollow
                  ? 'Following...'
                  : 'Unfollow'
              : isLoadFollow
                  ? 'Unfollowing...'
                  : 'Follow'),
          style: ElevatedButton.styleFrom(
              primary: AppColors.dWhileColor,
              onPrimary: AppColors.dGreyLightColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}
