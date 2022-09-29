import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'categories.dart';

class ProfileMe extends StatefulWidget {
  const ProfileMe({Key? key, required this.walletAddr}) : super(key: key);
  final String walletAddr;

  @override
  State<ProfileMe> createState() => _ProfileMeState();
}

class _ProfileMeState extends State<ProfileMe> {
  @override
  void initState() {
    super.initState();
    fetchUser(widget.walletAddr);
  }

  Future fetchUser(String walletAddr) async {
    if (context.read<UserInfo>().userInfo == null) {
      await context.read<UserInfo>().GetUserInfoProvider(walletAddr, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.dBlackColor,
        body: SingleChildScrollView(
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Consumer<UserInfo>(
                  builder: (context, userInfoConsumer, child) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 54,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 52.5,
                              backgroundImage: NetworkImage(userInfoConsumer
                                              .userInfo !=
                                          null &&
                                      userInfoConsumer.userInfo!.avatar != null
                                  ? userInfoConsumer.userInfo!.avatar.toString()
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
                                userInfoConsumer.userInfo != null &&
                                        userInfoConsumer.userInfo!.firstName !=
                                            null &&
                                        userInfoConsumer.userInfo!.lastName !=
                                            null
                                    ? "${userInfoConsumer.userInfo!.firstName!} ${userInfoConsumer.userInfo!.lastName!}"
                                    : "Unknow",
                                style: PrimaryFont.medium(28)
                                    .copyWith(color: AppColors.dWhileColor),
                                maxLines: 1,
                              ),
                              Text(
                                userInfoConsumer.userInfo != null &&
                                        userInfoConsumer
                                                .userInfo!.descriptions !=
                                            null
                                    ? userInfoConsumer.userInfo!.descriptions
                                        .toString()
                                    : "Unknown",
                                style: PrimaryFont.light(16).copyWith(
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
                            size: 28,
                          ),
                          label: '0 views',
                        ),
                        SizedBox(width: 20),
                        _StatesButton(
                          icon: Icon(
                            Icons.favorite_border,
                            size: 28,
                          ),
                          label: '1203k likes',
                        ),
                        SizedBox(width: 20),
                        _StatesButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: 28,
                          ),
                          label: '13k follow',
                        ),
                      ],
                    ),
                    Categories(),
                  ],
                );
              })),
        ));
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
