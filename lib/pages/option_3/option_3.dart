import 'package:flutter/material.dart';
import '../../values/app_assets.dart';
import '../../values/app_colors.dart';
import '../phantom_wallet/phantom.dart';
import '../phantom_wallet/phantom2.dart';

class Option3 extends StatelessWidget {
  const Option3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgrMainColor,
        title: const Text(
          'Wallet',
          style: TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: WalletPhanTom(),
    );
  }
}
