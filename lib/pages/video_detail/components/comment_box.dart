import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/values/values.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'default_player.dart';
import 'info_user_video.dart';
import 'video_states.dart';

class CommentContainer extends StatefulWidget {
  const CommentContainer({Key? key, required this.video}) : super(key: key);
  final Video video;
  @override
  _CommentContainerState createState() => _CommentContainerState();
}

class _CommentContainerState extends State<CommentContainer> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    // {
    //   'name': 'Biggi Man',
    //   'pic': 'https://picsum.photos/300/30',
    //   'message': 'Very cool'
    // },
  ];

  void SendMessage() {
    if (context.read<UserInfo>().userInfo == null) {
      _showMyDialog();
    } else {
      sendButtonMethod();
    }
  }

  void sendButtonMethod() {
    if (formKey.currentState!.validate()) {
      setState(() {
        var value = {
          'name': context.read<UserInfo>().userInfo!.userName.toString(),
          'pic': context.read<UserInfo>().userInfo!.avatar != null
              ? context.read<UserInfo>().userInfo!.avatar.toString()
              : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg',
          'message': commentController.text
        };
        filedata.insert(0, value);
      });
      commentController.clear();
      FocusScope.of(context).unfocus();
    } else {
      print("Not validated");
    }
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

  Widget commentChild(data) {
    return ListView(
      children: [
        SafeArea(child: DefaultPlayer(videoId: widget.video.id!)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.video.name!,
                textAlign: TextAlign.start,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    '0 views',
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.dGreyLightColor),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const VideoStates(),
              const SizedBox(height: 10),
              InfoUserVideo(video: widget.video),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Comments:',
            textAlign: TextAlign.start,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.dWhileColor),
          ),
        ),
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(3.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {},
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(data[i]['pic']),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              title: Text(
                data[i]['name'],
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              subtitle: Text(
                data[i]['message'],
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommentBox(
      userImage: context.read<UserInfo>().userInfo != null &&
              context.read<UserInfo>().userInfo!.avatar != null
          ? context.watch<UserInfo>().userInfo!.avatar
          : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg',
      child: commentChild(filedata),
      labelText: 'Write a comment...',
      withBorder: false,
      errorText: 'Comment cannot be blank',
      sendButtonMethod: () {},
      formKey: formKey,
      commentController: commentController,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      sendWidget: InkWell(
          onTap: () => {SendMessage()},
          child: const Icon(Icons.send_sharp, size: 30, color: Colors.white)),
    );
  }
}
