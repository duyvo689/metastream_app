import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:flutter/material.dart';

class VideoListProvider extends ChangeNotifier {
  List<Video>? _videoList;

  List<Video>? get videoList => _videoList;
  Future GetVideoListProvider() async {
    List<Video>? videoList = await ApiVideoServices().fetchVideos();
    videoList = videoList.reversed.toList().sublist(0, 8);
    _videoList = videoList;
    notifyListeners();
  }
}
