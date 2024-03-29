import 'package:app_metastream/providers/providers.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                              backgroundImage: CachedNetworkImageProvider(
                                  userInfoConsumer.userInfo != null &&
                                          userInfoConsumer.userInfo!.avatar !=
                                              null
                                      ? userInfoConsumer.userInfo!.avatar
                                          .toString()
                                      : 'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png'),
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
                                maxLines: 2,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${context.read<UserInfo>().userInfo != null ? context.read<UserInfo>().userInfo!.follow : '0'} follow',
                                style: const TextStyle(
                                    color: AppColors.dPrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Categories(),
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
    return Row(
      children: [
        Text("${label}"),
        IconButton(
          onPressed: (() {}),
          icon: icon,
        ),
      ],
    );
  }
}
