import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/models/live_streaming_model.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/api_user_service.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class ProfileStreamer extends StatefulWidget {
  const ProfileStreamer({Key? key, required this.liveStream}) : super(key: key);
  final LiveStream liveStream;

  @override
  State<ProfileStreamer> createState() => _ProfileStreamerState();
}

class _ProfileStreamerState extends State<ProfileStreamer> {
  User? user;
  @override
  void initState() {
    fetchUser(widget.liveStream.userId!.id.toString());
    super.initState();
  }

  Future fetchUser(String id) async {
    User userAsync = await ApiUserServices().fetchUserById(id);
    if (!mounted) return;

    setState(() {
      user = userAsync;
    });
  }

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
      body: user != null
          ? orientation == Orientation.portrait
              ? Body(user: user as User)
              : SafeArea(child: Body(user: user as User))
          : const LoadingCenter(),
    );
  }
}
