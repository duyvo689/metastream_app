import 'package:flutter/material.dart';
import '../../values/app_colors.dart';
import 'components/body.dart';

class ProfileMe extends StatelessWidget {
  const ProfileMe({
    Key? key,
    required this.walletAddr,
  }) : super(key: key);
  final String walletAddr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: Body(walletAddr: walletAddr),
    );
  }
}
