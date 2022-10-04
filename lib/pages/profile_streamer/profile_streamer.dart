import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class ProfileStreamer extends StatelessWidget {
  const ProfileStreamer({Key? key, required this.user}) : super(key: key);
  final User user;
  // final LiveStream dataStreamer;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.dBlackColor,
      body: orientation == Orientation.portrait
          ? Body(user: user)
          : SafeArea(child: Body(user: user)),
    );
  }
}
