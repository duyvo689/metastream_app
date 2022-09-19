import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'categories.dart';
import 'header_profile.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.user}) : super(key: key);
  final User user;
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
              HeaderProflie(user: user),
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
                    Categories(
                        addressWallet: user.addressWallet!, userId: user.id!),
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
