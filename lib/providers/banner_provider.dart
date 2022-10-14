// ignore_for_file: unused_field, prefer_is_empty
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class BannerProvider extends ChangeNotifier {
  List<Carousel> _banners = [];

  List<Carousel> get banners => _banners;
  Future GetBannerProvider() async {
    List<Carousel> carousels = await ApiBannerServices().fetchBanner();
    if (carousels.length > 0) {
      List<Carousel> bannersItem = [];
      for (int i = 0; i < carousels.length; i++) {
        if (carousels[i].type == 'image') {
          bannersItem = [...bannersItem, carousels[i]];
        }
      }
      _banners = bannersItem;
    }
    notifyListeners();
  }
}
