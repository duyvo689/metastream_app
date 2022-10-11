// ignore_for_file: sort_child_properties_last, unnecessary_null_comparison, library_private_types_in_public_api, sized_box_for_whitespace, avoid_print, prefer_is_empty

import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/message_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/pages/pages.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
        filedata = newFileData.reversed.toList();
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void sendButtonMethod() {
    if (formKey.currentState!.validate()) {
      // setState(() {
      //   var value = {
      //     'name': context.read<UserInfo>().userInfo!.userName.toString(),
      //     'pic': context.read<UserInfo>().userInfo!.avatar != null
      //         ? context.read<UserInfo>().userInfo!.avatar.toString()
      //         : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg',
      //     'message': commentController.text
      //   };
      //   filedata.insert(0, value);
      // });
      // setState(() {
      //   MessageModel message;
      //   message.content!.content = commentController.text;
      //   message.user!.avatar = context.read<UserInfo>().userInfo!.avatar != null
      //       ? context.read<UserInfo>().userInfo!.avatar.toString()
      //       : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg';

      // });
      commentController.clear();
      FocusScope.of(context).unfocus();
    } else {
      print("Not validated");
    }
  }

  Widget commentChild(List<MessageModel> data) {
    return ListView(
      shrinkWrap: true,
      children: [
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
                    backgroundImage:
                        NetworkImage(data[i].user!.avatar.toString()),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              title: Text(
                data[i].user!.userName!,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text(
                    data[i].content!.content!,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  data[i].nft != null
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
                                      image: NetworkImage(data[i].nft!.image!),
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
                                    data[i].nft!.name!,
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
                                        data[i].nft!.price.toString(),
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.6;
    return context.read<UserInfo>().userInfo != null
        ? Expanded(
            child: Container(
              height: height,
              child: CommentBox(
                userImage: context.read<UserInfo>().userInfo != null &&
                        context.read<UserInfo>().userInfo!.avatar != null
                    ? context.watch<UserInfo>().userInfo!.avatar
                    : 'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg',
                child: !isLoading
                    ? filedata.length > 0
                        ? commentChild(filedata)
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
          )
        : Expanded(
            child: Container(
              height: height,
              child: Column(
                children: [
                  // Expanded(child: commentChild(filedata)),
                  Expanded(
                    child: !isLoading
                        ? filedata.length > 0
                            ? commentChild(filedata)
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
                  SizedBox(
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
                ],
              ),
            ),
          );
  }
}
