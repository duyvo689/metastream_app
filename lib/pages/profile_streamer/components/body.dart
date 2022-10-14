import 'package:app_metastream/models/live_streaming_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'categories.dart';
import 'header_profile.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.liveStream}) : super(key: key);
  final LiveStream liveStream;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              HeaderProflie(liveStream: widget.liveStream),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.4),
                decoration: const BoxDecoration(
                  color: AppColors.bgrCardColor, // video
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Categories(userId: widget.liveStream.userId!.id.toString())
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
