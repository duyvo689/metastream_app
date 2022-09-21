import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
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
  // void ffff() {
  //   user = context.watch<UserInfo>().userInfo;
  // }

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    // {
    //   'name': 'Biggi Man',
    //   'pic': 'https://picsum.photos/300/30',
    //   'message': 'Very cool'
    // },
  ];

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
                        color: AppColors.textSecondColor),
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
                color: AppColors.textPrimaryColor),
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
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
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
      userImage: context.watch<UserInfo>().userInfo != null
          ? context.watch<UserInfo>().userInfo!.avatar
          : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg',
      child: commentChild(filedata),
      labelText: 'Write a comment...',
      withBorder: false,
      errorText: 'Comment cannot be blank',
      sendButtonMethod: () {
        if (formKey.currentState!.validate()) {
          setState(() {
            var value = {
              'name': 'Me',
              'pic':
                  'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
              'message': commentController.text
            };
            filedata.insert(0, value);
          });
          commentController.clear();
          FocusScope.of(context).unfocus();
        } else {
          print("Not validated");
        }
      },
      formKey: formKey,
      commentController: commentController,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
    );
  }
}
