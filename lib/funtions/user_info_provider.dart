import 'package:app_metastream/models/models.dart';
import 'package:flutter/material.dart';

class UserInfo extends ChangeNotifier {
  User? _userInfo;

  User? get userInfo => _userInfo;

  void increment(User? user) {
    _userInfo = user;
    notifyListeners();
  }
}
