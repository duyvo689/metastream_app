import 'package:app_metastream/models/video.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../values/app_colors.dart';
import 'components/body.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: Body(user: user),
    );
  }
}
