import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  // ignore: avoid_init_to_null
  User? _user = null;

  User? get user => _user;
  // ignore: non_constant_identifier_names
  Future GetUserProvider(String id) async {
    User? user = await ApiUserServices().fetchUserById(id);
    _user = user;
    notifyListeners();
  }
}
