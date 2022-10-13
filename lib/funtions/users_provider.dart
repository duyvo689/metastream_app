import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class UserList extends ChangeNotifier {
  List<User>? _userList;

  List<User>? get userList => _userList;
  // ignore: non_constant_identifier_names
  Future GetUserListProvider() async {
    List<User>? userList = await ApiUserServices().fetchUsers();
    userList = userList.where((a) => a.avatar != null).toList();
    _userList = userList;
    notifyListeners();
  }
}
