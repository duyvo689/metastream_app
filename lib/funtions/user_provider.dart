import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;
  Future GetUserProvider(String id) async {
    User? user = await ApiUserServices().fetchUserById(id);
    _user = user;
    notifyListeners();
  }
}
