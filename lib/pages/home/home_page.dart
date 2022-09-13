import 'package:flutter/material.dart';
import '../../values/app_assets.dart';
import '../../values/app_colors.dart';
import '../phantom_wallet/phantom.dart';
import './components/body.dart';

class MyHomePage extends StatelessWidget {
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
        actions: const <Widget>[PhanTomWallet()],
      ),
      body: Body(),
    );
  }
}
