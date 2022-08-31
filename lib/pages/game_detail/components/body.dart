import 'package:app_metastream/pages/game_detail/components/video_list.dart';
import 'package:app_metastream/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'categories.dart';
import 'header_game_detail.dart';
import 'nft_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
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
              const HeaderGameDetail(),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.4),
                // padding: EdgeInsets.only(
                //   top: size.height * 0.12,
                //   left: 20,
                //   right: 20,
                // ),
                decoration: const BoxDecoration(
                  color: AppColors.bgrCardColor, // video
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: const <Widget>[
                    Categories(),
                    // VideoList(),
                    NFTList(),
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
