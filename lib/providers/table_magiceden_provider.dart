import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class ListActivitieProvider extends ChangeNotifier {
  List<MagicEdenNftActivities>? _listActivitie;

  List<MagicEdenNftActivities>? get listActivitie => _listActivitie;
  Future GetListActivitieProvider(String tokenMint) async {
    List<MagicEdenNftActivities>? listActivitie =
        await ApiCollectionServices().fetchMagicEdenNftActivitis(tokenMint);
    _listActivitie = listActivitie;
    notifyListeners();
  }
}
