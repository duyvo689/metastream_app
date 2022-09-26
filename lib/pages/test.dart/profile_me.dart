import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'categories.dart';

class GameDetail2 extends StatefulWidget {
  const GameDetail2({Key? key, required this.walletAddr}) : super(key: key);
  final String walletAddr;

  @override
  State<GameDetail2> createState() => _GameDetail2State();
}

class _GameDetail2State extends State<GameDetail2> {
  late User? user;

  @override
  void initState() {
    super.initState();
    FethUser(widget.walletAddr);
  }

  void FethUser(String walletAddr) async {
    if (context.read<UserInfo>().userInfo == null) {
      User? userInfo =
          await ApiUserServices().fetchUserByWalletAddress(walletAddr);
      if (userInfo == null) {
        setState(() {
          user = userInfo;
        });
      }
      context.read<UserInfo>().increment(userInfo);
    }
  }

  void CreateUser(String walletAddr) async {
    if (context.read<UserInfo>().userInfo == null) {
      User? userInfo = await ApiUserServices().ApiCreateUser(walletAddr);
      context.read<UserInfo>().increment(userInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dBlackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 58.5,
                          backgroundImage: NetworkImage(user != null &&
                                  user!.avatar != null
                              ? user!.avatar.toString()
                              : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user != null &&
                                    user!.firstName != null &&
                                    user!.lastName != null
                                ? "${user!.firstName!} ${user!.lastName!}"
                                : "Unknow",
                            style: PrimaryFont.medium(40)
                                .copyWith(color: AppColors.dWhileColor),
                            maxLines: 1,
                          ),
                          Text(
                            user != null && user!.descriptions != null
                                ? user!.descriptions.toString()
                                : "Unknown",
                            style: PrimaryFont.light(20).copyWith(
                                color: AppColors.dGreyLightColor,
                                overflow: TextOverflow.ellipsis,
                                height: 1.2),
                            maxLines: 3,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _StatesButton(
                      icon: Icon(
                        Icons.visibility,
                        size: 35,
                      ),
                      label: '0 views',
                    ),
                    SizedBox(width: 20),
                    _StatesButton(
                      icon: Icon(
                        Icons.favorite_border,
                        size: 35,
                      ),
                      label: '1203k likes',
                    ),
                    SizedBox(width: 20),
                    _StatesButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 35,
                      ),
                      label: '13k follow',
                    ),
                  ],
                ),
                Categories(
                  userId: user!.id.toString(),
                  addressWallet: widget.walletAddr.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatesButton extends StatelessWidget {
  const _StatesButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: (() {}),
          icon: icon,
        ),
        Text("${label}")
      ],
    );
  }
}
