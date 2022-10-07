import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class CollectionProvider extends ChangeNotifier {
  List<Collection>? _collections;

  List<Collection>? get collectionList => _collections;
  // ignore: non_constant_identifier_names
  Future GetCollectionsProvider() async {
    List<Collection>? collectionList =
        await ApiCollectionServices().fetchListCollection();
    _collections = collectionList;
    notifyListeners();
  }
}
