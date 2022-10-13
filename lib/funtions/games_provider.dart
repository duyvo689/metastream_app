import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class GameListProvider extends ChangeNotifier {
  List<Game>? _gameList;

  List<Game>? get gameList => _gameList;
  Future GetGameListProvider() async {
    List<Game>? gameList = await ApiGameServices().fetchGame();
    _gameList = gameList;
    notifyListeners();
  }
}
