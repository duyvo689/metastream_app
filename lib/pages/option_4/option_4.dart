import 'package:flutter/material.dart';
import '../../values/app_assets.dart';
import '../../values/app_colors.dart';

class Option4 extends StatelessWidget {
  const Option4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgrMainColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Discover',
                  style: TextStyle(
                      color: AppColors.textPrimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Find your favourite streamer.',
                  style:
                      TextStyle(color: AppColors.textSecondColor, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            child: Image.asset(
              AppAssets.icPhantom,
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Developing...',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.textPrimaryColor),
        ),
      ),
    );
  }
}
