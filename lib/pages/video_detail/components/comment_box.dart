// ignore_for_file: sort_child_properties_last

import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/message_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
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

  @override
  void initState() {
    fetchMessages(widget.video.slug!);
    super.initState();
  }

  Future<void> fetchMessages(String slug) async {
    List<MessageModel> messages = await ApiMessageServices().getMessages(slug);
    setState(() {
      filedata = [...messages];
    });
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

  Widget commentChild(data) {
    return ListView(
      children: [
        SafeArea(child: DefaultPlayer(videoSlug: widget.video.slug!)),
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
    return context.read<UserInfo>().userInfo != null
        ? CommentBox(
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
                onTap: () => {sendButtonMethod()},
                child: const Icon(Icons.send_sharp,
                    size: 30, color: Colors.white)),
          )
        : Column(
            children: [
              Expanded(child: commentChild(filedata)),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        primary: AppColors.dPrimaryDarkColor,
                        onPrimary: AppColors.dWhileColor,
                        shadowColor: AppColors.dGreyLightColor,
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WalletPhanTom()))
                          .then((_) => setState(() {}));
                    },
                    child: const Text("Login in to comment"),
                  ),
                ),
              ),
            ],
          );
  }
}
