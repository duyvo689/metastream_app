import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class ProfileMe extends StatelessWidget {
  const ProfileMe({
    Key? key,
    this.walletAddr,
  }) : super(key: key);
  final String? walletAddr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgrMainColor,
      body: Body(walletAddr: walletAddr.toString()),
    );
  }
}
