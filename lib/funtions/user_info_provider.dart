import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class UserInfo extends ChangeNotifier {
  User? _userInfo;

  User? get userInfo => _userInfo;

  // ignore: non_constant_identifier_names
  Future GetUserInfoProvider(String? walletAddr, User? userInfo) async {
    User? user;
    if (walletAddr != null) {
      user = await ApiUserServices()
          .fetchUserByWalletAddress(walletAddr.toString());
      if (user == null) {
        user = await ApiUserServices().ApiCreateUser(walletAddr.toString());
      }
    } else {
      user = userInfo;
    }
    _userInfo = user;
    notifyListeners();
  }
}
