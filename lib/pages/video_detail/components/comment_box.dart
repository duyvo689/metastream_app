// ignore_for_file: sort_child_properties_last, unnecessary_null_comparison, library_private_types_in_public_api, sized_box_for_whitespace, avoid_print, prefer_is_empty, unnecessary_new

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/message_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'default_player.dart';
import 'info_user_video.dart';
import 'name_video.dart';
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
  List<MessageModel> filedata = [];
  List currentData = [];
  bool isLoading = false;

  @override
  void initState() {
    fetchMessages(widget.video.slug!);
    super.initState();
  }

  Future<void> fetchMessages(String slug) async {
    setState(() {
      isLoading = true;
    });
    List<MessageModel>? messages = await ApiMessageServices().getMessages(slug);
    if (messages != null) {
      List<MessageModel> newFileData = [...messages];
      setState(() {
        filedata = newFileData;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void sendButtonMethod() async {
    if (formKey.currentState!.validate()) {
      String content = commentController.text;
      setState(() {
        var value = {
          'name': context.read<UserInfo>().userInfo!.userName.toString(),
          'pic': context.read<UserInfo>().userInfo!.avatar != null
              ? context.read<UserInfo>().userInfo!.avatar.toString()
              : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg',
          'message': content
        };
        currentData.insert(0, value);
      });

      commentController.clear();
      FocusScope.of(context).unfocus();

      ///Save database
      await ApiMessageServices().ApiSendMessage(
          widget.video.slug!,
          context.read<UserInfo>().userInfo!.id!,
          // '62f1df752b02e4df1e20696b',
          content,
          '1',
          null);
    } else {
      print("Not validated");
    }
  }

  Widget commentChild(List<MessageModel> filedata, List currentData) {
    return ListView(
      shrinkWrap: true,
      children: [
        SafeArea(child: DefaultPlayer(videoSlug: widget.video.slug!)),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameVideo(video: widget.video),
              const VideoStates(),
              const SizedBox(height: 10),
              InfoUserVideo(video: widget.video),
              const SizedBox(height: 10),
            ],
          ),
        ),
        //List comment from input
        for (var i = 0; i < currentData.length; i++) ...{
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  // ignore: prefer_const_constructors
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        CachedNetworkImageProvider(currentData[i]['pic']),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              title: Text(
                currentData[i]['name'],
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              subtitle: Text(
                currentData[i]['message'],
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          )
        },
        //List comment from database
        for (var i = 0; i < filedata.length; i++) ...{
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
                    backgroundImage: CachedNetworkImageProvider(filedata[i]
                                .user!
                                .avatar !=
                            null
                        ? filedata[i].user!.avatar.toString()
                        : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg'),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              title: Text(
                filedata[i].user!.userName!,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text(
                    filedata[i].content!.content!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  filedata[i].nft != null
                      ? Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: AspectRatio(
                                aspectRatio: 1.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 48, 48, 48),
                                    border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 78, 78, 78),
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          filedata[i].nft!.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filedata[i].nft!.name!,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/solana-sol-icon.svg',
                                        semanticsLabel: 'sol',
                                        width: 14,
                                        height: 14,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        filedata[i].nft!.price.toString(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          )
        },
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.6;
    return context.read<UserInfo>().userInfo == null
        ? Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: CommentBox(
                  userImage: context.read<UserInfo>().userInfo != null &&
                          context.read<UserInfo>().userInfo!.avatar != null
                      ? context.watch<UserInfo>().userInfo!.avatar
                      : 'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png',
                  child: !isLoading
                      ? filedata.length > 0
                          ? commentChild(filedata, currentData)
                          : const Center(
                              child: Text(
                              '0 Comment',
                              style: TextStyle(
                                  color: AppColors.dPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ))
                      : const ListCommentSkeleton(),
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
                ),
              ),
            ),
          )
        : Expanded(
            child: Column(
              children: [
                Expanded(
                  child: !isLoading
                      ? filedata.length > 0
                          ? commentChild(filedata, currentData)
                          : const Center(
                              child: Text(
                              '0 Comment',
                              style: TextStyle(
                                  color: AppColors.dPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ))
                      : const ListCommentSkeleton(),
                ),
                SafeArea(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                      builder: (context) =>
                                          const WalletPhanTom()))
                              .then((_) => setState(() {}));
                        },
                        child: const Text("Login in to comment"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
