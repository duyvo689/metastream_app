import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/live_streaming_model.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class ProfileStreamer extends StatelessWidget {
  const ProfileStreamer({Key? key, required this.liveStream}) : super(key: key);
  final LiveStream liveStream;
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
            ? Body(liveStream: liveStream)
            : SafeArea(child: Body(liveStream: liveStream)));
  }
}
