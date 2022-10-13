import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class VideoListProvider extends ChangeNotifier {
  List<Video>? _videoList;

  List<Video>? get videoList => _videoList;
  // ignore: non_constant_identifier_names
  Future GetVideoListProvider() async {
    List<Video>? videoList = await ApiVideoServices().fetchVideos();
    _videoList = videoList;
    notifyListeners();
  }
}
