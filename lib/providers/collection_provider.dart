import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class CollectionProvider extends ChangeNotifier {
  List<Collection>? _collectionsSol;
  List<Collection>? _collectionsEth;

  List<Collection>? get collectionSolList => _collectionsSol;
  List<Collection>? get collectionEthList => _collectionsEth;
  Future GetCollectionsProvider() async {
    List<Collection>? collectionSols =
        await ApiCollectionServices().fetchListCollection('sol');
    _collectionsSol = collectionSols;

    // List<Collection>? collectionEths =
    //     await ApiCollectionServices().fetchListCollection('eth');
    // _collectionsEth = collectionEths;

    notifyListeners();
  }
}
