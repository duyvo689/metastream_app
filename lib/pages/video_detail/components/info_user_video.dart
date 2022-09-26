import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool isFollow = true;
  void FollowUser(String id, String userId, bool isFollow) async {
    await ApiUserServices().ApiFollowUser(id, userId, isFollow);
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifications',
              style: TextStyle(color: AppColors.dPrimaryColor)),
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
                  style: TextStyle(
                      color: AppColors.dGreyLightColor, fontSize: 16)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Agree',
                  style:
                      TextStyle(color: AppColors.dPrimaryColor, fontSize: 16)),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
                const Text(
                  '0 followers',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.dGreyLightColor),
                ),
              ],
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {
            if (context.read<UserInfo>().userInfo != null) {
              setState(() {
                isFollow = !isFollow;
              });
              FollowUser(context.read<UserInfo>().userInfo!.id.toString(),
                  widget.video.userId!.id.toString(), isFollow);
            } else {
              _showMyDialog();
            }
          },
          icon: Icon(
            isFollow
                ? Icons.notifications_outlined
                : Icons.notifications_active,
            size: 20,
          ),
          label: Text(isFollow ? "Follow" : "Following"),
          style: ElevatedButton.styleFrom(
              primary: AppColors.dWhileColor,
              onPrimary: AppColors.dGreyLightColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}
