import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: SafeArea(child: Body(user: user)),
    );
  }
}
